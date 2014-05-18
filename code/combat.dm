/*
combat.dm

Pretty much everything related to Killin' Dudes. Also handles death and respawns.
*/

mob/game

	proc

		Attack()
			if(!hit_target)
				return 0
			if(key && recent_kills && recent_kills.Find(hit_target))
				mess("You have already killed that person recently.")
				hit_target = null
				del(hit_target_marker)
				return 0
			if(key && hit_target.key && pknewbie)
				mess("You are still under newbie protection, you may not attack other players!")
				hit_target = null
				del(hit_target_marker)
				return 0
			if(key && hit_target.key && hit_target.pknewbie)
				mess("That player is a newbie, you may not attack them.")
				hit_target = null
				del(hit_target_marker)
				return 0
			if(get_dist(src, hit_target) <= 2 && src.z == hit_target.z)
				if(key && hit_target.key && hit_target.recent_kills.Find(src))
					hit_target.recent_kills -= src
				if(hit_target.key && !hit_target.attacker && !attacker)// && !hit_target.recent_kills.Find(src))
					attacker = 1
					mess("You are the hostile attacker.")
				if(!hit_target.hit_target)
					v_setattack(hit_target, src)
				var/to_hit = 0
				var/damage = 0

				to_hit = SkillCheckExp("combat", exp=5, lose_stamina=2) + 40
				to_hit -= hit_target.SkillCheckExp("shielding", exp=5, lose_stamina=2) / 2

				// for every 5 combat, add 1 damage
				// for every 10 attack, add 1 damage
				damage = GetSkillMod("combat", 5) + (attack/10)

				// for every 5 shielding, remove 1 damage
				// for every 10 defense, remove 1 damage
				damage -= hit_target.GetSkillMod("shielding", 5) + (hit_target.defense/10)

				// static (damage-2) rounding for low damage fighting, and (damage*0.7) for high damage fighting
				damage = round(rand(min(damage-2,damage*0.7), damage))

				fighting = FIGHTING_DURATION
				hit_target.fighting = FIGHTING_DURATION

				if(damage <= 0)
					combat_mess("You tink [hit_target]. (0)","[src] tinks [hit_target]. (0)")
					Effect_MeleeTink(hit_target)
				else if(prob(to_hit))
					combat_mess("You strike [hit_target]. ([damage])","[src] strikes [hit_target]. ([damage])")
					Effect_MeleeHit(hit_target)
					hit_target.Damage(damage, src)
					if(hit_target.key)
						hit_target.current_fight[src] += damage
				else
					combat_mess("You swing at [hit_target] but miss. (0)","[src] swings at [hit_target] but misses. (0)")
					Effect_MeleeMiss(hit_target)



		Damage(mod, attacker)
			ChangeHP(-mod, deathcheck=0)
			DeathCheck(attacker)

		// Change their HP and also create blood if necessary. Update health bars too.
		ChangeHP(mod, deathcheck=1)
			hp += mod
			if(mod < 0)
				s_damage(src, abs(mod), "#B00000")
				if(!istype(src.loc, /turf/water))
					var/obj/system/blood/O = locate(/obj/system/blood) in loc
					if(!O)
						O = new (loc)
						O.icon_state = pick("0", "10", "20")
					O.timer = 600
					if(prob(10))
						if(O.icon_state != 2 && O.icon_state != 12 && O.icon_state != 22)
							O.icon_state = "[text2num(O.icon_state) + 1]"
				if(!client && !hp_bar)
					hp_bar = new ()
					hp_bar.pixel_y = -16
			if(hp > maxhp)
				hp = maxhp
			UpdateHP()
			if(deathcheck)
				DeathCheck()

		ChangeStamina(mod)
			stamina += mod
			if(stamina > maxstamina)
				stamina = maxstamina
			DeathCheck()

		DeathCheck()
			if(stamina <= 0)
				Die("of exhaustion")
			if(hp <= 0)
				var/killers
				var/totaldamage = 0
				for(var/mob/game/x in current_fight)
					totaldamage += current_fight[x]
				for(var/mob/game/x in current_fight)
					debug("[x] has [current_fight[x]]")
					var/damage = current_fight[x]
					if(damage >= totaldamage / 5)
						if(x.key && !src.attacker)
							x.AddKill(src)//x.recent_kills[src] = 72000
						debug("[x] is a killer!")
						if(killers)
							killers += ", "
						killers += "[x.name]"
				if(killers)
					Die("at the hands of [killers]")
				else
					Die("in a tragic accident")

		AddKill(mob/game/M)
			recent_kills[M] = 72000
			if(recent_kills.len > 3)
				info("[src] is a murderer!")
				mess("You are suffering the murder penalty!")
				mess("Your actions will take twice as long for the next hour.")
				murderer = 36000
/*			if(recent_kills.len > 4)
				*/

		DieNPC()
			src.loc = null
			spawn(1)
				del(src)

		Die(cause)
			if(!istype(src.loc, /turf/water))
				var/obj/system/blood/O = locate(/obj/system/blood) in loc
				if(!O)
					O = new (loc)
					O.icon_state = pick("2", "12", "22")
				O.timer = 600
				if(text2num(O.icon_state) < 2)
					O.icon_state = "2"
				else if(text2num(O.icon_state) < 12)
					O.icon_state = "12"
				else if(text2num(O.icon_state) < 22)
					O.icon_state = "22"
			if(!src.key)
				return DieNPC()
			target = null
			del(target_marker)
			hit_target = null
			del(hit_target_marker)
			for(var/mob/game/M in world)
				if(M.hit_target == src)
					M.hit_target = null
					del(M.hit_target_marker)
			for(var/atom/movable/A in followers)
				A.following = null
			followers = list()
			hp = 1
			stamina = 1
			hunger = 0
			thirst = 0
			del(action)
			src.mess("You are dead.")
			info("[src] has died [cause]!")
			current_song_duration = 99990
			/*Music(MUSIC_STOP)
			var/songs[] = list('sounds/Death.ogg'=99990)
			PlayMusic(songs)*/
			current_fight = list()
			var/obj/game/corpse/C = new /obj/game/corpse(src.loc)
			C.name = "[src]'s corpse"
			C.owner = src.name
			var/amt
			for(var/obj/game/O in src)
				if(O.equipped_on)
					v_equip(O)
				if(O.amount > 1)
					amt = round(O.amount/2)
					mess("You drop [amt] [O.name].")
					MoveStack(O, C, amt)
					continue
				if(prob(50))
					mess("You drop [O.name].")
					O.loc = C
					continue
			for(var/skill/S in skill_list)
				S.exp = 0
			mess("You have lost some skill experience.")
			var/turf/respawnAt = locate("startpoint")

			DieScene(respawnAt)

			sleep(5)
			hp = maxhp
			stamina = maxstamina
			if(action) del action
			Respawn(respawnAt)
			//Music(MUSIC_STOP)
			//Music(999)









		DieScene(turf/respawnAt)
			var/client/client = src.client
			var/atom/oldloc = loc
			client.eye = loc
			Transfer(null)
			ResetIcon()

			sight = SEE_TURFS|SEE_OBJS

			var/atom/movable/action/act = new
			action = act
			act.Setup("Dead", 'mob.dmi', "enemy")
			spawn act.Run(src, src, PAC_SELF, -1)

			client.primary_effect.screen_loc = "WEST,SOUTH to EAST,NORTH"
			client.primary_effect.icon = 'lighting.dmi'
			client.primary_effect.icon_state = "fog1"

			client.eye = oldloc

			for(var/x = 1, x < 9, x++)
				client.primary_effect.icon_state = "fog[x]"
				sleep(2)

			client.primary_effect.icon_state = "black"
			sleep(2)
			winset(client, "mapPane.message", "is-visible=true")
			client << output("You are dead. (100)", "mapPane.message")
			client.view = "21x17"
			sleep(100)

/*			client.primary_effect.icon_state = "light"
			client.primary_effect.screen_loc = "WEST,SOUTH to EAST,NORTH"
			sleep(5)
			client.primary_effect.icon_state = ""
			sleep(10)
			client.primary_effect.icon_state = "white"*/
			sleep(5)
			for(var/x = 9, x > 4, x--)
				client.primary_effect.icon_state = "fog[x]"
				sleep(2)
/*			sleep(5)
			client.view = "19x15"
			sleep(10)
			client.view = "21x17"*/
			sleep(15)
			var x1=oldloc.x, x2=respawnAt.x
			var y1=oldloc.y, y2=respawnAt.y
			var/steep = abs(y1 - y2) > abs(x1 - x2)
			var/flipped = 0
			var/list/steps = list()
			if(steep)
				var/t = x1
				x1 = y1
				y1 = t
				t = x2
				x2 = y2
				y2 = t
			if(x1 > x2)
				var/t = x1
				x1 = x2
				x2 = t
				t = y1
				y1 = y2
				y2 = t
				flipped = 1
			var/dx = x2 - x1
			var/dy = abs(y2 - y1)
			var/e = 0
			var/de = dy / dx
			var/ystep = y1 < y2 ? 1 : -1
			var/cy = y1
			var/sl = 7
			for(var/cx = x1; cx <= x2; cx++)
				if(steep) steps.Add(locate(cy, cx, 1))
				else steps.Add(locate(cx, cy, 1))
				e += de
				if(e >= 0.5)
					cy += ystep
					--e

			if(flipped)
				for(var/i = steps.len; i >= 1; i--)
					client.eye = steps[i]
					sleep(sl)
					if(sl > 1) --sl
			else
				for(var/i = 1; i <= steps.len; i++)
					client.eye = steps[i]
					sleep(sl)
					if(sl > 1) --sl



		Respawn(turf/respawnAt)
			winset(client, "mapPane.message", "is-visible=false")
			sight = 0
			client.view = "17x13"
			Transfer(respawnAt)
			client.eye = src
			hp = maxhp
			stamina = maxstamina
			hunger = 0
			thirst = 0
			client.show_interface(1)
			client.primary_effect.icon_state = "white"
			sleep(5)
			client.primary_effect.icon_state = "light"
			sleep(5)
			client.primary_effect.icon = null



/*
mob procs.dm

There's a lot going on in this file - too much, in fact.

- Messaging functions (so all messages display in the style/theme of the game)
- Music handler
- Tick handling, includes regen, stamina and timers
- Skill delay management (e.g. how long does each skill take)
- Inventory management, drop/get/equip
- House ownership, adding and removing owners

*/


mob/game
	proc
		mess(msg, msg2)
			OutputTo("<B><font color = \"blue\">[msg]", CHAN_PUBLIC)
			if(msg2)
				for(var/mob/game/m in oview(src))
					m.OutputTo("<B><font color = \"blue\">[msg2]", CHAN_PUBLIC)

		combat_mess(msg, msg2)
			OutputTo("<B><font color = \"#900000\">[msg]", CHAN_PUBLIC)
			if(msg2)
				for(var/mob/game/m in oview(src))
					m.OutputTo("<B><font color = \"#900000\">[msg2]", CHAN_PUBLIC)

		bonus_mess(msg, msg2)
			OutputTo("<B><font color = \"#00A000\">[msg]", CHAN_PUBLIC)
			if(msg2)
				for(var/mob/game/m in oview(src))
					m.OutputTo("<B><font color = \"#00A000\">[msg2]", CHAN_PUBLIC)

	proc
		/*Music(action)
			if(!current_song)
				PlayMusic(GetMusic())
			switch(action)
				if(MUSIC_FADE_OUT)
					for(var/x = current_song.volume, x >= 0, x -= volume/10)
						current_song.volume = x
						current_song.status = SOUND_UPDATE
						src << current_song
						sleep(2)
				if(MUSIC_FADE_IN)
					for(var/x = current_song.volume, x <= volume, x += volume/10)
						current_song.volume = x
						current_song.status = SOUND_UPDATE
						src << current_song
						sleep(2)
				if(MUSIC_STOP)
					current_song.volume = 0
					current_song.status = SOUND_UPDATE
					previous_song = current_song.file
					src << sound(channel=1)
					del(current_song)
				if(MUSIC_PLAY)
					current_song.status = SOUND_UPDATE
					src << current_song

		ChangeMusicZone(msg)
			if(client)
				if(msg)
				else
					Music(MUSIC_FADE_OUT)
					Music(MUSIC_STOP)
					Music(999)

		PlayMusic(songs[])
			var/song
			var/song_duration
			while(!song)
				song = pick(songs)
				song_duration = songs[song]
			debug("[src]: Playing [song] for [song_duration]")
			if(current_song)
				Music(MUSIC_STOP)
			current_song = new /sound(song, volume=volume, wait=0, channel=1)
			current_song_duration = song_duration
			if(z == 1)
				current_song.environment = 19
			if(z == 2)
				current_song.environment = 8
			current_song.status = 0
			src << current_song
			Music(MUSIC_PLAY)

		GetMusic()
			var/songs[] = list()
			if(z == 1)
				songs += list('sounds/Town.ogg'=1254) //2.05.44
				songs += list('sounds/Town3.ogg'=566) //56.63
				//songs += list('sounds/Travel1.ogg'=2457) //4.05.68
				songs += list('sounds/Travel2.ogg'=502) //50.23
				songs += list('sounds/Travel3.ogg'=1080) //1.48.09
				songs += list('sounds/Jungle.ogg'=522) //52.19
			if(z == 2)
				songs += list('sounds/Dungeon1.ogg'=1014) //1.41.40
				songs += list('sounds/Dungeon2.ogg'=560) //56.05
				songs += list('sounds/Evil4.ogg'=1290) //1.29.36
			for(var/S in songs)
				if(S == current_song || S == previous_song)
					songs -= S
			return songs*/

		UpdateHP()
			if(hp_bar)
				var/temp = hp / maxhp * 14
				temp = round(temp)
				if(temp == 0 && hp > 0)
					temp = 1
				if(hp_bar.icon_state != "[temp]")
					overlays.Remove(hp_bar)
					hp_bar.icon_state = "[temp]"
					overlays.Add(hp_bar)

		UpdateStats()
			var/hp_percent = hp / maxhp
			var/stamina_percent = stamina / maxstamina
			hp_percent *= 100
			stamina_percent *= 100
			winset(src, "mainPane.hp_bar", "value=[hp_percent]")
			winset(src, "mainPane.stamina_bar", "value=[stamina_percent]")

		UpdateWeights()
			var/new_weight = 0
			for(var/obj/game/O in src.contents)
				new_weight += O.weight * O.amount
			weight_held = new_weight

		SetLighting()
			if(luminosity != 0)
				sd_SetLuminosity(4)
				for(var/obj/game/O in src)
					if(O.luminosity > luminosity)
						sd_SetLuminosity(O.luminosity)

		ConfirmBuy(obj/game/item/O)
			//npc_obj_selected = O
			winset(src, "move_item.input", "text=[O.amount]")
			winset(src, "move_item", "is-visible=true")
			winset(src, "move_item.items", "current-cell=1")
			src << output(O, "move_item.items")

		InvenFind(type)
			var/objs[] = list()
			for(var/obj/O in src.contents)
				if(O.type in typesof(type))
					objs += O
			if(objs.len)
				return objs
			else
				objs += 0
				return objs

		HasTool(action, autoequip=1)
			var/objs[] = list()
			var/type
			switch(action)
				if("water")
					type = /obj/game/item/water_container
					objs = InvenFind(type)
					for(var/obj/game/item/water_container/O in objs)
						if(O.savvalue1)
							return O
					return 0
				if("lumberjack")
					type = /obj/game/item/tools/axe
				if("fish")
					type = /obj/game/item/tools/fishing
				if("till")
					type = /obj/game/item/tools/hoe
				if("excavate")
					type = /obj/game/item/tools/shovel
				if("mine")
					type = /obj/game/item/tools/pickaxe
			var/obj/game/item/O = equipment[EQUIP_WEAPON]
			if(O)
				if(istype(O, type))
					return O
			if(autoequip)
				objs = InvenFind(type)
				if(objs.len)
					O = objs[1]
					v_equip(O)
					return O
			return 0

		WeatherSet(msg)
			if(key && client)
				if(z == 1)
					client.primary_weather.icon = 'weather effects.dmi'
					client.primary_weather.icon_state = msg
				if(z == 2)
					WeatherClear()

		WeatherClear()
			if(key && client && client.primary_weather)
				client.primary_weather.icon = null

		Tick()
			/*if(key)
				if(current_song_duration)
					current_song_duration -= 1
				if(current_song_duration <= 0)
					if(current_song)
						Music(MUSIC_STOP)
					Music(999)*/

		TickSecond() // one second
			spawn(10)
				TickSecond()
			time_online += 1
			exp_per_hour = expsession / (time_online / (60 * 60))
			time_online_session += 1
			if(client)
				if(client.inactivity < 600)
					if(pknewbie)
						pknewbie -= 10
					if(murderer)
						murderer -= 10
					time_active += 1
					time_active_session += 1
				else
					if(client.inactivity <= 609)
						time_active -= 60
						time_active_session -= 60

		TickRegen(cycle)
			if(!key)
				ChangeHP(1)
				if(!fighting)
					ChangeHP(round(maxhp/20))
				if(fighting)
					fighting--
					if(!fighting)
						attacker = 0
				return
			SetLighting()
			var/mod = SkillCheckExp("survival", exp=pick(0,0,0,1), lose_stamina=0)
			mod = max(mod, 50)
			hunger += 4 * (100 / mod)
			thirst += 10 * (100 / mod)
			if(src.hunger >= 18900)
				if(!admin)
					src.Die("of hunger")
			else if(src.hunger >= 17000 && cycle == 9)
				src.mess("You are starving!")
			else if(src.hunger >= 13000 && cycle == 9)
				src.mess("You are hungry.")
			else if(src.hunger < 0)
				src.hunger = 0
			if(src.thirst >= 18900)
				if(!admin)
					src.Die("of thirst")
			else if(src.thirst >= 17000 && cycle == 9)
				src.mess("You are parched!")
			else if(src.thirst >= 13000 && cycle == 9)
				src.mess("You are thirsty.")
			else if(src.thirst < 0)
				src.thirst = 0
			if(hp_regen)
				ChangeHP(round(mod/20))
				hp_regen--
			if(stamina_regen)
				ChangeStamina(round(mod/3))
				stamina_regen--
			if(fullness)
				fullness--
			if(fighting)
				fighting--
				if(!fighting)
					mess("Your pulse slows down.")
					attacker = 0
					if(key)
						current_fight = list()
			UpdateHP()
			if(client)
				if(recent_kills)
					for(var/x in recent_kills)
						recent_kills[x] -= 30
						if(recent_kills[x] <= 0)
							recent_kills -= x
				if(hp < maxhp/4 || stamina < 150)
					//src << sound('low_stats.wav', wait=0, channel=2, volume=volume)
					var/obj/system/flick/O = new (delay=8)
					O.screen_loc = "NORTH-1,EAST-1"
					O.icon = 'GUI.dmi'
					O.icon_state = "warning"
					client.screen += O
				client.show_interface()
			if(!client && key)
				if(!fighting && !action)
					Logout()

		UpdateOffset()
			src.pixel_x = 0
			src.pixel_x += src.x_loc * (6 + rand(1))
			src.pixel_y = pixel_y_tree
			src.pixel_y += src.y_loc * (6 + rand(1)) + 3
			if(src.y_loc < 0)
				src.layer = src.layer_base + 1
			else
				src.layer = src.layer_base


		Delay(msg, extra = 0)
			var/delay = 0
			if(debug["fast actions"])
				return 0
			switch(msg)
				if("survival")
					delay = max(10, round(extra * 1/3 - GetSkillMod("survival", 5)))
				if("loot")
					delay = 20 //max(20, round(extra * 1/3 - GetSkillMod("survival", 5)))
				if("gather")
					delay = max(10, 40 - GetSkillMod("gathering", 2) + extra)
				if("fish")
					delay = max(10, 30 - GetSkillMod("fishing", 2) + extra)
				if("fish-reel")
					delay = max(5, 10 - GetSkillMod("fishing", 2) + extra)
				if("lumberjack")
					delay = max(10, 30 - GetSkillMod("woodcutting", 8) + extra)
				if("chop")
					delay = max(10, 20 - GetSkillMod("woodcutting", 10) + extra)
				if("culinary arts")
					delay = max(10, round(extra * 2/3 - GetSkillMod("culinary arts", 2)))
				if("woodworking")
					delay = max(10, round(extra * 2/3 - GetSkillMod("woodworking", 6)))
				if("smithing")
					delay = max(10, round(extra * 3/3 - GetSkillMod("smithing", 4)))
				if("masonry")
					delay = max(10, round(extra * 3/3 - GetSkillMod("masonry", 3)))
				if("tailoring")
					delay = max(10, round(extra * 1/3 - GetSkillMod("tailoring", 4)))
				if("till")
					delay = max(8, 20 - GetSkillMod("farming", 5) + extra)  // every 5 levels is one less tick (if at 100% focus)
				if("plant")
					delay = max(10, 20 - GetSkillMod("farming", 7) + extra)
				if("harvest")
					delay = max(12, 20 - GetSkillMod("farming", 10) + extra)
				if("mine")
					delay = max(20, 60 - GetSkillMod("mining", 2) + extra)
				if("refine")
					delay = max(10, 30 - GetSkillMod("smithing", 4) + extra)
				if("dig")
					delay = max(10, 30 - GetSkillMod("gathering", 4) + extra)
				if("dig-sand")
					delay = max(10, 20 - GetSkillMod("gathering", 6) + extra)
				if("excavate")
					delay = max(20, 60 - GetSkillMod("mining", 4) + extra)
				if("salvaging")
					delay = max(40, 60 - GetSkillMod("survival", 3) + extra)
				if("vandalizing")
					delay = max(50, 90 - GetSkillMod("survival", 3) + extra)
				if("water")
					delay = max(5, 10 - GetSkillMod("farming", 3) + extra)
				if("brickrack-fill")
					delay = max(10, 70 - GetSkillMod("masonry", 3) + extra)
				if("brickrack-remove")
					delay = max(10, 70 - GetSkillMod("masonry", 3) + extra)
				if("fire-claybrick")
					delay = max(10, 24 - GetSkillMod("masonry", 6) + extra)
				if("eat")
					delay = max(10, 15 - GetSkillMod("survival", 10) + extra)
				if("drink")
					delay = max(10, 15 - GetSkillMod("survival", 10) + extra)
				if("water-fill")
					delay = max(10, 20 - GetSkillMod("survival", 5) + extra)
			if(murderer)
				delay *= 2
			if(fighting >= 8)
				mess("Concentrate on fighting!")
				delay *= 3
			if(!delay)
				debug("BUG: Action \'[msg]\' does not have a delay")
			return delay

		RaiseRegen(val, val2, val3)
			src.hp_regen += val
			src.stamina_regen += val2
			src.fullness += val3

		ResetIcon()
			icon = 'MyIcon.dmi'
			icon_state = "white [gender]"
			icon *= rgb(icon_red, icon_green, icon_blue)
			head_overlay = icon('MyIcon.dmi', "head [gender]")
			overlays += head_overlay


		v_get(obj/game/O, amt = 0)
			if(action)
				return 0
			if(!O)
				O = input("Get what object?","Get") as obj in adj(src)
			if(!Validate(O, adj(src)))
				return
			if(O.carryable == 0 || !istype(O,/obj/game/item))
				src.mess("You cannot get that.")
				return
			if(istype(O,/obj/game/item/boat) && istype(loc, /turf/water))
				src.mess("You cannot get that.")
				return
			if(O.amount > 1 && !amt)
				amt = input("Get how many?","Get", O.amount) as num
			amt = round(amt)
			if(amt <= 0)
				amt = 1
			if(amt > O.amount)
				amt = O.amount
			src.mess("You get [amt] \icon[O][O.name].","[src] gets [amt] \icon[O][O.name].")
			MoveStack(O, src, amt)
			UpdateWeights()
			SetLighting()

		v_drop(obj/game/O, atom/A, amt = 0)
			if(action)
				return 0
			if(!O)
				O = input("Drop what object?","Get") as obj in src.contents
			if(!Validate(O, src.contents))
				return
			if(!Validate(A, view(src, 3)))
				return
			if(O.equipped_on)
				src.mess("That item is equipped!")
				return
			if(O.amount > 1 && !amt)
				amt = input("Drop how many?","Drop", 1) as num
			amt = round(amt)
			if(amt <= 0)
				amt = 1
			if(amt > O.amount)
				amt = O.amount
			if(get_dist(src, A) > 1)
				src.mess("You throw [amt] \icon[O][O.name].","[src] throws [amt] \icon[O][O.name].")
			else
				src.mess("You drop [amt] \icon[O][O.name].","[src] drops [amt] \icon[O][O.name].")
			MoveStack(O, A, amt)
			UpdateWeights()
			SetLighting()

		v_equip(obj/game/O)
			if(action)
				return 0
			if(!Validate(O, src.contents))
				return
			if(!O.equipable)
				src.mess("You cannot equip that.")
			else
				if(O.equipped_on)
					O.equipped_on = null
					equipment[O.equipslot] = null
					attack -= O.attack
					defense -= O.defense
					maxhp -= O.hp
					maxstamina -= O.stamina
					if(!contents.Find(O))
						contents += O
					O.suffix = null
					UpdateStack(O)
					src.mess("You remove \icon[O][O.name].","[src] removes \icon[O][O.name].")
				else
					var/equip = 1
					if(equipment[O.equipslot])
						if(equipment[O.equipslot] == O)
							equip = 0
						v_equip(equipment[O.equipslot])
					if(equip)
						O.equipped_on = src
						equipment[O.equipslot] = O
						O.Unstack()
						attack += O.attack
						defense += O.defense
						maxhp += O.hp
						maxstamina += O.stamina
						O.suffix = null
						//contents -= O
						UpdateStack(O)
						src.mess("You equip \icon[O][O.name].","[src] equips \icon[O][O.name].")

		CreateName(r=255, g=r, b=r)
			var/outline = "#fff"
			if(30*r+59*g+11*b > 7650) outline = "#000"
			namefont.QuickName(src, name, rgb(r,g,b), outline, 0, 3, LAYER_MOB_TOP)

		add_ownership(obj/game/structure/O)
			var/msg = input(src, "Current owners: [O.owner]", "Add Ownership") as text
			if(findtext(O.owner,"$[ckey(src.name)]|",1,length(ckey(src.name))+3))
				msg = ckey(msg)
				if(!findtext(O.owner,"$[msg]|"))
					O.owner += "$[msg]|"
					mess("[msg] added to the ownership list.")
				else
					mess("<B>They are already on the ownership list!")
			else
				mess("<B>You do not own this structure!")

		remove_ownership(obj/game/structure/O)
			var/msg = input(src, "Current owners: [O.owner]", "Remove Ownership") as text
			if(findtext(O.owner,"$[ckey(src.name)]|",1,length(ckey(src.name))+3))
				msg = ckey(msg)
				var/lem = msg
				var/L = findtext(O.owner,"$[msg]|")
				if(L)
					msg = copytext(O.owner, L+length(msg)+2)
					O.owner = copytext(O.owner, 1, L)
					O.owner += msg
					usr << O.owner
				mess("<B>[lem] removed from the ownership list.")
			else
				mess("<B>You do not own this structure!")

		LeaveStealth()
			Transfer(stealth_prev_loc)
			invisibility = 0
			stealth = null
			stealth_prev_loc = null

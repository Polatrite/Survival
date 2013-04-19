/*
npcs.dm

NPCs in Survival are about the dumbest NPCs in the entire world. This was never a game
based around PVE combat, that's for damn sure.

- Artificial "intelligence"
- Mob definitions and stats

*/

proc
	BasicWalk()
		spawn(1)
			BasicWalk()
		for(var/mob/game/npc/M in world)
			if(M.hostile)
				if(M.hit_target)
					BasicChase(M)
					continue
			if(M.time_walk)
				if(M.time_walk_delay)
					M.time_walk_delay--
					continue
				else
					M.time_walk_delay = M.time_walk
					if(M.hostile)
						if(!M.hit_target)
							for(var/mob/game/E in view(M))
								if(E.key)
									M.hit_target = E
									break
					var/turf/T = get_step(M, pick(NORTH, SOUTH, EAST, WEST))
					if(!istype(T, /turf/water))
						step(M, get_dir(M, T))

	BasicChase(mob/game/npc/M)
		if(M.time_walk)
			if(M.time_walk_delay)
				M.time_walk_delay--
			else
				M.time_walk_delay = M.time_walk
				if(M.hit_target in view(M))
				else
					M.hit_target = null
				if(get_dist(M, M.hit_target) > 1)
					var/turf/T = get_step_to(M, M.hit_target)
					if(!istype(T, /turf/water))
						step_to(M, M.hit_target)


mob
	game
		npc
			luminosity = 3
			mouse_opacity = 2
			stamina = 50000
			maxstamina = 50000
			var
				time_walk = 0
				time_walk_delay = 0
				time_attack = 0
				time_attack_delay = 0

				combat = 1
				combat_focus = 80
				shielding = 1
				shielding_focus = 80

				hostile = 1

			enemy
				luminosity = 0

				fly
					icon = 'enemies.dmi'
					icon_state = "fly"
					time_walk = 1
					hp = 5
					maxhp = 5
					attack = 25

				skeeter
					icon = 'enemies.dmi'
					icon_state = "skeeter"
					time_walk = 1
					hp = 5
					maxhp = 5
					attack = 50

				bunny
					icon = 'enemies.dmi'
					icon_state = "bunny"
					time_walk = 4
					hp = 20
					maxhp = 20
					attack = 0
					hostile = 0

				dingo
					icon = 'enemies.dmi'
					icon_state = "dingo"
					time_walk = 5
					hp = 30
					maxhp = 30
					attack = 30

				wolf
					icon = 'enemies.dmi'
					icon_state = "wolf"
					time_walk = 3
					hp = 50
					maxhp = 50
					attack = 70

				bear
					icon = 'enemies.dmi'
					icon_state = "bear"
					time_walk = 7
					hp = 200
					maxhp = 200
					attack = 90
					defense = 40

				impling
					icon = 'enemies.dmi'
					icon_state = "impling"
					time_walk = 4
					hp = 20
					maxhp = 20
					attack = 45
					defense = 20

				imp
					icon = 'enemies.dmi'
					icon_state = "imp"
					time_walk = 4
					hp = 150
					maxhp = 150
					attack = 70
					defense = 30

				rattler
					icon = 'enemies.dmi'
					icon_state = "rattler"
					time_walk = 2
					hp = 25
					maxhp = 25
					attack = 60

				cobra
					icon = 'enemies.dmi'
					icon_state = "cobra"
					time_walk = 2
					hp = 80
					maxhp = 80
					attack = 100

				king_cobra
					icon = 'enemies.dmi'
					icon_state = "king cobra"
					time_walk = 2
					hp = 400
					maxhp = 400
					attack = 130

				slime
					icon = 'enemies.dmi'
					icon_state = "slime"
					time_walk = 15
					hp = 150
					maxhp = 150
					attack = 40
					density = 0
					New()
						..()
						spawn()
							Poisonous()
					proc
						Poisonous()
							spawn(5)
								Poisonous()
							for(var/mob/game/M in view(1))
								if(M != src)
									M.Damage(rand(1,2), src)


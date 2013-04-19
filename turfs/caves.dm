turf

	cave
		icon = 'new_cave.dmi'

		ground
			icon_state = "ground1"
			/*New(type)
				..()
				if(prob(10))
					icon_state = pick("rock6","rock7","rock8")
				else
					icon_state = "ground[rand(1,4)]"*/

		cave_wall
			icon = 'caves-joined.dmi'
			icon_state = "255"
			density = 1
			autojointype = /turf/cave/cave_wall
			/*New()
				..()
				for(var/turf/cave/cave_wall/T in range(1, src))
					T.AutoJoin32()*/
			Click()
				v_mine(usr, src)
			Bumped(mob/M)
				v_mine(M, src)

		rock1
			icon_state = "rock4"
			density = 1
			New()
				..()
				icon_state = pick("rock1","rock4","rock5")

		stalagmite
			icon_state = "stag2"
			density = 1
			New()
				..()
				icon_state = pick("stag1","stag2")

		dead_tree
			icon_state = "dead1"
			density = 1
			New()
				..()
				icon_state = pick("dead1","dead2","dead3","dead4","dead5")

		rock2
			name = "rock"
			icon_state = "rock2"
			density = 1

		rock3
			name = "rock"
			icon_state = "rock3"
			density = 1


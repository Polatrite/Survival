turf
	jungle
		icon = 'grass.dmi'

		grass
			icon_state = "grass1"
			autojointype = 10
			verb
				till()
					set src in view(1)
					v_till(usr, src)
			/*New()
				..()
				if(prob(30))
					icon_state = "flowers[rand(1, 2)]"
				else
					icon_state = "grass[rand(1, 4)]"*/
			border
				icon = 'dynamic_grass.dmi'
				name = "grass"

		desert_border
			name = "grass"
			icon = 'dynamic_grass.dmi'

		dirt
			icon = 'dirt.dmi'
			icon_state = "0"
			Click()
				v_dig(usr, src)
			verb
				dig()
					set src in view(1)
					v_dig(usr, src)
				excavate()
					set src in view(1)
					v_excavate(usr, src)
			New()
				..()
				AutoJoin16()
			proc
				AutoJoin16()
					var/value = 0
					var/turf/T = locate(x+1,y,z)
					if(istype(T,/turf/jungle/dirt))
						value += 2
					T = locate(x-1,y,z)
					if(istype(T,/turf/jungle/dirt))
						value += 8
					T = locate(x,y+1,z)
					if(istype(T,/turf/jungle/dirt))
						value += 1
					T = locate(x,y-1,z)
					if(istype(T,/turf/jungle/dirt))
						value += 4
					icon_state = "[value]"

		sign
			icon = 'grass.dmi'
			icon_state = "sign"
			density = 1
			var
				msg = "Welcome to Survival: The Lost Era! Use 'chat' to speak with other players! Use 'who' to see who is online!"
			Click()
				var/mob/game/user = usr
				if(!istype(user)) return
				user.mess(msg)
			verb
				read()
					set src in view(1)
					var/mob/game/user = usr
					if(!istype(user)) return
					user.mess(msg)

		soil
			icon = 'dirt.dmi'
			icon_state = "0"
			condition = 30
			var
				water_content = 0
			Click()
				v_water(usr, src)
			verb
				water()
					set src in view(1)
					v_water(usr, src)


proc
	v_mine(mob/game/M, turf/cave/cave_wall/T, bump=1)
		if(M.action)
			return 0
		if(!Validate(T, adj(M)))
			return 0
		if(T.icon_state == null)
			return 0
		if(!istype(T))
			M.mess("You can't mine there.")
			return 0
		var/obj/game/TL = M.HasTool("mine", autoequip=!bump)
		if(!TL)
			if(!bump)
				M.mess("You need a pickaxe!")
			return 0
		var/delay = 0
		if(istype(TL, /obj/game/item/tools/pickaxe/wooden_pickaxe))
			delay = -4
		if(istype(TL, /obj/game/item/tools/pickaxe/iron_pickaxe))
			delay = -10
		if(istype(TL, /obj/game/item/tools/pickaxe/reinforced_iron_pickaxe))
			delay = -10
		delay = M.Delay("mine", delay)
		M.mess("You begin mining the wall. ([delay])","[M] begins mining the wall.")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Mining...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		TL.ChangeDurability(-1)
		var/check = M.SkillCheckExp("mining", prob=85, exp=7)
		if(!check)
			M.mess("You couldn't break through.")
			return 0
		var/sklvl = M.GetSkillLevel("mining")
		var/metals[] = list(/obj/game/item/metal/iron/iron_ore=1000)
		var/fancies[] = list()
		if(sklvl >= 5)
			metals += list(/obj/game/item/coal=180)
		if(sklvl >= 7)
			metals += list(/obj/game/item/metal/aluminum=140)
		if(sklvl >= 10)
			metals += list(/obj/game/item/metal/titanium=100)
		if(sklvl >= 13)
			fancies += list(/obj/game/item/gems/bloodstone=50)
		if(sklvl >= 15)
			fancies += list(/obj/game/item/gems/jasper=45)
		if(sklvl >= 17)
			fancies += list(/obj/game/item/gems/aventurine=40)
			fancies += list(/obj/game/item/gems/amethyst=40)
		if(sklvl >= 19)
			fancies += list(/obj/game/item/gems/topaz=40)
		if(sklvl >= 22)
			fancies += list(/obj/game/item/gems/moonstone=40)
		if(sklvl >= 25)
			fancies += list(/obj/game/item/gems/sunstone=38)
		if(sklvl >= 27)
			fancies += list(/obj/game/item/gems/onyx=35)
		if(sklvl >= 30)
			fancies += list(/obj/game/item/gems/sapphire=35)
		if(sklvl >= 33)
			fancies += list(/obj/game/item/gems/emerald=35)
		if(sklvl >= 35)
			fancies += list(/obj/game/item/gems/ruby=30)
		if(sklvl >= 40)
			fancies += list(/obj/game/item/gems/diamond=10)
		var/obj/game/item/O
		var/type
		if(prob(2))
			//world.log << "[world.timeofday] - IS THE GAME ABOUT TO FREEZE? (metals: [metals.len] fancies: [fancies.len])"
			sleep(1)
			if(fancies.len > 0)
				var/nolock = 0
				while(!type)
					var/x = rand(1, fancies.len)
					type = fancies[x]
					var/random = rand(1, 1000)
					//world << "x=[x],  rand=[random],   [type],  xfan=[fancies[x]],  Ofan=[fancies[type]]"
					if(random >= fancies[type])
						type = null
					nolock++
					if(nolock >= 5000)
						break
		else
			//world.log << "[world.timeofday] - NORMAL MININ' with [metals.len] and [fancies.len]?"
			sleep(1)
			if(metals.len > 0)
				var/nolock = 0
				while(!type)
					var/x = rand(1, metals.len)
					type = metals[x]
					var/random = rand(1, 1000)
					//world << "x=[x],  rand=[random],   [type],  xfan=[metals[x]],  Ofan=[metals[type]]"
					if(random >= metals[type])
						type = null
					nolock++
					if(nolock >= 5000)
						break
		//world.log << "[world.timeofday] - [type] - PASSED"
		if(!type)
			return
		O = new type()
		M.mess("You mined \an [O]")
		MoveStack(O, M, O.amount)
		T.density = 0
		T.icon_state = null
		T.joinstyle = 0
		for(var/turf/cave/cave_wall/Y in range(1, T))
			Y.AutoJoin32()
		if(prob(15))
			new /obj/game/item/stone/stone(T)
		//world.log << "[world.timeofday] - almost done..."
		spawn(rand(360000,365000))
			for(var/mob/game/L in T)
				L.ChangeHP(-25)
				L.ChangeStamina(-250)
			T.density = initial(T.density)
			T.icon_state = initial(T.icon_state)
			T.joinstyle = initial(T.joinstyle)
			for(var/turf/cave/cave_wall/Y in range(1, T))
				Y.AutoJoin32()
		//world.log << "[world.timeofday] - done!"

	v_excavate(mob/game/M, turf/jungle/dirt/T)
		if(M.action)
			return 0
		if(!Validate(T, adj(M)))
			return
		for(var/obj/game/O in T)
			if(istype(O, /obj/game/landscape/hole))
				M.mess("You can't excavate there.")
				return 0
		if(!istype(T))
			M.mess("You can't excavate there.")
			return 0
		var/obj/game/TL = M.HasTool("excavate")
		if(!TL)
			M.mess("You need a shovel!")
			return 0
		var/delay = 0
		if(istype(TL, /obj/game/item/tools/shovel/wooden_shovel))
			delay = -2
		if(istype(TL, /obj/game/item/tools/shovel/iron_shovel))
			delay = -5
		if(istype(TL, /obj/game/item/tools/shovel/reinforced_iron_shovel))
			delay = -5
		delay = M.Delay("excavate", delay)
		M.mess("You begin excavating the dirt. ([delay])","[M] begins excavating the dirt.")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Excavating...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		TL.ChangeDurability(-1)
		var/check = M.SkillCheckExp("mining", exp=7)
		if(!check)
			M.mess("You couldn't break through.")
			return 0
		else
			M.mess("You dug a hole into the underground.")
		var/list/affected = T.sd_StripLocalLum()
		var/obj/O
		O = new /obj/game/landscape/hole()
		O.Transfer(T)
		O = new /obj/game/landscape/hole_light()
		O.Transfer(locate(T.x,T.y,T.z+1))
		T.sd_ApplyLocalLum(affected)


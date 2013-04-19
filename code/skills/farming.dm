proc
	v_water(mob/game/M, turf/jungle/soil/T)
		if(M.action)
			return 0
		if(!Validate(T, adj(M)))
			return
		if(!istype(T, /turf/jungle/soil))
			M.mess("You don't need to water that!")
			return 0
		var/obj/game/item/water_container/TL = M.HasTool("water")
		if(!TL)
			M.mess("You need a container of water!")
			return 0
		TL.savvalue1--
		TL.Unstack()
		UpdateStack(TL)
		var/delay = M.Delay("water")
		M.mess("You begin watering the soil. ([delay])","[M] begins watering the soil.")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Watering...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		for(var/turf/jungle/soil/L in view(1))
			L.condition = 30
			L.icon_state = "watered"
			L.water_content = 100
			new /obj/system/dust/water(L)

	v_plant(mob/game/M, obj/game/item/seeds/O)
		if(M.action)
			return 0
		if(!Validate(O, M.contents))
			return
		var/turf/T = M.loc
		if(!istype(T,/turf/jungle/soil))
			M.mess("You cannot plant here!")
			return
		var/delay = M.Delay("plant")
		M.mess("You plant \an [O.name]. ([delay])","[M] plants \an [O.name]")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Planting...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("farming", exp=10)
		if(!check)
			M.mess("You failed and your seeds were lost.")
			DelStack(O, 1)
			return 0
		else
			M.mess("You planted [O]!")
		var/obj/game/I = new O.cropobj(M.loc)
		I.icon_state = "seeds"
		DelStack(O, 1)

	v_till(mob/game/M)
		if(M.action)
			return 0
		var/turf/T = M.loc
		if(!istype(T,/turf/jungle/grass))
			M.mess("You cannot till here!")
			return
		for(var/obj/game/landscape/O in T)
			if(O)
				M.mess("You cannot till here!")
				return
		var/obj/game/TL = M.HasTool("till")
		if(!TL)
			M.mess("You need a hoe!")
			return 0
		var/delay = 0
		if(istype(TL, /obj/game/item/tools/hoe/wooden_hoe))
			delay = -1
		if(istype(TL, /obj/game/item/tools/hoe/iron_hoe))
			delay = -2
		if(istype(TL, /obj/game/item/tools/hoe/reinforced_iron_hoe))
			delay = -2
		delay = M.Delay("till", delay)
		M.mess("You begin tilling the soil. ([delay])","[M] begins tilling the soil.")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Tilling...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("farming", exp=2)
		TL.ChangeDurability(-1)
		if(!check)
			M.mess("Your attempts did nothing.")
			return 0
		else
			M.mess("Success!")
		var/list/affected = T.sd_StripLocalLum()
		var/icos = T.icon_state
		T = new/turf/jungle/soil(M.loc)
		T.underlays += image('grass.dmi',icos)
		T.sd_ApplyLocalLum(affected)

	v_harvest(mob/game/M, obj/game/crop/O)
		if(M.action)
			return 0
		if(!O)
			O = locate() in get_step(M, M.dir)
		if(!Validate(O, adj(M)))
			return
		if(istype(O, /obj/game/crop/tree))
			M.mess("You can't harvest a tree, wait for it to grow!")
			return
		if(O.stage3)
			if(O.value1 < O.stage3)
				M.mess("That isn't ripe yet.")
				return
		else
			if(O.value1 < O.stage2)
				M.mess("That isn't ripe yet.")
				return
		var/delay = M.Delay("harvest")
		M.mess("You begin harvesting [O]. ([delay])","[M] begins harvesting [O].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Harvesting [O]...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("farming", exp=8)
		var/health = check / 2
		health *= O.healthy_cycles
		health /= O.cycles
		check /= 2
		check += health
		debug("Check/2+Health: [check]")
		var/random = prob(100)
		if(check == 0)
			M.mess("You made a mistake and ruined the plant!.")
			del(O)
			return 0
		else if(check < random)
			M.mess("The plant was not healthy enough and was destroyed.")
			del(O)
			return 0
		var/obj/game/item/I = new O.invobj()
		var/obj/game/item/L = new I:gatherobj()
		L.amount = pick(2,2,3)
		M.mess("You harvested [I] and [L.amount] seeds!","[M] harvested [I].")
		MoveStack(I, M, I.amount)
		MoveStack(L, M, L.amount)
		del(O)


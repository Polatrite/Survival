proc
	v_gather(mob/game/M, obj/game/item/gatherables/O)
		if(M.action)
			return 0
		if(!Validate(O, adj(M)))
			return
		var/delay = M.Delay("gather")
		M.mess("You gather \an [O.name]. ([delay])","[M] gathers \an [O.name]")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Gathering...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("gathering", exp=7)
		if(!check)
			M.mess("You failed and killed the plant.")
			DelStack(O, 1)
			return 0
		var/obj/game/I = new O.gatherobj()
		M.mess("You gathered [I]!")
		MoveStack(I, M, I.amount)
		DelStack(O, 1)

	v_dig(mob/game/M, turf/jungle/dirt/T)
		if(M.action)
			return 0
		if(!Validate(T, adj(M)))
			return
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
		delay = M.Delay("dig-sand", delay)
		M.mess("You begin digging in [T]. ([delay])","[M] begins digging in [T].")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Digging...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		TL.ChangeDurability(-1)
		var/check = M.SkillCheckExp("gathering", prob=120, exp=4)
		if(!check)
			M.mess("You couldn't find anything.")
			return 0
		var/items[] = list()
		if(istype(T, /turf/jungle/dirt))
			items = list(
			/obj/game/item/clay/clay,
			/obj/game/item/clay/clay,
			/obj/game/item/clay/clay,
			/obj/game/item/stone/stone
			)
		if(istype(T, /turf/desert/sand))
			items = list(
			/obj/game/item/sand/sand,
			/obj/game/item/sand/sand,
			/obj/game/item/sand/sand,
			/obj/game/item/sand/sand,
			/obj/game/item/stone/stone
			)
		var/type = pick(items)
		var/obj/game/item/O = new type()
		O.amount = pick(1,1,1,2)
		M.mess("You found some [O.name].")
		MoveStack(O, M, O.amount)


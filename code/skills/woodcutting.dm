proc
	v_lumberjack(mob/game/M, obj/game/landscape/tree/O)
		if(M.action)
			return 0
		if(!O)
			O = locate() in get_step(M, M.dir)
		if(!Validate(O, adj(M)))
			return
		if(!istype(O))
			M.mess("You can't lumberjack that.")
			return 0
		if(O.icon_state == "palm stump")
			M.mess("You cannot get wood from a stump!")
			return 0
		var/obj/game/TL = M.HasTool("lumberjack")
		var/delay = 0
		if(istype(TL, /obj/game/item/tools/axe/iron_axe))
			delay = -3
		if(istype(TL, /obj/game/item/tools/axe/reinforced_iron_axe))
			delay = -3
		if(!TL)
			delay = 5
		delay = M.Delay("lumberjack", delay)
		if(TL)
			M.mess("You start cutting a [O.name]. ([delay])","[M] begins cutting a [O.name].")
			delay *= 1.5
		else
			M.mess("You don't have any tools! You try your best to get wood from [O.name]. ([delay])","[M] begins cutting a [O.name]... without a tool!")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Cutting...",O.icon,O.icon_state)
		M.action.Run(O,M,PAC_SELF, delay)
		if(TL)
			TL.ChangeDurability(-1)
		var/check = M.SkillCheckExp("woodcutting", exp=7)
		if(!check)
			M.mess("Your attempts did nothing.")
			return 0
		O.value1 -= 1
		if(O.value1)
			M.mess("Success! Only [O.value1] more chops to go.")
		else
			M.mess("You cut down the tree.")
		if(O.value1 == 0)
			O.icon_state = "palm stump"
			O.name = "tree stump"
			O.density = 0
			O.growth = TREE_GROWTH
			new/obj/game/landscape/log(O.loc)
			spawn(1200)
				new /obj/game/item/seeds/tree_seed(O.loc)
				del(O)
		return 1

	v_chop(mob/game/M, obj/game/landscape/log/O)
		if(M.action)
			return 0
		if(!O)
			O = locate() in get_step(M, M.dir)
		if(!Validate(O, adj(M)))
			return
		if(!istype(O))
			M.mess("You can't chop that.")
			return 0
		var/obj/game/TL = M.HasTool("lumberjack")
		var/delay = 0
		if(istype(TL, /obj/game/item/tools/axe/wooden_axe))
			delay = -2
		if(istype(TL, /obj/game/item/tools/axe/iron_axe))
			delay = -3
		if(istype(TL, /obj/game/item/tools/axe/reinforced_iron_axe))
			delay = -3
		delay = M.Delay("lumberjack", delay)
		M.mess("You start chopping apart a [O.name]. ([delay])","[M] begins chopping apart a [O.name].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Chopping...",O.icon,O.icon_state)
		M.action.Run(O,M,PAC_SELF, delay)
		if(TL)
			TL.ChangeDurability(-1)
		O.value1 -= 1
		var/check = M.SkillCheckExp("woodcutting", exp=4)
		if(!check)
			M.mess("You didn't get any usable wood.")
			return 0
		else
			var/obj/game/L = new /obj/game/item/materials/lumber()
			var/lumberQty = min(7, pick(3,3,3,4) + M.GetSkillMod("woodcutting", 15))
			L.amount = lumberQty
			MoveStack(L, M, lumberQty)

			L = null

			// possibility to get a pole from "limbing"
			if(prob(30))
				switch(pick(1,1,2,3))
					if(1)
						L = new /obj/game/item/wood/small_wooden_pole()
						L.amount = 1
						MoveStack(L, M, 1)
					if(2)
						L = new /obj/game/item/wood/medium_wooden_pole()
						L.amount = 1
						MoveStack(L, M, 1)
					if(3)
						L = new /obj/game/item/wood/large_wooden_pole()
						L.amount = 1
						MoveStack(L, M, 1)

			if(L)
				M.mess("You collected [lumberQty] pieces of lumber and \a [L.name]!")
			else
				M.mess("You collected [lumberQty] pieces of lumber!")
		if(O.value1 <= 0)
			del(O)


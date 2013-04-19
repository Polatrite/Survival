proc
	v_brickrack(mob/game/M, obj/game/item/tools/brick_rack/O)
		if(M.action)
			return 0
		if(!Validate(O, adj(M)))
			return
		if(Validate(O, M.contents))
			M.mess("You must place it on the ground to fill it.")
			return
		if(findtext(O.icon_state, "ready"))
			var/delay = M.Delay("brickrack-remove")
			M.mess("You remove the finished bricks from \a [O]. ([delay])","[M] removes the finished bricks from \a [O].")
			M.action = new/atom/movable/action(O.contents)
			M.action.Setup("Removing bricks...", O.icon, O.icon_state)
			M.action.Run(O, M, PAC_SELF, delay)
			M.SkillCheckExp("masonry", exp=8)
			var/proba = O.value3
			var/obj/game/item/brick/I = new O.brickobj()
			O.ChangeDurability(-1)
			I.amount = 1
			for(var/x = 2, x < 8, x++)
				if(prob(proba))
					I.amount++
			O.icon_state = "brick rack"
			O.value1 = 0
			O.value3 = 0
			O.carryable = 1
			M.mess("You collected [I.amount] [I.name].")
			MoveStack(I, M, I.amount)
		else if(!findtext(O.icon_state, "filled"))
			var/obj/game/item/clay/I = locate(O.clayobj) in M
			if(I)
				DelStack(I, 1)
			else
				I = new()
				M.mess("You need [I.name]!")
				del(I)
				return 0
			var/delay = M.Delay("brickrack-fill")
			M.mess("You fill \a [O]. ([delay])","[M] fills \a [O].")
			M.action = new/atom/movable/action(O.contents)
			M.action.Setup("Filling brick rack...", O.icon, O.icon_state)
			M.action.Run(O, M, PAC_SELF, delay)
			M.SkillCheckExp("masonry", exp=5)
			O.stackable = 0
			O.carryable = 0
			O.icon_state = "brick rack filled"
		else
			M.mess("Those bricks aren't ready yet!")
			return 0

	v_fire(mob/game/M, obj/game/item/brick/O)
		if(M.action)
			return 0
		if(!Validate(O, M.contents))
			return
		if(!istype(O, /obj/game/item/brick/clay_brick))
			M.mess("You can't refine that!")
			return
		if(!locate(/obj/game/structure/kiln/ceremic_brick_kiln) in adj(M))
			M.mess("You need a kiln to fire the bricks in!")
			return 0
		var/delay = M.Delay("fire-claybrick")
		M.mess("You begin firing \an [O]. ([delay])","[M] begins firing \an [O].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Firing [O]...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("masonry", prob=90, exp=2)
		if(!check)
			M.mess("[O] cracked!.")
			DelStack(O, 1)
			return 0
		var/obj/game/item/brick/I = new O.fireobj()
		M.mess("You fired [O] into [I]!")
		MoveStack(I, M, I.amount)
		DelStack(O, 1)


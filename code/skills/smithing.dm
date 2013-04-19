proc
	v_refine(mob/game/M, obj/game/item/metal/O)
		if(M.action)
			return 0
		if(!Validate(O, M.contents))
			return
		if(!locate(/obj/game/landscape/fire) in adj(M))
			M.mess("You need a fire to refine!")
			return 0
		var/delay = M.Delay("refine")
		M.mess("You start refining \an [O]. ([delay])","[M] begins refining \an [O].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Refining [O]...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("smithing", exp=4)
		if(!check)
			M.mess("You failed to retrieve anything useful from [O].")
			DelStack(O, 1)
			return 0
		var/obj/game/item/metal/I = new O.refineobj()
		M.mess("You refined [O] into [I]!")
		MoveStack(I, M, I.amount)
		DelStack(O, 1)


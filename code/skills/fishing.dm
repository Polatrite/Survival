proc
	v_fish(mob/game/M, turf/water/T)
		if(M.action)
			return 0
		if(!Validate(T, view(M)))
			return
		if(!istype(T))
			M.mess("It's hard to fish on land!")
			return 0
		if(!M.HasTool("fish"))
			M.mess("You need a fishing rod!")
			return 0
		var/delay = M.Delay("fish")
		M.mess("You cast a line. ([delay])","[M] casts a line.")
		var/obj/system/flick/F = new (T)
		flick("ripple", F)
		spawn(4)
			del(F)
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Fishing...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		var/check = M.SkillCheckExp("fishing", exp=4)
		if(!check || !T.fish)
			M.mess("You didn't catch anything.")
			return 0
		delay = M.Delay("fish-reel")
		M.mess("You feel a bite and start reeling in! ([delay])")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Fishing...", T.icon, T.icon_state)
		M.action.Run(T, M, PAC_SELF, delay)
		var/sklvl = M.GetSkillLevel("fishing")
		var/obj/game/item/food/fish/O = new T.fish()
		T.fish = null
		if(sklvl >= O.reqskill)
			M.mess("You caught \an [O]")
			MoveStack(O, M, O.amount)
		else
			M.mess("It got away!")
			del(O)
		T.Fish(6000)


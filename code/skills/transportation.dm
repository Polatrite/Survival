proc
	v_tow(mob/game/M, obj/game/landscape/O)
		if(M.action)
			return 0
		if(!O)
			O = locate() in get_step(M, M.dir)
		if(!Validate(O, adj(M)))
			return
		if(!O.towable)
			M.mess("You can't tow that.")
			return 0
		if(O.following == M)
			return 0
		var/obj/game/TL = M.HasTool("tow")
		var/delay = 0
		if(istype(TL, /obj/game/item/tools/axe/wooden_axe))
			delay = -2
		delay = M.Delay("tow", delay)
		M.mess("You start towing [O.name]. ([delay])","[M] begins towing [O.name].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Towing...",O.icon,O.icon_state)
		M.action.Run(O,M,PAC_SELF, delay)
		O.following = M
		M.followers.Add(O)



proc
	TextBreak(message, list_position=1, seperator = " ")
		if(!message)
			return
		message += seperator
		var
			list/string = list()
			position
		while(findtext(message, seperator))
			position = findtext(message, seperator)
			string += copytext(message, 1, position)
			message = copytext(message, position+1)
		if(string.len >= list_position)
			return string[list_position]
		else return

	info(msg)
		for(var/mob/game/m)
			m.OutputTo(FormatInfo(msg), CHAN_PUBLIC)

	worldmess(msg)
		for(var/mob/game/M in world)
			M.mess(msg)

	debug(msg, listeners=world)
		for(var/mob/game/m in listeners)
			if(m.debug && m.debug["messages"])
				m.OutputTo("<font color='#808080' size='-1'>[msg]</font>", CHAN_ALL)

	opposite(val, max_val)
		return max_val - val

	adj(atom/B)
		return view(1,B) // Hack to remove adjacency

		var/lis[] = list()
		var/atom/T
		for(var/x = 1, x < 16, x *= 2)
			T = get_step(locate(B.x, B.y, B.z), x)
			lis += T
			for(var/atom/A in T)
				lis += A
		T = locate(B.x, B.y, B.z)
		lis += T
		for(var/atom/A in T)
			lis += A
		for(var/atom/A in B)
			lis += A
		return lis

	oadj(atom/B)
		var/lis[] = list()
		for(var/atom/A in get_step(locate(B.x, B.y, B.z), NORTH))
			lis += A
		for(var/atom/A in get_step(locate(B.x, B.y, B.z), SOUTH))
			lis += A
		for(var/atom/A in get_step(locate(B.x, B.y, B.z), EAST))
			lis += A
		for(var/atom/A in get_step(locate(B.x, B.y, B.z), WEST))
			lis += A
		return lis

	p_DragDropObject(turf/srcLoc, turf/ovrLoc, mob/src = usr, mob/user = null)
		if(!istype(srcLoc) || !istype(ovrLoc))
			return 0
		if(get_dist(srcLoc, ovrLoc) == 1)
			if(get_dir(ovrLoc, srcLoc) == SOUTHWEST || get_dir(ovrLoc, srcLoc) == NORTHWEST || get_dir(ovrLoc, srcLoc) == SOUTHEAST || get_dir(ovrLoc, srcLoc) == NORTHEAST)
				return 0
			if(!src.Move(ovrLoc))
				return 0
/*			if(user)
				if(get_dist(user, ovrLoc) > 1)
					user.Move(srcLoc)*/
			return 1

	QuakeEffect(mob/M,duration,strength=1)
		if(!M.client)return
		spawn(1)
			var/oldeye=M.client.eye
			var/x
			for(x=0;x<duration,x++)
				M.client.eye = get_step(M,pick(NORTH,SOUTH,EAST,WEST))
				if(strength == 2)
					M.client.eye = get_step(M,pick(NORTH,SOUTH,EAST,WEST))
				if(strength == 3)
					M.client.eye = get_step(M,pick(NORTH,SOUTH,EAST,WEST))
				sleep(1)
			M.client.eye=oldeye

	Effect_MeleeHit(atom/M)
		var/image/I = image('shiny effects.dmi',M,icon_state="hit",layer=LAYER_FLY_0)
		range(M) << I
		spawn(4)
			del(I)

	Effect_MeleeMiss(atom/M)
		var/image/I = image('shiny effects.dmi',M,icon_state="poof",layer=LAYER_FLY_0)
		range(M) << I
		spawn(4)
			del(I)

	Effect_MeleeTink(atom/M)
		var/image/I = image('shiny effects.dmi',M,icon_state="tink",layer=LAYER_FLY_0)
		range(M) << I
		spawn(4)
			del(I)


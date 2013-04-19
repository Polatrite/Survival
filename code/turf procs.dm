turf
/*	Enter(mob/M)
		if(!istype(M))
			return ..()
		var/obj/game/landscape/tree/O = locate() in src.contents
		if(O || locate(/obj/game/landscape/log) in src.contents)
			. = ..()
			if(!.)
				return .
			M.movable = 0
			spawn M.elevated = 1
			spawn(2)
				M.pixel_y_tree = 4
				M.UpdateOffset()
				sleep(2)
				if(!M.elevated)
					return
				M.pixel_y_tree = 8
				M.UpdateOffset()
				sleep(2)
				M.movable = 1
		else
			return ..()*/

/*	Enter(atom/A)
		if(water)
			if(isobj(A))
				if(istype(A,/obj/game/item))
					del(A)
					flick("ripple", src)
				return ..()
			if(ismob(A))
				var/mob/M = A
				var/obj/O = locate(/obj/game/item/boat) in A.loc
				if(!O)
					O = locate(/obj/game/item/boat) in src
				if(!O)
					return 0
				if(O.loc == A.loc)
					step(O, A.dir)
					return ..()
				else if(O.loc == src)
					return ..()
				else
					return 0
		else
			return ..()*/

	Enter(mob/game/M)
		if(istype(M))
			var/obj/game/landscape/tree/O = locate() in src
			if(O && O.icon_state != "palm stump")
				O = null
			if(O || locate(/obj/game/landscape/log) in src)
				. = ..()
				if(!.)
					return .
				M.movable = 0
				spawn M.elevated = 1
				spawn(2)
					M.pixel_y_tree = 2
					M.UpdateOffset()
					sleep(2)
					if(!M.elevated)
						return
					M.pixel_y_tree = 4
					M.UpdateOffset()
					sleep(2)
					M.movable = 1
			else
				return ..()
		return ..()

	Enter(mob/game/M)
		if(istype(M))
			var/mobCount = 0
			for(var/mob/game/L in src)
				mobCount += 1
			for(var/obj/game/structure/O in src)
				if(O.structure_type == STRUCTURE_DOOR && mobCount >= 1)
					return 0
			for(var/obj/game/landscape/O in src)
				if(O && mobCount >= 1)
					return 0
			if(mobCount >= 4)
				return 0
			src.MobOffsetUpdate(M)
			var/list/den = list()
			for(var/mob/game/N in src)
				if(N.density)
					den += N
					N.density = 0
			. = ..()
			for(var/mob/game/N in den)
				N.density = 1
			return
		else
			return ..()

	Entered(mob/game/M)
		..()
		for(var/obj/game/landscape/O in src)
			O.Entered(M)

	Exited(mob/game/M)
		if(istype(M))
			if(M.elevated)
				M.movable = 0
				M.elevated = 0
				spawn(2)
					M.pixel_y_tree = 2
					M.UpdateOffset()
					sleep(2)
					if(M.elevated)
						return
					M.pixel_y_tree = 0
					M.UpdateOffset()
					sleep(2)
					M.movable = 1
		return ..()

	Exited(mob/game/M)
		if(istype(M))
			var/mob/game/A
			for(var/mob/game/L in src)
				if(L != M)
					if(A)
						A = null
						break
					A = L
			if(A)
				A.x_loc = 0
				A.y_loc = 0
				A.UpdateOffset()
			if(M.elevated)
				M.movable = 0
				M.elevated = 0
				spawn(2)
					M.pixel_y_tree = 4
					M.UpdateOffset()
					sleep(2)
					if(M.elevated)
						return
					M.pixel_y_tree = 0
					M.UpdateOffset()
					sleep(2)
					M.movable = 1
		return ..()

	proc
		AutoJoin32()
			// cardinal
			MatchTurf(NORTH,1)
			MatchTurf(EAST,4)
			MatchTurf(SOUTH,16)
			MatchTurf(WEST,64)
			// diagonal
			MatchTurf(NORTHEAST,2,5)
			MatchTurf(SOUTHEAST,8,20)
			MatchTurf(SOUTHWEST,32,80)
			MatchTurf(NORTHWEST,128,65)
			if(joinstyle == 1)
				icon_state = "[joinflag]"
			if(joinstyle == 2)
				overlays += image(src.icon, "[joinflag]")

		MatchTurf(direction,flag,mask=0)
			if((joinflag&mask)==mask)
				var/turf/T=get_step(src,direction)
				if(T)
					if(autojointype)
						if(autojointype == T.autojointype && T.icon_state)
							joinflag|=flag	// turn on the bit flag
							return
					else
						if(T.type==type && T.icon_state)
							joinflag|=flag	// turn on the bit flag
							return
			joinflag&=~flag     // turn off the bit flag

		MobOffsetUpdate(mob/game/M)
			if(!istype(M))
				return
			var/list/corners = list("-1,1", "1,-1", "1,1", "-1,-1")
			var/mob/game/lastMob = null
			var/mobCount = 0
			for(var/mob/game/M2 in src.contents)
				mobCount++
				lastMob = M2
				corners -= "[M2.x_loc],[M2.y_loc]"
				if(mobCount >= 4)
					return ..()
			. = ..()
			if(mobCount == 1 && !lastMob.x_loc && !lastMob.y_loc)
				var/corner = corners[1]
				lastMob.x_loc = text2num(corner)
				lastMob.y_loc = text2num(copytext(corner, findtext(corner, ",") + 1))
				lastMob.UpdateOffset()
				corners -= corner
			if(!mobCount)// && !istype(src, /turf/water))
				M.x_loc = 0
				M.y_loc = 0
				M.UpdateOffset()
			//var/doOffset = 0
			if(mobCount >= 1)
			//	doOffset = 1
			//else if(istype(src, /turf/water))
			//	var/obj/game/item/boat/b = locate() in src
			//	doOffset = !istype(b, /obj/game/item/boat/raft)
			//if(doOffset)
				var/corner = corners[1]
				M.x_loc = text2num(corner)
				M.y_loc = text2num(copytext(corner, findtext(corner, ",") + 1))
				M.UpdateOffset()


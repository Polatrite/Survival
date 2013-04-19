world
	proc/Clear()
		for(var/obj/game/item/T in world)
			if(T.z)
				del(T)
		for(var/obj/game/structure/T in world)
			if(T.z)
				del(T)

	proc/Save(fname, quick=0)
		if(!fname)
			fname = "automap.txt"
		var/opt = "-obj -structure"
		fcopy(fname, "backups/maps/[time2text(world.realtime, "YYYY-MM-DD-hh.mm")].[fname]")
		fdel(fname)
		if(findtext(opt,"-obj"))
			for(var/obj/game/item/T in world)
				if(T.z && !T.tmp)
					if(T.loc == initial(T.loc))
						continue
						world << "[T] is at original location! [T.x],[T.y]"
					text2file("[T.amount];[T.type];[T.x];[T.y];[T.z];[T.owner];[T.stackable];[T.durability];[T.maxdurability];[T.savvalue1];[T.savvalue2];[T.savvalue3];",fname)
		if(findtext(opt,"-structure"))
			for(var/obj/game/structure/T in world)
				if(T.z)
					text2file("1;[T.type];[T.x];[T.y];[T.z];[T.owner];[T.condition];[T.durability];[T.maxdurability];[T.savvalue1];[T.savvalue2];[T.savvalue3];",fname)

	proc/Load(fname)
		var/first_list[] = dd_file2list(fname)
		for(var/O in first_list)
			if(O)
				var/namt = text2num(TextBreak(O,1,";"))
				var/ntype = TextBreak(O,2,";")
				var/nx = text2num(TextBreak(O,3,";"))
				var/ny = text2num(TextBreak(O,4,";"))
				var/nz = text2num(TextBreak(O,5,";"))
				var/nowner = TextBreak(O,6,";")
				var/nstack = TextBreak(O,7,";")
				var/ndura = TextBreak(O,8,";")
				var/nmaxdura = TextBreak(O,9,";")
				var/nsav1 = TextBreak(O,10,";")
				var/nsav2 = TextBreak(O,11,";")
				var/nsav3 = TextBreak(O,12,";")
				var/obj/game/nend = new ntype(locate(nx,ny,nz))
				if(istype(nend,/obj/game/structure))
					var/ncond = TextBreak(O,7,";")
					nend:condition = text2num(ncond)
				if(!findtext(nowner,"|"))
					nowner = "$[nowner]|"
				nend.owner = nowner
				nend.stackable = text2num(nstack)
				nend.durability = text2num(ndura)
				nend.maxdurability = text2num(nmaxdura)
				nend.savvalue1 = text2num(nsav1)
				nend.savvalue2 = text2num(nsav2)
				nend.savvalue3 = text2num(nsav3)
				/*if(istype(nend,/obj/offline_sentry))
					nend.name = "offline sentry - [nowner]"
				if(istype(nend,/obj/sentry))
					nend.name = "sentry - [nowner]"*/
				if(istype(nend,/obj/game/item) && nend.stackable)
					var/loca = locate(nx,ny,nz)
					var/obj/game/amov = nend
					if(isnum(namt))
						amov.amount = namt
					else
						amov.amount = 1
					amov.loc = null
					UpdateStack(amov)
					MoveStack(amov, loca, amov.amount)


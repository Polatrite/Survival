/*
obj procs.dm

Almost all of this code handles object stacking. I created this wackysack stacking
mechanism way back in 2002 when Survival1 was choking to death because we had like
40k objects instantiated at a time on a 433mhz PC. Modern stacking systems are way
better and could replace this, but hey - it gets the job done.

Also has some drag-and-drop stuff.

*/

proc
	Validate(A, ls[])
		if(A == null)
			return 0
		if(ls.Find(A))
			return 1
		return 0

	CheckNum(val, val_limit)
		if(val <= 0)
			val = 1
		val = round(val)
		if(val_limit)
			if(val > val_limit)
				val = val_limit

	CheckStack(atom/A, findtype, val)
		for(var/obj/game/O in A)
			if(O.type == findtype)
				if(O.amount >= val)
					return O
		return 0


	MoveStack(obj/game/O, atom/A, val)
		var/obj/game/I
		var/checked = 0
		if(O.amount > val)
			I = RemStack(O, val)
			checked = 1
		if(O.amount == val && !checked)
			I = O
			checked = 1
//		if(O.amount < val && !checked)
//			bug("MoveStack([O].amount not sufficient for MoveStack())")
		var/found = 0
		if(O.stackable)
			for(var/obj/game/L in A)
				if(istype(L, I.type) && L.name == I.name && L.stackable)
					AddStack(I, L)
					if(ismob(A))
						L.owner = "$[A.name]|"
					found = 1
					break
		if(!found)
			I.Move(A)
			UpdateStack(I)
			if(ismob(A))
				I.owner = A.name
		return 1

	AddStack(obj/game/O, obj/game/I)
		I.amount += O.amount
		UpdateStack(I)
		del(O)

	RemStack(obj/game/O, val)
		if(O.amount > val)
			O.amount -= val
			var/obj/game/I = O.Clone()
			I.amount = val
			UpdateStack(I)
			UpdateStack(O)
			return I
		if(O.amount == val)
			UpdateStack(O)
			return O

	DelStack(obj/game/O, val)
		var/checked = 0
		if(O.amount > val)
			O.amount -= val
			UpdateStack(O)
			checked = 1
		if(O.amount == val && !checked)
			checked = 1
			del(O)
//		if(!checked && O.amount < val)
//			bug("MoveStack([O].amount not sufficient for DelStack())")

	UpdateStack(obj/game/O)
		if(O.stackable == null)
			O.stackable = 1
		if(O.carryable == null)
			O.carryable = 1
		var/workingnum = num2text(O.amount)
		var/letter1
		var/letter2
		var/letter3
		var/letter4
		var/icon/a1
		var/icon/a2
		var/icon/a3
		var/icon/a4
		if(lentext(workingnum) == 1)
			letter1 = copytext(workingnum, 1, 2)
		if(lentext(workingnum) == 2)
			letter2 = copytext(workingnum, 1, 2)
			letter1 = copytext(workingnum, 2, 3)
		if(lentext(workingnum) == 3)
			letter3 = copytext(workingnum, 1, 2)
			letter2 = copytext(workingnum, 2, 3)
			letter1 = copytext(workingnum, 3, 4)
		if(lentext(workingnum) == 4)
			letter4 = copytext(workingnum, 1, 2)
			letter3 = copytext(workingnum, 2, 3)
			letter2 = copytext(workingnum, 3, 4)
			letter1 = copytext(workingnum, 4, 5)
		if(letter1)
			a1 = new('numbers.dmi',"[letter1]")
		if(letter2)
			a2 = new('numbers.dmi',"[letter2]")
			a2.Shift(WEST,8)
		if(letter3)
			a3 = new('numbers.dmi',"[letter3]")
			a3.Shift(WEST,16)
		if(letter4)
			a4 = new('numbers.dmi',"[letter4]")
			a4.Shift(WEST,24)
		if(O.amount > 1)
			O.overlays = list()
			O.overlays += a1
			O.overlays += a2
			O.overlays += a3
			O.overlays += a4
		else
			O.overlays = list()
		var/hassuffix = 0
		var/msgequip
		var/msgdura
		var/msgwater
		if(O.equipped_on != null)
			hassuffix = 1
			msgequip = "<font color=\"#0000B0\">(E) "
		if(O.durability)
			hassuffix = 1
			msgdura = "<font color=\"#900000\">[O.durability]/[O.maxdurability] "
		if(istype(O, /obj/game/item/water_container))
			hassuffix = 1
			msgwater = "<font color=\"#900000\">[O.savvalue1]/[O.savvalue2] "
		if(hassuffix)
			O.suffix = "[msgequip][msgdura][msgwater]"
		if(istype(O.loc, /mob/game/player))
			var/mob/game/player/M = O.loc
			M.UpdateWeights()


/*	PoolItems(atom/L, obj/U, max_number)
		var/type = U.type
		var/obj/game/item/O
		var/pool = 0
		for(O in L.contents)
			if(istype(O,type))
				pool += O.amount
				del(O)
		if(max_number)
			while(pool >= max_number)
				new type(L.contents, max_number)
				pool -= max_number
		if(pool)
			var/obj/Y = new type(L.contents)
			Y.amount = pool
			Y.suffix = "(x[pool])"*/


obj
	game
		/*Write(savefile/F)
			. = ..()
			if(F && F.dir)
				F.dir.Remove(".0/mouse_drag_pointer")
				F.dir.Remove("mouse_drag_pointer")
				F.dir.Remove(".0/overlays")
				F.dir.Remove("overlays")*/

		proc
			ChangeDurability(mod)
				durability += mod
				suffix = "<font color=\"#900000\">[durability]/[maxdurability]"
				Unstack()
				if(durability <= 0)
					view(src.loc, 1) << "<B><font color=\"#900000\">[src] [src.break_msg]"
					DelStack(src, 1)
				if(durability > maxdurability)
					durability = maxdurability

			Unstack()
				stackable = 0
				if(amount > 1)
					var/obj/game/O = new type(loc)
					O.amount = amount - 1
					amount = 1
					UpdateStack(src)
					UpdateStack(O)

		item
/*			MouseDrop(ovrObj, srcLoc, ovrLoc)
				if(get_dist(usr, srcLoc) > 1) return 0
				return p_DragDropObject(srcLoc, ovrLoc, src, usr)*/

			MouseDrop(over_object, src_location, over_location, src_control, over_control, params)
				if(!istype(usr, /mob/game)) return
				if(src_location == over_location)
					return
				if(src_control == "default.menu_browser" || src_control == "default.stat_browser" || src_control == "mainPane.inventory")
					if(istype(over_location, /turf))
						usr:v_drop(src, over_location)
				if(over_control == "default.menu_browser" || over_control == "default.stat_browser" || over_control == "mainPane.inventory")
					usr:v_get(src)
				if(src_control == "shop" || src_control == "shop.grid")
					if(over_control == "default.info1" || over_control == "inventory" || over_control == "inventory.grid")
						usr:ConfirmBuy(src)


proc
	list2text(list/string,delim)
		var/text = ""
		for(var/X in string)
			text += "[X][delim]"
		return copytext(text,1,length(text))
	sadmin_insert(list/List,Elem,Pos = 0)
		if (isnull(List))
			return
		if ((Pos <= 0) || (Pos > length(List)))
			List += Elem
			return
		var
			list/tempList = List.Copy()
			member
		for(member in List)
			if (!isnum(member))
				if ( !isnull(List[member]) )
					tempList[member] = List[member]
		List.Cut()
		if (Pos == 1)
			List += list(Elem) + tempList
			return
		var/list/endList = tempList.Copy(Pos,0)
		for(member in endList)
			if (!isnum(member))
				if ( !isnull(tempList[member]) )
					endList[member] = tempList[member]

		tempList.Cut(Pos,0)

		List += tempList + list(Elem) + endList

mob/Login()
	..()
	if(key == "Polatrite" || key == "Yota")
		src.verbs.Add(typesof(/mob/admin/verb))
//		src.verbs.Add(typesof(/mob/proc))

mob/admin

	New()
		del(src)

mob/var
	show_messages = 1
	ilistedit[] = list()

mob/admin/verb
	iwho()
		var/count = 0
		for(var/mob/game/M in world)
			if(M.key)
				src << "<b>[M]</b> - [M.exptotal] - [M.client.inactivity/10] seconds - [M.exp_per_hour] exp per hour"
				count++
		src << "<b>Total players: [count]</b>"



	iconfig()
		set category = "Admin"
		if(show_messages)
			show_messages = 0
			usr << "You are no longer showing admin messages."
		else
			show_messages = 1
			usr << "You are now showing admin messages."

	igmusic(F as file)
		set category = "Admin"
		for(var/mob/M in world)
			M << sound(F)
		world << "<B><center>[usr] decided that you should listen this..."

	imusic(var/mob/M in world, F as file)
		set category = "Admin"
		M << sound(F)
		src << "You force [M] to listen to [F]."
		M << "<center>[usr] decided that you should listen to this..."

	clone(atom/movable/O in world)
		set category = "Admin"
		var/mob/M = O
		if(istype(M) && M.key)
			src << "You can't duplicate PCs' mobs."
			return
		var/atom/new_O = new O.type(O.loc)
		for(var/V in O.vars)
			if(issaved(O.vars[V]))
				new_O.vars[V] = O.vars[V]

	force(atom/caller in world, msg as text)
		set category = "Admin"
		var/variable
		var/argz[]
		argpick
		var/class = input(src,"Select an argument","Variable Type") in list("done","text","num","type","reference","icon","file","done")
		if(!class)
			return
		switch(class)
			if("text")
				variable = input("Enter new text:","Text") as text
			if("num")
				variable = input("Enter new number:","Num") as num
			if("type")
				variable = input("Enter type:","Type") \
					in typesof(/atom)
			if("reference")
				variable = input("Select reference:","Reference") as mob|obj|turf|area in world
			if("file")
				variable = input("Pick file:","File") \
					as file
			if("icon")
				variable = input("Pick icon:","Icon") \
					as icon
			if("null")
				variable = ""
			if("done")
				var/argls = list2text(argz,",")
				src << "[caller].[msg]([argls])"
				if(hascall(caller,msg))
					call(caller,msg)(arglist(argz))
				return
		argz += list(variable)
		goto argpick

/*	execute(msg in typesof(/proc))
		set category = "Admin"
		var/variable
		var/argz[]
		argpick
		var/class = input(src,"Select an argument","Variable Type") in list("done","text","num","type","reference","icon","file","done")
		if(!class)
			return
		switch(class)
			if("text")
				variable = input("Enter new text:","Text") as text
			if("num")
				variable = input("Enter new number:","Num") as num
			if("type")
				variable = input("Enter type:","Type") \
					in typesof(/atom)
			if("reference")
				variable = input("Select reference:","Reference") as mob|obj|turf|area in world
			if("file")
				variable = input("Pick file:","File") \
					as file
			if("icon")
				variable = input("Pick icon:","Icon") \
					as icon
			if("null")
				variable = ""
			if("done")
				var/argls = list2text(argz,",")
				src << "[caller].[msg]([argls])"
				if(hascall(caller,msg))
					call(caller,msg)(arglist(argz))
				return
		argz += list(variable)
		goto argpick*/

	ghostmode()
		set desc = "Makes you ghostlike, enabling free movement"
		set category = "Admin"
		if(density == 1)
			src << "You are now in ghost mode."
			src.density = 0
		else
			src << "You are now normal."
			src.density = 1

	imemory(A as anything in list("Atoms","Mobs","Objs","Turfs","Areas"))
		set category = "Admin"
		var/val = 0
		var/list/typelist = new/list()
		if(A == "Atoms")
			typelist.Add(typesof(/atom))
			typelist += list(/atom)
			var/thetype = input("Select a type.","Memory","") in typelist
			for(var/atom/B in world)
				if(B.type == thetype)
					val += 1
			usr << "[thetype]: [val]"
		if(A == "Mobs")
			typelist.Add(typesof(/mob))
			typelist += list(/mob)
			var/thetype = input("Select a type.","Memory","") in typelist
			for(var/atom/B in world)
				if(B.type == thetype)
					val += 1
			usr << "[thetype]: [val]"
		if(A == "Objs")
			typelist.Add(typesof(/obj))
			typelist += list(/obj)
			var/thetype = input("Select a type.","Memory","") in typelist
			for(var/atom/B in world)
				if(B.type == thetype)
					val += 1
			usr << "[thetype]: [val]"
		if(A == "Turfs")
			typelist.Add(typesof(/turf))
			typelist += list(/turf)
			var/thetype = input("Select a type.","Memory","") in typelist
			for(var/atom/B in world)
				if(B.type == thetype)
					val += 1
			usr << "[thetype]: [val]"
		if(A == "Areas")
			typelist.Add(typesof(/area))
			typelist += list(/area)
			var/thetype = input("Select a type.","Memory","") in typelist
			for(var/atom/B in world)
				if(B.type == thetype)
					val += 1
			usr << "[thetype]: [val]"

	ireboot()
		set desc = "Reboot the world"
		set category = "Admin"
		world << "<B><center>[usr] has rebooted the world!"
		world.Reboot()

	ishutdown()
		set desc = "Shutdown the world"
		set category = "Admin"
		world << "<B><center>[usr] has shutdown the world!"
		world.Del()

	irepop()
		set category = "Admin"
		if(show_messages)
			world << "<B><center>[usr] has respawned the world!"
		world.Repop()

	gchat(msg as text)
		set category = "Admin"
		world << "<BIG><B><center>[usr]:"
		world << "<center>[msg]"

	cwarp(aa as num, bb as num, cc as num)
		set category = "Admin"
		usr.x = aa
		usr.y = bb
		usr.z = cc

	boot(mob/M in world)
		set category = "Admin"
		world << "<B><center>[usr] has booted [M]!"
		M.Logout()

	watch(mob/M in world, msg in list("View","Statpanels","Both","Reset to self"))
		set category = "Admin"
		if(msg == "View")
			client.perspective = EYE_PERSPECTIVE
			client.eye = M
		if(msg == "Statpanels" && M.client)
			client.statobj = M
		if(msg == "Both" && M.client)
			client.perspective = EYE_PERSPECTIVE
			client.eye = M
			client.statobj = M
		if(msg == "Reset to self")
			client.perspective = MOB_PERSPECTIVE
			client.eye = src
			client.statobj = src
		if(msg != "Reset to self")
			src << "<B>You are now watching [M].</B>"


	transfer(var/mob/M in world, var/mob/N as null|mob in world)
		set desc = "Transfers a mob or player to your location"
		set category = "Admin"
		if(N == null)
			N = usr
		M:Transfer(N.loc)
		if(show_messages)
			view() << "<B>[usr] transfers [M] to [N].</B>"

	warp(var/mob/M in world)
		set desc = "Warps you to a mob or player"
		set category = "Admin"
		usr:Transfer(M.loc)
		if(show_messages)
			view() << "<B>[usr] warps to [M].</B>"

	load()
		set desc = "Create a mob of any type"
		set category = "Admin"
		var/html = "<html><body bgcolor=black text=blue link=white vlink=white alink=white>"
		var/list/L = new/list()
		L.Add (typesof(/atom))
		for(var/X in L)
			html += "<a href=byond://?src=\ref[src];action=create;type=[X]>[X]</a><br>"
		usr << browse(html, "window=browser")

	oload()
		set desc = "Create a obj of any type"
		set category = "Admin"
		var/html = "<html><body bgcolor=black text=blue link=white vlink=white alink=white>"
		var/list/L = new/list()
		L.Add (typesof(/obj))
		for(var/X in L)
			html += "<a href=byond://?src=\ref[src];action=create;type=[X]>[X]</a><br>"
		usr << browse(html, "window=browser")

	mload()
		set desc = "Create a obj of any type"
		set category = "Admin"
		var/html = "<html><body bgcolor=black text=blue link=white vlink=white alink=white>"
		var/list/L = new/list()
		L.Add (typesof(/mob))
		for(var/X in L)
			html += "<a href=byond://?src=\ref[src];action=create;type=[X]>[X]</a><br>"
		usr << browse(html, "window=browser")

	tload()
		set desc = "Create a turf of any type"
		set category = "Admin"
		var/html = "<html><body bgcolor=black text=blue link=white vlink=white alink=white>"
		var/list/L = new/list()
		L.Add (typesof(/turf))
		for(var/X in L)
			html += "<a href=byond://?src=\ref[src];action=create;type=[X]>[X]</a><br>"
		usr << browse(html, "window=browser")

	vision(mob/M in world)
		set category = "Admin"
		var/I = input("What would you like to modify?","Vision") in list("see in dark","see infrared","luminosity","infra luminosity","sight")
		switch(I)
			if("see in dark")
				M.see_in_dark = input("How many tiles out?") as num
			if("see infrared")
				M.see_infrared = input("How many tiles out?") as num
			if("luminosity")
				M.luminosity = input("How many tiles out?") as num
			if("infra luminosity")
				M.infra_luminosity = input("How many tiles out?") as num
			if("sight")
				M.sight = input("Sight flags are as follows:\nBlind = 1\nSee invis = 2\nSee mobs = 4\nSee objs = 8\nSee turfs = 16\nSee self = 32\nSee infra = 64\nPlease select your sight bits and add the values up.") as num

	graw(msg as message)
		set category = "Admin"
		world << msg

	annihilate(var/atom/movable/I in world)
		set category = "Admin"
		if(ismob(I))
			var/mob/M = I
			world.log << "(Admin) [src] annihilated [M]"
			del(M)
		if(isobj(I))
			var/obj/O = I
			world.log << "(Admin) [src] annihilated [O]"
			del(O)

	edit(atom/O in world)
		set desc = "(object) Modify/examine the variables of any object"
		set category = "Admin"
		var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
		var/variables[0]
		html += "<h3 align=center>[O.name] ([O.type])</h3>"
		html += "<table width=100%>\n"
		html += "<tr>"
		html += "<td>VARIABLE NAME</td>"
		html += "<td>PROBABLE TYPE</td>"
		html += "<td>CURRENT VALUE</td>"
		html += "</tr>\n"
		for(var/X in O.vars) variables += X
		//Protect the key var for mobs, since that's a pretty Adminortant var!
		variables -= "key"
		for(var/X in variables)
			html += "<tr>"
			html += "<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
			html += X
			html += "</a>"
			if(!issaved(O.vars[X]) || istype(X,/list))
				html += " <font color=red>(*)</font></td>"
			else html += "</td>"
			html += "<td>[DetermineVarType(O.vars[X])]</td>"
			html += "<td>[DetermineVarValue(O.vars[X])]</td>"
			html += "</tr>"
		html += "</table>"
		html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
			may potentially cause an error if modified.  If you ignore that warning and \
			continue to modify the variable, you alone are responsible for whatever \
			mayhem results!</body></html>"
		usr << browse(html, "window=browser")

	cedit(mob/M in world)
		var/client/O = M.client
		set desc = "(object) Modify/examine the variables of any object"
		set category = "Admin"
		var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
		var/variables[0]
		html += "<h3 align=center>[O.key] ([O.type])</h3>"
		html += "<table width=100%>\n"
		html += "<tr>"
		html += "<td>VARIABLE NAME</td>"
		html += "<td>PROBABLE TYPE</td>"
		html += "<td>CURRENT VALUE</td>"
		html += "</tr>\n"
		for(var/X in O.vars) variables += X
		//Protect the key var for mobs, since that's a pretty Adminortant var!
		variables -= "key"
		for(var/X in variables)
			html += "<tr>"
			html += "<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
			html += X
			html += "</a>"
			if(!issaved(O.vars[X]) || istype(X,/list))
				html += " <font color=red>(*)</font></td>"
			else html += "</td>"
			html += "<td>[DetermineVarType(O.vars[X])]</td>"
			html += "<td>[DetermineVarValue(O.vars[X])]</td>"
			html += "</tr>"
		html += "</table>"
		html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
			may potentially cause an error if modified.  If you ignore that warning and \
			continue to modify the variable, you alone are responsible for whatever \
			mayhem results!</body></html>"
		usr << browse(html, "window=browser")

	menuedit(atom/a as mob|obj|turf|area in world, mob/var/chs as anything)
		set category = "Admin"
		var/varlist[0]
		for(var/X in a.vars)
			varlist += X
		varlist -= "key"
		var/o=input("Edit which var?") in a.vars
		var/otype=DetermineVarType(a.vars[o])
		var/class = input(usr,"Change [o] to what? ([otype])","Variable Type") as null|anything in list("text","num","type","reference","icon","file")
		switch(class)
			if("text")
				a.vars[o] = input("Enter new text:","Text",a.vars[o]) as text
			if("num")
				a.vars[o] = input("Enter new number:","Num",a.vars[o]) as num
			if("type")
				a.vars[o] = input("Enter type:","Type",a.vars[o]) in typesof(/atom)
			if("reference")
				a.vars[o] = input("Select reference:","Reference", a.vars[o]) as mob|obj|turf|area in world
			if("file")
				a.vars[o] = input("Pick file:","File",a.vars[o]) as file
			if("icon")
				a.vars[o] = input("Pick icon:","Icon",a.vars[o]) as icon

mob/game/Topic(href,href_list[])
	switch(href_list["action"])
		if("create")
			var/new_type = href_list["type"]
			var/atom/O = new new_type(src.loc)
			usr << "Created a new [O.name]."

	. = ..()

atom/Topic(href,href_list[])
/*	switch(href_list["action"])
		if("edit")
			var/variable = href_list["var"]
			var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
				in list("text","num","type","reference","icon","file","restore to default")
			if(!class) return
			switch(class)
				if("restore to default")
					src.vars[variable] = initial(src.vars[variable])
				if("text")
					src.vars[variable] = input("Enter new text:","Text",src.vars[variable]) as text
				if("num")
					src.vars[variable] = input("Enter new number:","Num",src.vars[variable]) as num
				if("type")
					src.vars[variable] = input("Enter type:","Type",src.vars[variable]) \
						in typesof(/atom)
				if("reference")
					src.vars[variable] = input("Select reference:","Reference", \
						src.vars[variable]) as mob|obj|turf|area in world
				if("file")
					src.vars[variable] = input("Pick file:","File",src.vars[variable]) \
						as file
				if("icon")
					src.vars[variable] = input("Pick icon:","Icon",src.vars[variable]) \
						as icon
	. = ..()*/
	switch(href_list["action"])
		if("listremove")
			var/variable = href_list["var"]
			var/linker[] = href_list["linker"]
			linker = linker
			var/loc_of_var = usr.ilistedit.Find(variable)
			if(loc_of_var + 1 >= usr.ilistedit.len)
				usr.ilistedit.Remove()
			else
				usr.ilistedit.Cut(loc_of_var,loc_of_var + 1)
			linker = usr.ilistedit
			usr << "<B>Item removed."
		if("listinsert")
			var/variable = href_list["var"]
			var/loc_of_var = usr.ilistedit.Find(variable)
			var/linker[] = href_list["linker"]
			linker = linker
			var/class = input(usr,"Insert what?","List Insert") as null|anything \
				in list("text","num","type","reference","icon","file")
			if(!class) return
			switch(class)
				if("text")
					var/v = input("Enter new text:","Text") as text
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("num")
					var/v = input("Enter new number:","Num") as num
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("type")
					var/v = input("Enter type:","Type") in typesof(/atom)
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("reference")
					var/v = input("Select reference:","Reference") as mob|obj|turf|area in world
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("file")
					var/v = input("Pick file:","File") as file
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("icon")
					var/v = input("Pick icon:","Icon") as icon
					sadmin_insert(usr.ilistedit,v,loc_of_var)
			linker = usr.ilistedit
		if("listadd")
			var/variable = href_list["var"]
			var/loc_of_var = usr.ilistedit.Find(variable)
			if(href_list["action"] == "listadd")
				loc_of_var = usr.ilistedit.len + 1
			var/linker[] = href_list["linker"]
			linker = linker
			var/class = input(usr,"Insert what?","List Insert") as null|anything \
				in list("text","num","type","reference","icon","file")
			if(!class) return
			switch(class)
				if("text")
					var/v = input("Enter new text:","Text") as text
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("num")
					var/v = input("Enter new number:","Num") as num
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("type")
					var/v = input("Enter type:","Type") in typesof(/atom)
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("reference")
					var/v = input("Select reference:","Reference") as mob|obj|turf|area in world
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("file")
					var/v = input("Pick file:","File") as file
					sadmin_insert(usr.ilistedit,v,loc_of_var)
				if("icon")
					var/v = input("Pick icon:","Icon") as icon
					sadmin_insert(usr.ilistedit,v,loc_of_var)
			linker = usr.ilistedit
		if("listedit")
			var/variable = href_list["var"]
			var/loc_of_var = usr.ilistedit.Find(variable)
			var/linker[] = href_list["linker"]
			linker = linker
			var/class = input(usr,"Edit to what?","List Edit") as null|anything \
				in list("text","num","type","reference","icon","file")
			if(!class) return
			switch(class)
				if("text")
					var/v = input("Enter new text:","Text") as text
					usr.ilistedit[loc_of_var] = v
				if("num")
					var/v = input("Enter new number:","Num") as num
					usr.ilistedit[loc_of_var] = v
				if("type")
					var/v = input("Enter type:","Type") in typesof(/atom)
					usr.ilistedit[loc_of_var] = v
				if("reference")
					var/v = input("Select reference:","Reference") as mob|obj|turf|area in world
					usr.ilistedit[loc_of_var] = v
				if("file")
					var/v = input("Pick file:","File") as file
					usr.ilistedit[loc_of_var] = v
				if("icon")
					var/v = input("Pick icon:","Icon") as icon
					usr.ilistedit[loc_of_var] = v
			linker = usr.ilistedit
		if("edit")
			var/variable = href_list["var"]
			if(istype(src.vars[variable],/list))
				var/html
				usr.ilistedit = src.vars[variable]
				for(var/L in usr.ilistedit)
					html += "<center><a href=byond://?src=\ref[src];action=listinsert;var=[L];linker=[src.vars[variable]]>(Insert)</a><br>"
					html += "<a href=byond://?src=\ref[src];action=listedit;var=[L];linker=[src.vars[variable]]>[L]</a><br>"
					html += "<a href=byond://?src=\ref[src];action=listremove;var=[L];linker=[src.vars[variable]]>(Remove)</a><br>"
					html += "<br>"
				if(!html)
					html += "No items found.<br>"
				html += "<br><a href=byond://?src=\ref[src];action=listadd;var=[src.vars[variable]]>(Add)</a><br>"
				usr << browse(html, "window=browser")
				return
			var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
				in list("text","num","type","reference","icon","file","restore to default")
			if(!class) return
			switch(class)
				if("restore to default")
					src.vars[variable] = initial(src.vars[variable])
				if("text")
					src.vars[variable] = input("Enter new text:","Text",src.vars[variable]) as text
				if("num")
					src.vars[variable] = input("Enter new number:","Num",src.vars[variable]) as num
				if("type")
					src.vars[variable] = input("Enter type:","Type",src.vars[variable]) \
						in typesof(/atom)
				if("reference")
					src.vars[variable] = input("Select reference:","Reference", \
						src.vars[variable]) as mob|obj|turf|area in world
				if("file")
					src.vars[variable] = input("Pick file:","File",src.vars[variable]) \
						as file
				if("icon")
					src.vars[variable] = input("Pick icon:","Icon",src.vars[variable]) \
						as icon
	. = ..()

mob/proc
	DetermineVarType(variable)
		if(istext(variable)) return "Text"
		if(isloc(variable)) return "Atom"
		if(isnum(variable)) return "Num"
		if(isicon(variable)) return "Icon"
		if(istype(variable,/datum)) return "Type (or datum)"
		if(isnull(variable)) return "(Null)"
		return "(Unknown)"

	DetermineVarValue(variable)
		if(istext(variable)) return "\"[variable]\""
		if(isloc(variable)) return "<i>[variable:name]</i> ([variable:type])"
		if(isnum(variable))
			return variable
		if(isnull(variable)) return "null"
		return "- [variable] -"


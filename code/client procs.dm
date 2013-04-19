/*
This is mostly a bunch of boring client stuff.

- Preloads browser resources and images
- Handles keymapping for movement
- Has some client-related stuff for centering the window and whatnot

*/

client
	var/rscLoaded = 0
	New()
		for(var/f in flist("SurvivalResources1/"))
			src << browse_rsc(file("SurvivalResources1/[f]"), "[f]")
		..()
		for(var/f in flist("SurvivalResources2/"))
			src << browse_rsc(file("SurvivalResources2/[f]"), "[f]")
		for(var/t in craftables)
			for(var/craftable/c in craftables[t])
				src << browse_rsc(icon(c.icon), "sCraft-[ckey(c.name)].png")
		for(var/i in resourceIcons)
			src << browse_rsc(resourceIcons[i], "sResource-[ckey(i)].png")
		rscLoaded = 1

	Command(command_given as command_text|null)
		src.parse(command_given)

	Topic(ref, params[], atom/hsrc)
		//alert("HALLO THAR [params["action"]]-[params["accountname"]]-[params["password"]]-")
		if(istype(src.mob, /mob/game))
			if(params["tab"])
				current_tab = params["tab"]

			if(params["action"] == "skillset")
				switch(params["type"])
					if("decrease")
						v_skillset(src.mob, DECREASE, params["skill"])
					if("increase")
						v_skillset(src.mob, INCREASE, params["skill"])
					if("lock")
						v_skillset(src.mob, LOCKED, params["skill"])

			else if(params["action"] == "inventory")
				winset(src, "mainPane.inventory", "is-visible=true")
				//winset(src, "default.menu_browser", "is-visible=false")

			else if(params["action"] == "survival")
				v_craft(src.mob, "Survival", src.mob:skill_survival)

			else if(params["action"] == "settings")
				var/vol
				while(vol > 100 || vol < 0 || !isnum(vol))
					vol = input("Set the new volume percentage.","Volume", mob:volume) as num
				mob:volume = vol
				mob:Music(MUSIC_STOP)
				mob:Music(999)

			if(ref == "killfocus")
				winset(src, "chatPublic.input", "focus=true")
			if(params["action"])
				show_interface(1)
		if(istype(src.mob, /mob/login))
			if(params["action"] == "login")
				var/accountname = html_encode(url_decode(params["accountname"]))
				var/password = html_encode(url_decode(params["password"]))

				accountname = ckey(accountname)

				var/account/A = RetrieveAccount("[accountname]-Polatech")
				if(A)
					if(A.password == password)
						//alert("You got some LOGIN! :D  = [msg]")
						mob:account = A
						mob:logged_in = 1
						return
					else
						alert("Incorrect password.")
				else
					alert("That account doesn't exist.")

				mob:AccountLogin()

			if(params["action"] == "create")
				var/html = account_create_html
				src << browse(html, "window=browser")
				winset(src, "browser", "size=600x380")
				center_window("browser","default")


			if(params["action"] == "createaccount")
				var/accountname = html_encode(url_decode(params["accountname"]))
				var/password = html_encode(url_decode(params["password"]))
				var/confirmpassword = html_encode(url_decode(params["confirmpassword"]))

				accountname = ckey(accountname)

				if(password != confirmpassword)
					alert("Your passwords do not match!")
					var/html = account_create_html
					src << browse(html, "window=browser")
					winset(src, "browser", "size=600x380")
					center_window("browser","default")
					return

				mob:account = CreateAccount("[accountname]-Polatech", password)
				mob:logged_in = 1
				return

		else
			if(params["page"] == "version")
				src << browse(version_history_html, "window=browser")




		//alert("going to teh Mob [src]-[usr]-[src.mob.type]-[hsrc]-")
		return ..()

	North()
		if(istype(mob, /mob/game) && !mob:action && mob:moving <= 0)
			if(..())
				mob:moving = 1
				spawn(mob:move_delay)
					mob:moving = 0
		else
			return

	South()
		if(istype(mob, /mob/game) && !mob:action && mob:moving <= 0)
			if(..())
				mob:moving = 1
				spawn(mob:move_delay)
					mob:moving = 0
		else
			return

	East()
		if(istype(mob, /mob/game) && !mob:action && mob:moving <= 0)
			if(..())
				mob:moving = 1
				spawn(mob:move_delay)
					mob:moving = 0
		else
			return

	West()
		if(istype(mob, /mob/game) && !mob:action && mob:moving <= 0)
			if(..())
				mob:moving = 1
				spawn(mob:move_delay)
					mob:moving = 0
		else
			return

	Northeast()
		if(istype(mob, /mob/game) && !mob:action && !mob:moving)
			mob:moving = 1
			spawn(mob:move_delay)
				mob:moving = 0
			if(src.mob.dir == EAST || src.mob.dir == SOUTH)
				src.mob.dir = turn(src.mob.dir, 90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, -90)
			if(src.mob.dir == WEST || src.mob.dir == NORTH)
				src.mob.dir = turn(src.mob.dir, -90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, 90)

	Northwest()
		if(istype(mob, /mob/game) && !mob:action && !mob:moving)
			mob:moving = 1
			spawn(mob:move_delay)
				mob:moving = 0
			if(src.mob.dir == WEST || src.mob.dir == SOUTH)
				step(src.mob, turn(src.mob.dir, -90))
				src.mob.dir = turn(src.mob.dir, 90)
			if(src.mob.dir == EAST || src.mob.dir == NORTH)
				src.mob.dir = turn(src.mob.dir, 90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, -90)

	Southeast()
		if(istype(mob, /mob/game) && !mob:action && !mob:moving)
			mob:moving = 1
			spawn(mob:move_delay)
				mob:moving = 0
			if(src.mob.dir == EAST || src.mob.dir == NORTH)
				src.mob.dir = turn(src.mob.dir, -90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, 90)
			if(src.mob.dir == WEST || src.mob.dir == SOUTH)
				src.mob.dir = turn(src.mob.dir, 90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, -90)

	Southwest()
		if(istype(mob, /mob/game) && !mob:action && !mob:moving)
			mob:moving = 1
			spawn(mob:move_delay)
				mob:moving = 0
			if(src.mob.dir == WEST || src.mob.dir == NORTH)
				src.mob.dir = turn(src.mob.dir, 90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, -90)
			if(src.mob.dir == EAST || src.mob.dir == SOUTH)
				src.mob.dir = turn(src.mob.dir, -90)
				step(src.mob, src.mob.dir)
				src.mob.dir = turn(src.mob.dir, 90)

	proc
		parse(command_given as text)
			if(hascall(src.mob,(command_given)) && src.mob.verbs.Find(command_given))
				return ..()
			else
				if(length(command_given) > 1)
					src.mob << "<B><font color = \"blue\">The command '[command_given]' doesn't exist!"

		show_interface(all)
			if(istype(src.mob, /mob/game))
				//src << browse_rsc('SurvivalResources2/sActions.js', "sActions.js")
				//src << browse(mob:output_stat_html(), "window=stat_browser&file=stats.htm")
				mob:UpdateStats()
				if(all)
					src << browse(mob:output_menu_html(), "window=menu_browser&file=menu.htm")

		center_window(control_id,loc_id)
			if(!(control_id&&loc_id))
				return
			var/size = winget(src, control_id, "size")
			var/pos = findtext(size,"x",1,0)
			var/w = text2num(copytext(size,1,pos))
			var/h = text2num(copytext(size,pos+1))
			var/Size = winget(src, loc_id, "size")
			var/x_pos = findtext(Size,"x",1,0)
			var/W = text2num(copytext(Size,1,x_pos))
			var/H = text2num(copytext(Size,x_pos+1))
			var/Pos = winget(src, loc_id, "pos")
			var/c_pos = findtext(Pos,",",1,0)
			var/X = text2num(copytext(Pos,1,c_pos))
			var/Y = text2num(copytext(Pos,c_pos+1))
			var/x = (W - w) / 2 + X
			var/y = (H - h) / 2 + Y
			winset(src, control_id, "pos=[x],[y]")
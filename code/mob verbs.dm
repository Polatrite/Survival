/*
mob verbs.dm

Lots of commands. Most of these are really for debugging, and many are invisible to players
or unused entirely. Generally speaking I don't like using verbs where I can help it, and
wanted to make the game mostly mouse centric.

*/


mob/game
	verb
		who()
			var/count = 0
			for(var/mob/game/M in world)
				if(M.key)
					mess("<b>[M]</b> - [M.exptotal]")
					count++
			mess("<b>Total players: [count]</b>")

		kills()
			var/count = 0
			for(var/x in recent_kills)
				mess("Killed [x], [round(recent_kills[x]/600)] minutes remaining.")
				count++
			mess("<b>Total kills: [count]</b>")

		combine_inventory()
			var/mob/M = new /mob()
			for(var/obj/game/O in usr)
				MoveStack(O, M, O.amount)
			for(var/obj/game/O in M)
				MoveStack(O, usr, O.amount)
			weight_held = 0
			for(var/obj/game/O in usr)
				weight_held += O.weight * O.amount
			del(M)

/*		add_batch_ownership(msg as text, pik in list("door","floor","wall"))
			var/found[] = list()
			for(var/atom/structure/A in world)
				if(findtext(A.owner,"[usr.ckey]|",1,length(usr.ckey)+2))
					if(pik == "door" && (istype(A,/atom/structure/door/wooden_door) || istype(A,/atom/structure/door/sandstone_door)))
						found += list(A)
					if(pik == "floor" && (istype(A,/atom/structure/wooden/wooden_floor) || istype(A,/atom/structure/sandstone/floor)))
						found += list(A)
					if(pik == "wall" && ((istype(A,/atom/structure/wooden) && !istype(A,/atom/structure/wooden/wooden_floor)) || (istype(A,/atom/structure/sandstone) && !istype(A,/atom/structure/sandstone/floor))))
						found += list(A)
			msg = ckey(msg)
			for(var/atom/structure/A in found)
				if(!findtext(A.owner,"[msg]|"))
					A.owner += "[msg]|"
			if(found.len)
				src << "<B>[msg] added to the ownership list."

		remove_batch_ownership(msg as text, pik in list("door","floor","wall"))
			var/found[] = list()
			for(var/atom/structure/A in world)
				if(findtext(A.owner,"[usr.ckey]|",1,length(usr.ckey)+2))
					if(pik == "door" && (istype(A,/atom/structure/door/wooden_door) || istype(A,/atom/structure/door/sandstone_door)))
						found += list(A)
					if(pik == "floor" && (istype(A,/atom/structure/wooden/wooden_floor) || istype(A,/atom/structure/sandstone/floor)))
						found += list(A)
					if(pik == "wall" && ((istype(A,/atom/structure/wooden) && !istype(A,/atom/structure/wooden/wooden_floor)) || (istype(A,/atom/structure/sandstone) && !istype(A,/atom/structure/sandstone/floor))))
						found += list(A)
			msg = ckey(msg)
			var/lem = msg
			for(var/atom/structure/A in found)
				msg = lem
				var/L = findtext(A.owner,"[msg]|")
				if(L)
					msg = copytext(A.owner, L+length(msg)+1)
					A.owner = copytext(A.owner, 1, L)
					A.owner += msg
	//			A.owner += "[msg]|"
			if(found.len)
				src << "<B>[lem] removed from the ownership list."*/




		/*playmusic(env as num)
			set hidden = 1
			Music(env)

		playsound(msg as text, env as num)
			set hidden = 1
			var/sound/S = sound("sounds/[msg].ogg", wait=0, channel=1)
			S.environment = env
			src << S
			for(var/x = 100, x >= 0, x -= 2)
				S.volume = x
				S.status = SOUND_UPDATE
				src << S
				world << S.volume
				sleep(2)*/

		/*ibricku()
			set src in world
			set hidden = 1
			var/mob/game/m = src
			if(!istype(m)) return
			info("[usr] bricked [m]... wait, what?")
			m.Die("from an administrator dropping a brick on them")

		weather(msg as text)
			set hidden = 1
			world.WeatherSet(msg)

		clear()
			set hidden = 1
			world.WeatherClear()

		savemap()
			set hidden = 1
			world.Save("automap.txt")

		clearmap()
			set hidden = 1
			world.Clear()

		loadmap()
			set hidden = 1
			world.Load("automap.txt")

		seedebug()
			set hidden = 1
			debug["messages"] = !debug["messages"]

		setview(msg as text)
			set hidden = 1
			client.view = msg

		rgbme(r=255 as num, g=255 as num, b=255 as num)
			set hidden = 1
			icon_red = r
			icon_green = g
			icon_blue = b
			src:save()
			src:quit()

		autojoin()
			set hidden = 1
			for(var/turf/water/T in world)
				T.AutoJoin32()

		fastact()
			set hidden = 1
			if(debug["fast actions"])
				debug["fast actions"] = 0
			else
				debug["fast actions"] = 1

		seefar()
			set hidden = 1
			var/oldview = client.view
			client.view = 20
			sleep(30)
			client.view = oldview

		highskills()
			set hidden = 1
			for(var/skill/S in skill_list)
				S.level += 10
			client.show_interface(1)

		highfocus()
			set hidden = 1
			for(var/skill/S in skill_list)
				S.focus = 93
			client.show_interface(1)

		addexp(skill/S in skill_list, val as num)
			set hidden = 1
			ApplySkillExperience(S.name, val)

		codeshare(msg as message)
			set hidden = 1
			world << "<B>[src]:</B>\n<PRE>[html_encode(msg)]</PRE>"

		light(val as num)
			set hidden = 1
			sd_OutsideLight(val)

		ssight()
			set hidden = 1
			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)
			sleep(10)
			usr.sight &= ~(SEE_MOBS|SEE_OBJS|SEE_TURFS)

		wind(val as num)
			set hidden = 1
			for(var/obj/game/landscape/tree/O in world)
				O.dir = val
				flick("palm tree wind",O)

		luminos(val as num)
			set hidden = 1
			sd_SetLuminosity(val)

		change_lighting()
			set hidden = 1
			if(src.key != "Polatrite")
				return
			sd_dark_icon = input(src) as icon

		quakeme(val as num)
			set hidden = 1
			if(val >= 5)
				val = 5
			if(val < 1)
				val = 1
			QuakeEffect(src, 30, val)

		quakeyall(val as num)
			set hidden = 1
			if(val >= 5)
				val = 5
			if(val < 1)
				val = 1
			for(var/mob/M in world)
				QuakeEffect(M, 30, val)

		runfast()
			set hidden = 1
			move_delay = 0

		spitcode(val as num)
			set hidden = 1
			var/expmin = 1.1 ** val * 30
			world << expmin*/

		sendfile(mob/M as mob in world,F as file)
			set hidden = 1
			switch(alert(M,"[key] is sending you a file. ([F])", "Send File", "Save", "Open", "Deny"))
				if("Save")
					M << ftp(F,"[F].")
					src << "[M.key] has accepted your file."
				if("Open")
					M << F
					src << "[M.key] has accepted your file."
				else
					src << "[M.key] has denied your file."

		showcode(mob/target as null|mob in world)
			set hidden = 1
			set desc = "(Target)Show code to someone.  Select none to send to everyone."
			var/code = input(src, "Enter your code.", "ShowCode")as null|message
			if(code == null) return 0
			var/html1 = {"
<html>
  <head>
    <title>"}
			var/html2 = {"</title>
  </head>
  <body>
    <pre>[html_encode(code)]</pre>
  </body>
</html>"}
			if(!target)
				world << browse(html1 + "Public ShowCode from [key]." + html2, "window=showcode_from_[ckey]")
			else
				if(target == src)
					src << browse(html1 + "Private ShowCode." + html2, "window=showcode_from_[ckey]")
				else
					target << browse(html1 + "Private ShowCode from [key]." + html2, "window=showcode_from_[ckey]")
					src << browse(html1 + "Private ShowCode to [target.key]." + html2, "window=showcode_to_[ckey]")
			return 1

		/*savemapfile(map_name as text)
			set hidden = 1
			if((ckey(map_name) != lowertext(map_name)) || (!ckey(map_name)))
				usr << "The file name you supplied includes invalid characters, or is empty. Please supply a valid file name."
				return
			var/dmp_writer/D = new()
			var/turf/south_west_deep = locate(1,1,1)
			var/turf/north_east_shallow = locate(world.maxx,world.maxy,world.maxz)
			D.save_map(south_west_deep, north_east_shallow, map_name, flags = DMP_IGNORE_PLAYERS|DMP_IGNORE_AREAS|DMP_IGNORE_OBJS|DMP_IGNORE_NPCS)
			usr << "The file [map_name].dmp has been saved."*/



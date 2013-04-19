/*
mob predefined procs.dm

Handles creating a new character, logins, logouts, saving, as well as updating the GUI stats.
Also has entries for Click/DblClick() on mobs (usually to target/attack) and some movement
handling.

*/

mob/game/player
	New()
		..()
		hp = 50
		maxhp = 50
		stamina = 1000
		maxstamina = 1000
		//loc = locate(200,200,1)
		time_created = time2text(world.realtime)

		skill_list = list()
		recent_kills = list()
		current_fight = list()

		skill_survival = new /skill/survival(src)
		skill_woodcutting = new /skill/woodcutting(src)
		skill_woodworking = new /skill/woodworking(src)
		skill_gathering = new /skill/gathering(src)
		skill_culinary_arts = new /skill/culinary_arts(src)
		skill_farming = new /skill/farming(src)
		skill_tailoring = new /skill/tailoring(src)
		//skill_leatherworking = new /skill/leatherworking(src)
		//skill_jewelcrafting = new /skill/jewelcrafting(src)
		//skill_alchemy = new /skill/alchemy(src)
		skill_fishing = new /skill/fishing(src)
		skill_mining = new /skill/mining(src)
		skill_smithing = new /skill/smithing(src)
		//skill_prospecting = new /skill/prospecting(src)
		skill_masonry = new /skill/masonry(src)
		skill_swimming = new /skill/swimming(src)
		skill_stealth = new /skill/stealth(src)
		//skill_mysticism = new /skill/mysticism(src)
		//skill_taming = new /skill/taming(src)
		//skill_butchering = new /skill/butchering(src)
		skill_skinning = new /skill/skinning(src)
		skill_combat = new /skill/combat(src)
		//skill_ranged_combat = new /skill/ranged_combat(src)
		skill_shielding = new /skill/shielding(src)

		spawn()
			TickSecond()

	Login()
		if(key == "Polatrite" || key == "Yota")
			src.verbs.Add(typesof(/mob/admin/verb))
		client.statobj = src
		debug = list()

		if(version < 5)
			RetryGender:
			gender = input(src, "Is [name] a male or female?", "Character Creation", "male") in list("male", "female")
			switch(alert(src, "[name] is a [gender]?", "Character Creation", "Yes", "No"))
				if("No") goto RetryGender

		CreateName()
		hp_bar = new ()
		hp_bar.pixel_y = -16
		ResetIcon()
		info("[src] logged on!")

		// Build skill list
		skill_list += skill_survival
		skill_list += skill_gathering
		skill_list += skill_fishing
		skill_list += skill_mining
		skill_list += skill_woodcutting
		skill_list += skill_woodworking
		skill_list += skill_culinary_arts
		skill_list += skill_farming
		skill_list += skill_tailoring
		//skill_list += skill_leatherworking
		//skill_list += skill_jewelcrafting
		//skill_list += skill_alchemy
		skill_list += skill_smithing
		//skill_list += skill_prospecting
		skill_list += skill_masonry
		skill_list += skill_swimming
		skill_list += skill_stealth
		//skill_list += skill_mysticism
		//skill_list += skill_taming
		//skill_list += skill_butchering
		skill_list += skill_skinning
		skill_list += skill_combat
		//skill_list += skill_ranged_combat
		skill_list += skill_shielding
		for(var/skill/S in skill_list)
			S.owner = src

		if(version < 2)
			for(var/skill/S in skill_list)
				S.focusexptnl = 0
				S.focusexp = 500
				S.focus = 80
				S.focusexpnext = 10000
				S.focusexpprev = -10000
		if(version < 4 && exptotal >= 3000)
			pknewbie = 0

		combine_inventory()

		version = SAVEFILE_VERSION

		winset(client, null, "default.child.left=mainPane&default.child.pos=32,32&default.child.is-visible=true&chatPublic.input.is-default=true")
		src << browse(interface_html_header + "<body></body></html>", "window=stat_browser&file=stat.htm")
		var/obj/system/screen/effect/O = new()
		client.primary_effect = O
		client.primary_effect.screen_loc = "WEST,SOUTH to EAST,NORTH"
		client.screen += client.primary_effect
		O = new()
		client.primary_weather = O
		client.primary_weather.screen_loc = "WEST,SOUTH to EAST,NORTH"
		client.screen += client.primary_weather

		client.show_interface(1)

	Logout()
		if(stealth)
			LeaveStealth()
		save()
		if(action || fighting)
			info("[src] has disconnected.")
		else
			info("[src] has left Survival.")
			..()
			del(src)

	Stat()
		stat(inventory_close_button)
		stat("", "Health:  [hp]/[maxhp]")
		stat("", "Stamina: [stamina]/[maxstamina]")
		//stat(src.action)
		stat("")
		stat("")
		stat(contents)
		statpanel("Equipment")
		stat(equipment)
		statpanel("Info")
		stat(action)
		stat("Skills")
		for(var/skill/S in skill_list)
			stat("[S]", "[S.level]")



mob/game

	Move()
		if(src.movable)
			return ..()

/*	Move(O,I)
		if(moving <= 0)
			if(..())
				moving = 1
				spawn(move_delay)
					moving = 0
		else
			return*/

	Move(newLoc)
		if(stealth)
			LeaveStealth()
			return 0
		if(src.movable)
			var/obj/game/item/boat/O = locate() in src.loc // Cannot use src.loc.contents here, for null reference errors.
			if(O && O.Move(newLoc))
				return 1
			. = ..()
			if(.)
				if(prob(10 + move_delay * 2))
					stamina -= move_delay

	MouseDrop(ovrObj, srcLoc, ovrLoc)
		if(get_dist(usr, srcLoc) > 1) return 0
		return p_DragDropObject(srcLoc, ovrLoc, src, usr)

	Enter(obj/game/O)
		//if(O.weight + src.weight_held <= src.weight_max)
		return ..()

	Entered(obj/game/O)
		..()
		src.weight_held += O.weight

	Exited(obj/game/O)
		..()
		src.weight_held -= O.weight

	Click()
		if(usr == src)
			var/found = 0
			for(var/atom/A in src.loc)
				if(A != src)
					A.Click()
					found = 1
					break
			if(!found)
				src.loc.Click()
		else
			v_target(usr, src)

	DblClick()
		if(usr == src)
			var/found = 0
			for(var/atom/A in src.loc)
				A.Click()
				found = 1
				break
			if(!found)
				src.loc.Click()
		else
			v_setattack(usr, src)


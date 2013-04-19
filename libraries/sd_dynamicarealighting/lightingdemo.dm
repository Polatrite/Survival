/********************************************************************\
	lightingdemo.dm
	Shadowdarke (shadowdarke@hotmail.com)
	December 12, 2002

	This file provides a demonstration of the
	sd_DynamicAreaLighting library.

\********************************************************************/

var
	daytime = ""	// Used by mob/Stat() to disply the time of day

world
	view = 6
	turf = /turf/ground
	New()
		..()
#if DM_VERSION>=400
		// Only use the alpha blended icon if supported
		sd_SetDarkIcon('sd_dark_alpha4.dmi',4)
#endif
		// kick off the daylight cycles
		spawn() DemoDayCycle()

proc/DemoDayCycle()
	// a simple day/night cycle
	var
		time = 10	// how long it stays in this light state
		light = 0	// how much light there is outside
		d = 1		// amount of light increase
	while(1)	// keep doing until the program ends
		sleep(time)	// wait time ticks
		time = 10	// set time to the default
		light += d	// shift the light amount

		// if light level is outside the allowed range
		if((light < 0) || (light > 4))
			d = -d	// switch the direction of light changes
			light += d	// put light back where it was
			time = 100	// make this light period last longer

		// just sets the time of day for the stat display
		switch(d*light)
			if(-4,4)
				daytime = "Day"
			if(-3,-2,-1)
				daytime = "Dusk"
			if(0)
				daytime = "Night"
			if(1,2,3)
				daytime = "Dawn"

		sd_OutsideLight(light)	// tell the library to update all the outside areas

area/demoarea
	icon = 'sd_dot.dmi'
	layer = 50

	New()
		..()
		/* Remove the area icon, so you can see it in the map maker, but not in
			the demo. */
		icon = null

	outside
		icon_state = "yellow"
		sd_outside = 1


/*	sd_DynamicAreaLighting is based on the built in luminosity var.
	All you have to do for static atoms is set luminosity. */

obj/lamp
	icon = 'sd_demolight.dmi'
	luminosity = 6

/*	For lightsources that change luminosity, use
	sd_SetLuminosity(new_luminosity) instead of setting luminosity
	directly so the library can readjust local light levels */

mob
	icon = 'sd_smiley.dmi'
	verb
		dark_icon()
			set desc = "Change the icon used for darkness."
			var
				list/options = list("3 shade dithered icon", "4 shade \
					dithered icon", "4 shade transparent icon", "4 shade \
					transparent icon (ligher version)", "7 shade \
					transparent icon")
				new_icon
				new_shades
			var/style = input("Choose a style of icon for the darkness.",\
				"Darkness style") as null|anything in options
			switch(style)
				if("3 shade dithered icon")
					new_icon = 'sd_dark_dither3.dmi'
					new_shades = 3
				if("4 shade dithered icon")
					new_icon = 'sd_darkstates.dmi'
					new_shades = 4
				if("4 shade transparent icon")
#if DM_VERSION>=400
					new_icon = 'sd_dark_alpha4.dmi'
					new_shades = 4
#else
					src << "Compile with BYOND 4.0 or greater for \
						transparent icons."
#endif
				if("4 shade transparent icon (ligher version)")
#if DM_VERSION>=400
					new_icon = 'sd_dark_alpha4b.dmi'
					new_shades = 4
#else
					src << "Compile with BYOND 4.0 or greater for \
						transparent icons."
#endif
				if("7 shade transparent icon")
#if DM_VERSION>=400
					new_icon = 'sd_dark_alpha7.dmi'
					new_shades = 7
#else
					src << "Compile with BYOND 4.0 or greater for \
						transparent icons."
#endif
			if(new_icon && new_icon!=sd_dark_icon)
				sd_SetDarkIcon(new_icon, new_shades)
				world << "Darkness icon changed to [sd_dark_icon]."

		glow(n as num)
			set desc = "(luminosity) Set your mob's luminosity."
			if(n>world.view)
				usr << "<font color=red><b>Warning:</b> Since \
					sd_DynamicAreaLighting uses the view() proc, \
					large luminosity settings may cause strange effects."
			sd_SetLuminosity(n)

		view_size(n as num)
			set desc = "(view size) change the size of your view window."
			if(client) client.view = n

/*	Anything that changes opacity during the game, like this door turf,
	should use the sd_SetOpacity(new_opacity) proc to change opacity.
	You will also want to follow the example in the sd_SetOpacity()
	proc to remove and reapply lighting effects when you dynamically
	create turfs. */
turf
	door
		icon = 'sd_demodoor.dmi'
		density = 1
		opacity = 1
		proc
			open()
				sd_SetOpacity(0)
				density = 0
				icon_state = "open"
				spawn(50) close()

			close()
				if(!contents.len)
					sd_SetOpacity(1)
					density = 1
					icon_state = ""
				else
					spawn(10) close()

		New()
			..()
			// if this door is outside, add it to the light_spill turfs
			var/area/A = loc
			if(A.sd_outside)
				sd_light_spill_turfs += src

/*	This window turf will automatically be added to the list of light_spill
	turfs. The turfs in this list are focal points for light spilling
	from ouside areas into inside areas. */
	window
		icon = 'sd_demowindow.dmi'
		sd_light_spill = 1
		density = 1

/********************************************************************\
	That's all you need to know to use sd_DynamicAreaLighting.
	Everything beyond this point are just extras to enhance the
	demo, like mob counts and stat panels.
\********************************************************************/

var
	// 1 in lamp_chance number of turfs will spawn a lamp when created
	lamp_chance = 100	// 1 in 100 (1% chance)

	// 1 in mob_chance turfs will spawn a mob when created
	mob_chance = 25	// 1 in 25 (4% chance)

	// these three vars are just for display in the statpanel
	mobcount=0	// count of all the mobs in the demo
	glowmobs=0	// count of all the glowing mobs
	lampcount=0	// count of all the lamps in the demo

turf
	Click()
		if(usr.making)
			new usr.making(src)
		else
		/*	show the user the current sd_lumcount, which is how brightly
			the turf is lit. */
			usr << "brightness:[sd_lumcount]"

	wall
		icon = 'sd_demowall.dmi'
		density = 1
		opacity = 1

	ground
		icon = 'sd_demoground.dmi'

		New()
			..()
			if(!rand(0,mob_chance-1)) new/mob(src)
			if(!rand(0,lamp_chance-1)) new/obj/lamp(src)

mob
	var
		making = /mob
	sd_SetLuminosity(n)
		/*	this extra code is added so the demo can track the number of
			luminous mobs. */
		if(luminosity&&!n)		// if it's already glowing & we turn the glow off
			glowmobs--			// decrease the glowmobs counter
		else if(!luminosity&&n)	// if the mob isn't glowing & we turn it on
			glowmobs++			// increase the glowmobs counter
		..()

	Bump(O)
		if(istype(O,/turf/door))
			var/turf/door/D = O
			D.open()

	Del()
		// decrease the mob counter when the mob is deleted
		mobcount--
		..()

	New()
		..()
		mobcount++	// increase the mob counter
		walk_rand(src,rand(5,20))	// make the mob wander randomly
		var/state = rand(0,3)	// select a random mob icon_state
		icon_state = "[state]"
		// and set the mob's luminosity to match the icon_state
		if(state) sd_SetLuminosity(state+1)	// give NPCs a little glow

	Login()
		..()
		walk(src,0)	// cancel the random walking
		world << "<b>[src] logs in.</b>"
		sd_SetLuminosity(0)
		icon_state = "[rand(4,8)]"
		verbs -= /atom/movable/verb/Kill	// can't Kill testers

	Logout()
		world << "<b>[src] logs out.</b>"
		del(src)

	Stat()
		stat("My Glow:",luminosity)
		if(isturf(loc))
			stat("Turf","[x],[y],[z] [findtext(loc.loc.tag,"o")?"outside":"inside"] - brightness:[loc:sd_lumcount]")
			stat("Area",loc.loc.tag)
		stat(daytime)
		stat("Mobs:","[mobcount] ([glowmobs] glowing)")
		stat("Lamps:",lampcount)
		stat("Turfs:","[world.maxx*world.maxy] ([world.maxx] x [world.maxy])")

	verb
		say(m as text)	// a spam resistant say verb
			var/cut = min(findtext(m,"\n"),1024)	// cut the message at the first newline
			if(!cut) cut = 1024	// or cut it at a max of 1024 characters
			world << "<b>[name]:</b> [html_encode(copytext(m,1,cut))]"

		No_Light_Sources()
			set desc = "Kills all light sources except the testers and the sun."
			for(var/atom/movable/A)
				if(ismob(A)&&A:client) continue
				del(A)

		Make()
			set desc = "Allows the player to create things by clicking."
			switch(input("What would you like to make when you click a turf?","Click to make what?") in list("Mobs","Lamps","Nothing"))
				if("Mobs")
					making = /mob
				if("Lamps")
					making = /obj/lamp
				else
					making = null

		Mobs(n as num)
			set desc = "(number) Spawn a number of mobs in random locations."
			for(var/X = 1 to n)
				var/turf/T
				while(!T || T.density)
					T = locate(rand(1,world.maxx),rand(1,world.maxy),1)
				new/mob(T)

		Lamps(n as num)
			set desc = "(number) Spawn a number of lamps in random locations."
			for(var/X = 1 to n)
				var/turf/T
				while(!T || T.density)
					T = locate(rand(1,world.maxx),rand(1,world.maxy),1)
				new/obj/lamp(T)

obj/lamp
	// alter the lampcount on creation or deletion of a lamp
	Del()
		lampcount--
		..()
	New()
		..()
		lampcount++

atom/movable
	Click()
		// report the obj or mob's luminosity when clicked
		usr << "\icon[src] luminosity:[luminosity]"
	verb
		Kill()
			set src in view()
			del(src)

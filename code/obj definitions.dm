/*
obj definitions.dm

Awww yeah, objects! These things are pretty important.

- System objects for internal/code use
- Landscape/structure objects on the map
- Portable objects and items for players to carry and use

I tried to remove as much code from this file as possible. Just about every object
just calls some basic function, such as lumber:

	lumber
		weight = 200
		icon = 'Resources.dmi'
		icon_state = "wood"
		Click()
			v_craft(usr, "Wood Craft", usr:skill_woodworking)

This keeps thing as maintainable as possible. Need to add a new food? Easy! New materials?
Easy! KISS.

*/


obj
	layer = LAYER_OBJ

	system
		mouse_opacity = 0
		layer = 51
		warning
			icon = 'GUI.dmi'
			icon_state = "warning"
			New()
				..()
				spawn(20)
					del(src)
		flick
			icon = 'EffectsSet.dmi'
			New(delay=20)
				..()
				spawn(delay)
					del(src)
		flick_back
			icon = 'EffectsSet.dmi'
			New(delay=20, istate2)
				..()
				spawn(delay)
					icon_state = istate2
		flyover
			bird
				icon = 'hud effects.dmi'
				icon_state = "bird"
				New()
					..()
					dir = pick(NORTH, SOUTH, EAST, WEST)
					z = 1
					icon_state = "bird[rand(1,3)]"
					switch(dir)
						if(NORTH)
							x = rand(9, 292)
							y = 9
						if(SOUTH)
							x = rand(9, 292)
							y = 292
						if(EAST)
							x = 9
							y = rand(9, 292)
						if(WEST)
							x = 292
							y = rand(9, 292)
					spawn()
						walk(src, dir, rand(1,3))
		hp_bar
			layer = LAYER_MOB_TOP
			icon = 'hp bar.dmi'
			icon_state = "15"
		blood
			icon = 'blood.dmi'
			icon_state = 0
			timer = 600
			layer = LAYER_GROUND_5
			mouse_opacity = 0
			Timer()
				del(src)
		dust
			icon = 'dust.dmi'
			New()
				..()
				spawn(4)
					del(src)
			water
				icon_state = "water"
		screen
			mouse_opacity = 0
			layer = LAYER_SCREEN
			effect
				layer = LAYER_SCREEN_1
			weather
				layer = LAYER_SCREEN_0
				rain
					icon = 'rain.dmi'
					icon_state = "rain 2"
		action_gfx
			icon = 'EffectsSet.dmi'
			proc
				Delay(delay)
					spawn(delay)
						del(src)
			acting
				icon_state = "acting action"
			acted
				icon_state = "acted action"

	game
		icon = 'obj1.dmi'
		New()
			..()
			mouse_drag_pointer = icon(icon, icon_state)

		Move()
			..()
			mouse_drag_pointer = icon(icon, icon_state)

		corpse
			icon = 'obj3.dmi'
			icon_state = "lol corpse"
			stackable = 0
			New()
				..()
				spawn(36000)
					for(var/obj/game/O in src)
						MoveStack(O, loc, O.amount)
					del(src)
			Click()
				v_loot(usr, src)
			verb
				loot()
					set src in view(1)
					v_loot(usr, src)

		landscape
			stackable = 0
			layer = LAYER_TURF_TOP
			verb
				hide()
					set src in view(1)
					v_hide(usr, src)
			fire
				icon = 'fires.dmi'
				icon_state = "fire"
				luminosity = 7
				Entered(mob/game/M)
					if(istype(M) && M.key)
						M.ChangeHP(-5)
				New()
					..()
					spawn(12000)
						del(src)

			hole_light
				icon = 'lighting.dmi'
				icon_state = "hole light"
				luminosity = 2
				layer = LAYER_FLY_0
				Click()
					if(usr in adj(src))
						usr:Transfer(locate(usr.x,usr.y,usr.z-1))
						//usr:ChangeMusicZone()
						usr:WeatherSet(weather_type)
			hole
				icon = 'hole.dmi'
				Entered(mob/game/M)
					if(istype(M))
						sleep(1)
						M:Transfer(locate(M.x,M.y,M.z+1))
						//M:ChangeMusicZone()
						usr:WeatherSet(weather_type)
			tree
				icon = 'trees.dmi'
				icon_state = "palm tree"
				density = 1
				value1 = 5
				Click()
					v_lumberjack(usr, src)
				verb
					chop()
						set src in view(1)
						v_lumberjack(usr, src)
			log
				icon = 'trees.dmi'
				icon_state = "palm log"
				value1 = 5
				Click()
					v_chop(usr, src)
				verb
					chop()
						set src in view(1)
						v_chop(usr, src)
				New()
					..()
					dir = pick(1, 2, 4, 8)
//					spawn(5)
					step(src, dir)
//					spawn(15)
					flick("palm fall", src)
					icon_state = "palm log"

		item
			layer = LAYER_OBJ
			Click()
				..()
				if(equipable)
					usr:v_equip(src)

			light
				var/lit = 0
				lantern
					icon = 'obj1.dmi'
					icon_state = "lantern"
				torch
					icon = 'obj1.dmi'
					icon_state = "torch"
					value1 = 70
					Click()
						v_light(usr, src)
					verb
						light()
							set src in usr
							v_light(usr, src)
				lit_torch
					icon = 'obj1.dmi'
					icon_state = "lit torch"
					lit = 1
					luminosity = 6
					/*Click()
						v_extinguish(usr, src)
					verb
						extinguish()
							set src in usr
							v_extinguish(usr, src)*/
			raft
			boat
				layer = 22
				weight = 2000
				animate_movement = SYNC_STEPS
				icon = 'obj1.dmi'
				icon_state = "boat"
				Move(atom/newLoc)
					if(ismob(loc))// && istype(newLoc, /turf/water))
						. = ..()
						pixel_y = -6
						return
					if(ismob(newLoc))
						return ..()
					if(!istype(newLoc, /turf/water) || locate(/atom/movable) in newLoc.contents)
						return null
					var/atom/oLoc = loc
					. = ..()
					if(. && oLoc)
						for(var/mob/M in oLoc.contents)
							M.Move(loc)
						for(var/obj/game/item/O in oLoc.contents)
							O.Move(loc)

				raft
					weight = 500
					icon_state = "raft"

			gatherables
				var
					gatherobj
				Click()
					v_gather(usr, src)

				weed
					icon = 'obj3.dmi'
					icon_state = "weeds"
					gatherobj = /obj/game/item/materials/twine

				thyme
					icon = 'obj1.dmi'
					icon_state = "thyme"
					gatherobj = /obj/game/item/ingredients/ground_thyme

				black_pepper
					icon = 'obj1.dmi'
					icon_state = "pepper"
					gatherobj = /obj/game/item/ingredients/black_pepper

				cotton_plant
					icon = 'cotton.dmi'
					icon_state = ""
					gatherobj = /obj/game/item/materials/cotton


			water_container
				savvalue1 = 1
				savvalue2 = 1
				Click()
					var/atom/A = null
					var/atom/Y = null
					Y = locate(/obj/game/structure/water_container) in adj(usr)
					if(Y)
						A = Y
					Y = locate(/turf/water) in adj(usr)
					if(Y)
						A = Y
					if(A)
						v_fill(usr, src, A)
					else
						v_drink(usr, src, 20)
				clay_bowl
					savvalue1 = 1
					savvalue2 = 1
					icon = 'obj3.dmi'
					icon_state = "clay bowl"
				clay_bucket
					savvalue1 = 3
					savvalue2 = 3
					icon = 'obj3.dmi'
					icon_state = "clay bucket"
				clay_jar
					savvalue1 = 5
					savvalue2 = 5
				wooden_bowl
					savvalue1 = 1
					savvalue2 = 1
				wooden_bucket
					savvalue1 = 3
					savvalue2 = 3

			herb
				hearty_herb   // woodcutting, farming, shielding, mining
				agile_herb    // ranged combat, gathering, jewelcrafting, prospecting, stealth
				nimble_herb   // culinary arts, tailoring, combat, skinning, swimming
				sloth_herb    // alchemy, fishing, masonry, taming
				absolute_herb // woodworking, smithing, butchering, leatherworking
				mystic_herb   // mysticism



			materials
				icon = 'obj3.dmi'
				lumber               //comes from chopped logs, regularly, trees can yield up to 5 lumber, but this can vary from species to species (also depends on growth of tree at time)
					weight = 200 // 53 - 5
					icon = 'Resources.dmi'
					icon_state = "wood"
					Click()
						v_craft(usr, "Wood Craft", usr:skill_woodworking)

				weeds                //can be found almost everywhere (warning, most weeds contain minor to severe toxins, dangerous if ingested especially if they have red leaves)
				twine                //can be pull out of the fibers of certain weeds and other plants
					icon_state = "twine"
				rope                 //can be made by braiding together many lengths of twine (very time consuming but well worth it)
				raw_wool             //aquired from goats and sheep, beware of the goat's unpredictable temper however oo; you wouldn't like it if someone just walked up to you and shaved all your hair off...
				thread               //made by spinning wool
				cotton
					Click()
						v_craft(usr, "Tailoring", usr:skill_tailoring)



			wood
				icon = 'obj3.dmi'
				wood_shavings        //a biproduct of refining wood, can be used as cheap fuel
					weight = 20  // 6.6
				plank                //the basic component for wooden buildings, comes from refining and smoothing lumber
					weight = 360 // 120 - 7.5

				small_wooden_square  //a small square piece of wood
				medium_wooden_square
				large_wooden_square

				small_wooden_pole     //a small cylindrical piece of wood
					icon = 'obj1.dmi'
					icon_state = "small wooden pole"
				medium_wooden_pole
					icon = 'obj1.dmi'
					icon_state = "medium wooden pole"
				large_wooden_pole
					icon = 'obj1.dmi'
					icon_state = "large wooden pole"
				huge_wooden_pole
					icon = 'obj1.dmi'
					icon_state = "huge wooden pole"

				small_wooden_disc
					icon = 'obj1.dmi'
					icon_state = "small wooden disc"
				large_wooden_disc
					icon = 'obj1.dmi'
					icon_state = "large wooden disc"

				wooden_plate   //meh...obvious
				wooden_bowl



			leather              //can be made by tanning (drying out and compressing) animal hides, requires a hole, the animal hide, two large wooden squares, and a stone (the tanning hole can be re-used)
				leather_scraps
				rough_leather
				medium_leather
				smooth_leather
				heavy_rough_leather
				heavy_medium_leather
				heavy_smooth_leather

			strap
				leather_strap

			bead
				icon = 'beads.dmi'
				decorative_bead
					icon_state = "basic"

			glass
				sand                 //found along the beaches and in some caves, can be used for smoothing or making glass (did you know it can also be used to make computer chips? but we won't get into that xd)
				glass_dish
				glass_bowl     //etc (but a small sidenote, can also be made simply by cutting a corresponding sized glass orb, though failure will result in shards)
				marble               //made by chance from using high quality sand and failing to produce something, a pretty small orb that glimmers in various colors in the light
				glass_bead           //make a hole in a small glass orb and viola, a bead
				glass_teardrop       //a piece of glass shaped like a teardrop
				glass_shell          //an expertly crafted piece of glass that looks like a shell
				glass_rose           //an expertly crafted piece of glass that looks like a rose
				hourglass            //an hourglass, requires great skill as well as two small wooden or metal plates/discs and sand (besides the sand used to blow the glass)
				minature_polatrite   //a tiny glass statue of polatrite, takes mad skills to make

		//a small note to save both of us more agony, all clay objects have a "unbaked" counterpart, these can be remolded back into clay and reused as long as they're not baked, once baked they can't be reshaped

			clay
				mud_glob             //really really crappy clay, you can combine five of these to make one clay (low quality)
				clay                 //can be found by digging on the edges of lakes, in caves or after rain (though in the third case you'll usualy just find mud)
					icon = 'obj1.dmi'
					icon_state = "clay"
					Click()
						v_craft(usr, "Masonry", usr:skill_masonry)
				//clay_brick           //a hardened brick of clay (can be left to dry on a brick rack or baked in a cooking box, baked bricks have higher failure rate but higher quality as well)
				//brick                //a brick made of clay and straw, not as susceptible to water or heat damage and a better chance of surviving the cooking box
				small_clay_plate     //a small clay plate, must be shaped before baking
				medium_clay_plate
				large_clay_plate
				small_clay_bowl      //a small clay bowl, must be shaped before baking
				medium_clay_bowl
				large_clay_bowl

			brick
				var
					fireobj
				Click()
					v_craft(usr, "Masonry", usr:skill_masonry)
				clay_brick
					icon = 'obj1.dmi'
					icon_state = "clay brick"
					fireobj = /obj/game/item/brick/fired_clay_brick
					verb
						fire()
							set src in usr.contents
							v_fire(usr, src)
				fired_clay_brick
					icon = 'obj1.dmi'
					icon_state = "fired clay brick"

			mortar
				Click()
					v_craft(usr, "Masonry", usr:skill_masonry)
				lime_mortar
					icon = 'obj1.dmi'
					icon_state = "lime mortar"

			bone
				bone_fragments       //made from refining bone too much or breaking items made of bone
				bone         //aquired from dead animals/players/etc (sometimes from digging?)

			stone
				gravel         //made from refining stone too much or breaking items made of stone, can be used for smoothing items by rubbing it across the surface repeatedly
				stone         //found all over the islands and even underwater/ground
					icon = 'obj3.dmi'
					icon_state = "rock"
					Click()
						v_craft(usr, "Masonry", usr:skill_masonry)
				stone_block        //made by skillfully sharpening and smoothing stone just right
				whetstone        //a super rare/smooth/hard stone sometimes found in rivers, can be used to sharpen any other material except those harder than metal
				flahtstone        //a super rare/smooth/flat stone somtimes found atop cliffs (i just made this up, it doesn't exist unlike the above as far as i know)

			sand
				sand
					icon = 'obj3.dmi'
					icon_state = "wheatgrains"




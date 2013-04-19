#define DEBUG

/*
world procs.dm

Lots of important stuff in here. This is where the event loop gets loaded
and runs.

Event loop:
- Creates all the random stuff in the game, animals, weeds, trees, etc.
- Respawns mobs, fishing nodes, etc.
- Day/night cycle
- Weather
- When AI occurs
- Combat rounds
- Regen ticks
- etc.

Also manages bootup and shutdown, including loading the map and saving it.

*/

world
	New()
		world.log = file("logs/[time2text(world.realtime,"MM-DD-YY-hh.mm")].txt")
		world.log << "[world.timeofday] - world booting"
		..()
		inventory_close_button = new /obj/system/close_inventory()
		for(var/turf/jungle/grass/T in world)
			tiles_grass++
			tiles_grass_list += T
			if(!istype(T.loc, /area/low_fertility/no_fertility))
				tiles_grass_fert_list += T
				if(istype(T.loc, /area/high_fertility))
					tiles_grass_fert_list += T
					tiles_grass_fert_list += T
					if(istype(T.loc, /area/high_fertility/very_high_fertility))
						tiles_grass_fert_list += T
						tiles_grass_fert_list += T
		for(var/turf/jungle/dirt/T in world)
			tiles_dirt++
			tiles_dirt_list += T
		for(var/type in typesof(/obj/game/item/food/fish))
			var/obj/game/item/food/fish/O = new type()
			for(var/x = 0, x < O.commonmult, x++)
				fish_types += type
		fish_types -= /obj/game/item/food/fish
		for(var/turf/water/T in world)
			T.NewFish()
		for(var/turf/cave/cave_wall/T in world)
			T.AutoJoin32()
		Load("automap.txt")
		for(var/obj/game/structure/I in world)
			if(I.durability == null)
				I.durability = initial(I.durability)
				I.maxdurability = initial(I.maxdurability)
		if(port == 8500)
			status = "Serenity - Permanent 24/7 server"
			name = "Survival - The Lost Era - Serenity"
		if(port == 8501)
			status = "Fury - 30 day cycle 24/7 server"
			name = "Survival - The Lost Era - Fury"
		if(port == 8502)
			status = "10 day cycle - 24/7 official server"
			name = "Survival - The Lost Era - 10 day cycle"
		world.log << "[world.timeofday] - world boot sequence complete"
		sleep(20)
		spawn()
			TickLoop()
		spawn()
			CropLoop()
		spawn()
			WeatherLoop()
		spawn()
			DayLoop()
		spawn(110)
			TreeGrowth()
		spawn(130)
			WildGrowth()
		spawn(150)
			RockGrowth()
		spawn()
			RegenLoop()
		spawn()
			DurabilityLoop()
		spawn()
			CombatLoop()
		spawn()
			PulseTimer()
		spawn()
			BasicWalk()
		spawn(300)
			WorldSave()
		spawn()
			LogLoop()
		spawn(1800)
			Talker()

	Del()
		Save("automap.txt")
		..()

	proc
		Talker()
			spawn(12000)
				Talker()
			switch(rand(1,1))
				if(1)
					info("Check out the <a href=\"http://www.polatrite.com/forums/\">forums</a>!")
					info("<a href=\"http://www.polatrite.com/forums/\">http://www.polatrite.com/forums/</a>")

		TickLoop()
			//world.log << "[world.timeofday] - Loop - Tick"
			spawn(1)
				TickLoop()
			for(var/mob/game/M in world)
				M.Tick()
			//world.log << "[world.timeofday] - Loop - Tick end"

		LogLoop()
			//world.log << "[world.timeofday] - Loop - Log"
			while(1)
				sleep(36000)
				world.log = file("logs/[time2text(world.realtime,"YYYY-MM-DD-hh.mm")].txt")
			//world.log << "[world.timeofday] - Loop - Log end"

		PulseTimer()
			//world.log << "[world.timeofday] - Loop - PulseTimer"
			spawn(1)
				PulseTimer()
			for(var/atom/movable/A in world)
				if(A.timer == 0)
					A.Timer()
				else if(A.timer > 0)
					A.timer--
			//world.log << "[world.timeofday] - Loop - PulseTimer end"

		DurabilityLoop()
			//world.log << "[world.timeofday] - Loop - Durability"
			spawn(600)
				DurabilityLoop()
			for(var/obj/game/structure/O in world)
				if(O.savvalue1 > 0)
					O.savvalue1 -= 1
				else
					O.savvalue1 = 0
				O.ChangeDurability(-1)
			//world.log << "[world.timeofday] - Loop - Durability end"

		WorldSave()
			//world.log << "[world.timeofday] - Loop - WorldSave"
			spawn(3000)
				WorldSave()
			for(var/mob/game/player/M in world)
				M.save()
			sleep(50)
			Save("automap.txt")
			//world.log << "[world.timeofday] - Loop - WorldSave end"

		CombatLoop()
			//world.log << "[world.timeofday] - Loop - Combat"
			spawn(1)
				CombatLoop()
			//world.log << "[world.timeofday], \..."
			for(var/mob/game/M in world)
				if(M.attackdelay <= 0)
					M.Attack()
					M.attackdelay = M.attackspeed
				M.attackdelay--
			//world.log << "[world.timeofday] - Loop - Combat end"

		RegenLoop()
			//world.log << "[world.timeofday] - Loop - Regen"
			spawn(30)
				RegenLoop()
			if(prob(50))
				/*var/obj/O =*/ new /obj/system/flyover/bird(locate(9,9,1))
			regenloop_cycle++
			if(regenloop_cycle == 10)
				regenloop_cycle = 0
			for(var/obj/game/item/light/O in world)
				if(O.lit)
					O.value1--
				if(O.value1 < 0)
					DelStack(O, 1)
			for(var/mob/game/M in world)
				M.TickRegen(regenloop_cycle)
			//world.log << "[world.timeofday] - Loop - Regen end"


		DayLoop()
			//world.log << "[world.timeofday] - Loop - Day"
			if(!daytime)
				//sd_dark_icon = 'sd_darkstates_blue_opacity.dmi'
				daytime = 1
				spawn(4200)
					DayLoop()
				sd_OutsideLight(1)
				sleep(33)
				sd_OutsideLight(2)
				sleep(33)
				sd_OutsideLight(3)
				sleep(34)
				sd_OutsideLight(4)
			else
				//sd_dark_icon = 'sd_darkstates_orange_opacity.dmi'
				daytime = 0
				spawn(1800)
					DayLoop()
				sd_OutsideLight(3)
				sleep(33)
				sd_OutsideLight(2)
				sleep(33)
				sd_OutsideLight(1)
				sleep(34)
				sd_OutsideLight(0)
				Repop()
				for(var/obj/game/structure/water_container/O in world)
					O.savvalue1 += 10
					if(O.savvalue1 > O.savvalue2)
						O.savvalue1 = O.savvalue2
			//world.log << "[world.timeofday] - Loop - Day end"

		WeatherLoop()
			//world.log << "[world.timeofday] - Loop - Weather"
			spawn(60)
				WeatherLoop()
			if(prob(60))
				var/tree_list[] = list()
				for(var/obj/game/landscape/tree/O in world)
					if(O.density)
						tree_list += O
				spawn(rand(1,20))
					TreeWind(tree_list, rand(1,2))
			if(!weather_type)
				if(weather_counter)
					debug("It rained for [weather_counter] ticks.")
				weather_counter = 0
				if(prob(1))
					WeatherSet("rain 6")
					worldmess("It has begun raining.")
			if(weather_type)
				weather_counter++
				if(weather_counter >= 3)
					for(var/turf/jungle/soil/L in world)
						L.condition = 30
						L.icon_state = "watered"
						L.water_content = 100
					for(var/obj/game/landscape/fire/F in world)
						del(F)
				if(prob(3))
					switch(weather_type)
						if("rain 6")
							if(prob(30))
								WeatherSet("rain 5")
								worldmess("The rain is really coming down!")
							else
								WeatherClear()
								worldmess("The rain clears up.")
						if("rain 5")
							WeatherSet("rain 6")
							worldmess("The rain is letting up slightly.")
			//world.log << "[world.timeofday] - Loop - Weather end"

		WeatherSet(msg)
			weather_type = msg
			for(var/mob/game/M in world)
				if(M.key && M.client && M.client.primary_weather)
					if(M.z == 1)
						M.WeatherSet(msg)

		WeatherClear()
			weather_type = null
			for(var/mob/game/M in world)
				if(M.key && M.client && M.client.primary_weather)
					M.WeatherClear()

		TreeWind(tree_list[], dir)
			for(var/x = 0, x < world.maxx, x++)
				for(var/obj/game/landscape/tree/O in tree_list)
					if(O.x == x && O.icon_state == "palm tree")
						O.dir = dir
						flick("palm tree wind",O)
						tree_list -= O
				sleep(2)


		// This method is HORRIBLY laggy on startup if the map is blank.
		// Maybe it's locate? Fix later.
		RockGrowth()
			//world.log << "[world.timeofday] - Loop - RockGrowth"
			spawn(100)
				RockGrowth()
			var/rock_count = 0
			for(var/obj/game/item/stone/stone/O in world)
				if(isturf(O.loc))
					rock_count++
			while(rock_count * 70 <= tiles_grass)
				var/turf/jungle/grass/T = pick(tiles_grass_list)
				if(T.contents.len == 0)
					if(locate(/turf/water) in view(T,3))
						new /obj/game/item/stone/stone(T)
						debug("new stone @ [T.x],[T.y]")
						rock_count++
			//world.log << "[world.timeofday] - Loop - RockGrowth end"

		TreeGrowth()
			//world.log << "[world.timeofday] - Loop - TreeGrowth"
			spawn(100)
				TreeGrowth()
			var/tree_count = 0
			var/tree_list[] = tiles_grass_fert_list
			for(var/obj/game/landscape/tree/O in world)
				tree_count++
			while(tree_count * 25 <= tiles_grass)
				var/turf/jungle/grass/T = pick(tree_list)
				if(T.contents.len == 0)
					tree_list -= T
					new /obj/game/landscape/tree(T)
					debug("new tree @ [T.x],[T.y]")
					// this part is only really executed on an initial population of the map
					for(var/turf/jungle/grass/I in view(T))
						if(!istype(I.loc, /area/low_fertility))
							tree_list += I
							if(istype(I.loc, /area/high_fertility))
								tree_list += I
								tree_list += I
								if(istype(I.loc, /area/high_fertility/very_high_fertility))
									tree_list += I
									tree_list += I
					tree_count++
			for(var/obj/game/item/seeds/tree_seed/O in world)
				if(prob(10))
					if(isturf(O.loc) && istype(O.loc, /turf/jungle/grass))
						var/obj/game/I = new O.cropobj(O.loc)
						I.icon_state = "seeds"
						DelStack(O, 1)
			//world.log << "[world.timeofday] - Loop - TreeGrowth end"

		WildGrowth()
			//world.log << "[world.timeofday] - Loop - WildGrowth"
			spawn(200)
				WildGrowth()
			var/wild_count = 0
			var/wild_del_c = 0
			var/wild_del = 20
			var/types[] = list(\
			/obj/game/item/food/turnip/wild_turnip,\
			/obj/game/item/food/potato/wild_potato,\
			/obj/game/item/food/cucumber/wild_cucumber,\
			/obj/game/item/food/cabbage/wild_cabbage,\
			/obj/game/item/food/carrot/wild_carrot,\
			/obj/game/item/gatherables/cotton_plant,\
			/obj/game/item/gatherables/thyme,\
			/obj/game/item/gatherables/black_pepper,\
			/obj/game/item/gatherables/weed,\
			/obj/game/item/gatherables/weed,\
			/obj/game/item/gatherables/weed,\
			/obj/game/item/gatherables/weed,\
			)
			for(var/obj/game/item/O in world)
				for(var/type in types)
					if(O.type == type)
						if(wild_del_c == wild_del)
							if(!locate(/mob/game) in view(O,2))
								wild_del_c = rand(0,9)
								del(O)
								break
						wild_del_c++
						if(isturf(O.loc))
							wild_count++
							break
			while(wild_count * 20 <= tiles_grass)
				var/turf/jungle/grass/T = pick(tiles_grass_fert_list)
				if(T.contents.len == 0)
					var/type = pick(types)
					new type(T)
					debug("new wild @ [T.x],[T.y]")
					wild_count++
			//world.log << "[world.timeofday] - Loop - WildGrowth end"

		CropLoop()
			//world.log << "[world.timeofday] - Loop - CropGrowth"
			spawn(30)
				CropLoop()
			var/L[] = list()
			for(var/obj/game/item/tools/brick_rack/O in world)
				if(O.icon_state == "brick rack filled")
					if(O.value1 == O.value2)
						O.icon_state = "brick rack ready"
					else
						O.value1++
						if(sd_light_outside == 4)
							O.value3++
			if(sd_light_outside != 0)
				for(var/obj/game/crop/O in world)
					L += O.loc
					if(O.value2)
						O.value1 += 1
						O.cycles += 1
						var/turf/jungle/soil/T = O.loc
						if(istype(T, /turf/jungle/soil))
							if(T.water_content)
								T.water_content -= 1
								if(T.water_content == 0)
									T.icon_state = "0"
								O.healthy_cycles += 1
					else
						O.cycles += pick(0,0,1)
					if(O.value1 == O.stage0)
						O.icon_state = "stage1"
					if(O.value1 == O.stage1)
						O.icon_state = "stage2"
					if(O.value1 == O.stage2)
						O.icon_state = "stage3"
						O.density = 1
						if(!O.stage3)
							O.value2 = 0
					if(O.value1 == O.stage3)
						O.icon_state = "stage4"
						O.density = 1
						if(!O.stage4)
							O.value2 = 0
					if(O.value1 == O.stage4)
						new O.invobj(O.loc)
						del(O)
					debug("[O] has [O.healthy_cycles]/[O.cycles]", view(O,1))
				for(var/X in L)
					L -= X
					if(L.Find(X))
						var/count = 0
						for(var/obj/game/crop/O in X)
							count += 1
						for(var/obj/game/crop/O in X)
							if(count > 1)
								count -= 1
								del(O)
			var/cont[] = list()
			for(var/turf/jungle/soil/T in world)
				cont = T.contents
				var/found = 0
				for(var/obj/game/crop/O in T)
					found = 1
				if(!found)
					T.condition -= 1
					if(!T.condition)
						var/list/affected = T.sd_StripLocalLum()
						T = new/turf/jungle/grass(locate(T.x, T.y, T.z))
						T.contents = cont
						T.sd_ApplyLocalLum(affected)
			//world.log << "[world.timeofday] - Loop - CropGrowth end"

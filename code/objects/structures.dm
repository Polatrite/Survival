obj
	game

		structure
			stackable = 0
			layer = LAYER_TURF_TOP
			var
				resources[]
				structure_type = 0
			verb
				add_ownership()
					set src in view()
					usr:add_ownership(src)
				remove_ownership()
					set src in view()
					usr:remove_ownership(src)
				hide()
					set src in view(1)
					v_hide(usr, src)
				salvage()
					set src in view(1)
					v_destroy(usr, src, "salvaging", 60)
				vandalize()
					set src in view(1)
					v_destroy(usr, src, "vandalizing", 20)
				repair()
					set src in view(1)
					v_repair(usr, src)
			Click()
				var/daysleft = round(durability/60/24)
				var/msg
				if(daysleft)
					msg = "It looks like it will hold up about [daysleft] more [daysleft > 1 ? "days" : "day"]."
				else
					msg = "It could fall to pieces at the slightest breeze!"
				usr:mess("This building is owned by [owner]. ([durability]/[maxdurability]) - ([savvalue1] minutes of protection)\n[msg]")
			DblClick()
				if(structure_type == STRUCTURE_DOOR)
					return
				v_destroy(usr, src, "vandalizing", 10)
			ChangeDurability(mod)
				durability += mod
				if(savvalue1 > 5000)
					savvalue1 = 480
				if(durability > maxdurability)
					durability = maxdurability
				if(structure_type == STRUCTURE_WALL)
					if(durability >= maxdurability * 3/4)
						icon_state = "wall1"
					else if(durability < maxdurability * 1/4)
						icon_state = "wall4"
					else if(durability < maxdurability * 1/2)
						icon_state = "wall3"
					else if(durability < maxdurability * 3/4)
						icon_state = "wall2"
				if(durability <= 0)
					del(src)
			proc
				v_destroy(mob/game/M, obj/game/structure/O, action, percent)
					if(!Validate(O, adj(M)))
						return
					if(M.action)
						return
					if(M.pknewbie)
						M.mess("You are still under newbie protection, you may not vandalize structures!")
						return
					if(action == "salvaging" && !findtext(O.owner,"$[ckey(M.name)]|"))
						M.mess("You cannot salvage the properties of others. Try vandalizing.")
						return
					else if(action == "vandalizing" && O.savvalue1 > 0)
						M.mess("This structure has been vandalized recently.")
						return
					var/delay = M.Delay(action)
					M.mess("You begin [action] [O]. ([delay])","[M] begins [action] [O].")
					M.action = new/atom/movable/action(O.contents)
					M.action.Setup("[action] [O]...", O.icon, O.icon_state)
					M.action.Run(O, M, PAC_SELF, delay)
					for(var/type in O.resources)
						var/obj/game/item/I = new type()
						I.amount = O.resources[type]
						percent = rand(percent*9/10, percent*11/10)
						I.amount = round(I.amount * percent / 100)
						M.mess("You retrieved [I.amount] [I.name].")
						MoveStack(I, M, I.amount)
					if(action == "salvaging")
						del(O)
					else if(action == "vandalizing")
						var/damage = 1000 + max(0, (maxdurability - 20000) / 20)
						ChangeDurability(-damage)
						O.savvalue1 = 480  // 8 hours in seconds
				v_repair(mob/game/M, obj/game/structure/O)
					if(!Validate(O, adj(M)))
						return
					if(M.action)
						return
					var/delay = M.Delay("repair")
					M.mess("You begin repairing [O]. ([delay])","[M] begins repairing [O].")
					M.action = new/atom/movable/action(O.contents)
					M.action.Setup("Repairing [O]...", O.icon, O.icon_state)
					M.action.Run(O, M, PAC_SELF, delay)
					var/percent = 0.5
					var/list/res = O.resources.Copy()
					for(var/x in res)
						res[x] = round(res[x] * percent)
					for(var/obj/game/item/I in M)
						res[I.type] -= I.amount
					for(var/r in res)
						if(res[r] > 0)
							M.mess("You don't have enough resources! Repairing a structure costs half the creation cost.")
							return 0
					res = O.resources.Copy()
					for(var/x in res)
						res[x] = round(res[x] * percent)
					for(var/obj/game/item/r in M)
						if(res[r.type] > 0)
							DelStack(r, res[r.type])
							res[r.type] = 0
					M.mess("You repaired [O].")
					O.durability = O.maxdurability
				v_door(mob/game/M, obj/game/structure/O, state="door", all=0, delay=0)
					if(!Validate(O, adj(M)))
						return
					if(all || findtext(O.owner,"$[ckey(M.name)]|"))
						if(delay)
							M.mess("You begin opening the [state]. ([delay])","[M] begins opening the [O].")
							M.action = new/atom/movable/action(O.contents)
							M.action.Setup("Opening [state]...", O.icon, O.icon_state)
							M.action.Run(O, M, PAC_SELF, delay)
						if(icon_state == "[state] closed")
							icon_state = "[state] open"
							if(state != "window")
								density = 0
							M.mess("You opened the [state].","[M] opened the [state].")
						else
							icon_state = "[state] closed"
							if(state != "window")
								density = 1
							M.mess("You closed the [state].","[M] closed the [state].")
					else
						M.mess("You do not own that [state]!")


			plank
				maxdurability = 20000
				durability = 20000
				icon = 'structure_plank.dmi'
				wall
					resources = list(/:materials/lumber = 15)
					icon_state = "wall1"
					structure_type = STRUCTURE_WALL
					density = 1
				window
					resources = list(/:materials/lumber = 15)
					icon_state = "window closed"
					density = 1
					Click()
						v_door(usr, src, state="window")
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="window")
				floor
					resources = list(/:materials/lumber = 10)
					icon_state = "floor"
					structure_type = STRUCTURE_FLOOR
				door
					resources = list(/:materials/lumber = 25)
					icon_state = "door closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src)
					verb
						door()
							set src in view(1)
							v_door(usr, src)


			wood
				maxdurability = 35000
				durability = 35000
				icon = 'structure_wood.dmi'
				wall
					resources = list(/:materials/lumber = 20)
					icon_state = "wall1"
					structure_type = STRUCTURE_WALL
					density = 1
				window
					resources = list(/:materials/lumber = 20)
					icon_state = "window closed"
					density = 1
					Click()
						v_door(usr, src, state="window")
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="window")
				floor
					resources = list(/:materials/lumber = 15)
					icon_state = "floor"
					structure_type = STRUCTURE_FLOOR
				door
					resources = list(/:materials/lumber = 35)
					icon_state = "door closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src)
					verb
						door()
							set src in view(1)
							v_door(usr, src)
				gate
					resources = list(/:materials/lumber = 60)
					icon_state = "gate closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src, state="gate", all=1, delay=50)
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="gate", all=1, delay=50)


			brick
				maxdurability = 30000
				durability = 30000
				icon = 'structure_sandstone.dmi'
				wall
					resources = list(/:brick/clay_brick = 25)
					icon_state = "wall1"
					structure_type = STRUCTURE_WALL
					density = 1
				window
					resources = list(/:brick/clay_brick = 25)
					icon_state = "window closed"
					density = 1
					Click()
						v_door(usr, src, state="window")
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="window")
				floor
					resources = list(/:brick/clay_brick = 20)
					icon_state = "floor"
					structure_type = STRUCTURE_FLOOR
				cross_floor
					resources = list(/:brick/clay_brick = 30)
					icon_state = "cross floor"
					structure_type = STRUCTURE_FLOOR
				cobblestone_floor
					resources = list(/:item/stone/stone = 20)
					icon_state = "cobblestone floor"
					structure_type = STRUCTURE_FLOOR
				pillar
					resources = list(/:brick/clay_brick = 50)
					icon_state = "pillar"
					layer = LAYER_FLY_0
				door
					resources = list(/:brick/clay_brick = 40)
					icon_state = "door closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src)
					verb
						door()
							set src in view(1)
							v_door(usr, src)
				gate
					resources = list(/:brick/clay_brick = 70)
					icon_state = "gate closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src, state="gate", all=1, delay=50)
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="gate", all=1, delay=50)

			fired_brick
				maxdurability = 40000
				durability = 40000
				icon = 'structure_fired_brick.dmi'
				wall
					resources = list(/:brick/fired_clay_brick = 25, /:mortar/lime_mortar = 8)
					icon_state = "wall1"
					structure_type = STRUCTURE_WALL
					density = 1
				window
					resources = list(/:brick/fired_clay_brick = 25, /:mortar/lime_mortar = 6)
					icon_state = "window closed"
					density = 1
					Click()
						v_door(usr, src, state="window")
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="window")
				door
					resources = list(/:brick/fired_clay_brick = 40, /:mortar/lime_mortar = 5)
					icon_state = "door closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src)
					verb
						door()
							set src in view(1)
							v_door(usr, src)
				gate
					resources = list(/:brick/fired_clay_brick = 70, /:mortar/lime_mortar = 10)
					icon_state = "gate closed"
					structure_type = STRUCTURE_DOOR
					density = 1
					Click()
						v_door(usr, src, state="gate", all=1, delay=50)
					verb
						door()
							set src in view(1)
							v_door(usr, src, state="gate", all=1, delay=50)

			water_container
				durability = 30000
				maxdurability = 30000
				savvalue1 = 15
				savvalue2 = 15
				Click()
					v_drink(usr, src, 20)
				DblClick()
					return

				brick_fountain
					layer = LAYER_OBJ_5
					resources = list(/:brick/clay_brick = 150)
					icon = 'obj1.dmi'
					icon_state = "brick fountain"
					density = 1

			anvil
				durability = 70000
				maxdurability = 70000
				layer = LAYER_OBJ_5
				basic_anvil
					resources = list(/:iron/iron_bar = 250)
					icon = 'obj1.dmi'
					icon_state = "anvil"
					density = 1

			rip_saw
				durability = 70000
				maxdurability = 70000
				layer = LAYER_OBJ_5
				ground_rip_saw
					resources = list(/:iron/iron_bar = 250)
					icon = 'obj1.dmi'
					icon_state = "anvil"
					density = 1

			lathe
				maxdurability = 20000
				durability = 20000
				layer = LAYER_OBJ_5
				wooden_bow_lathe
					resources = list(/:materials/lumber = 110, /:iron)
					density = 1


			kiln
				maxdurability = 50000
				durability = 50000
				layer = LAYER_OBJ_5
				ceremic_brick_kiln
					resources = list(/:brick/clay_brick = 300)
					density = 1
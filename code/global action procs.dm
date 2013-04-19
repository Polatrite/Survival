/*
global action procs.dm

- Eating
- Drinking
- Filling containers
- Lighting and extinguishing lights
- Targeting characters (including beginning combat)
- Hiding behind objects
- Looting corpses

*/


proc
	v_eat(mob/game/M, obj/game/O)
		if(M.action)
			return 0
		if(!Validate(O, M.contents))
			return
		if(O.value3 + M.fullness > M.maxfullness)
			M.mess("You are too full!")
			return 0
		if(!O.value1 && !O.value2 && !O.value3)
			M.mess("You cannot eat that.")
		var/delay = M.Delay("eat")
		M.mess("You start eating a [O]. ([delay])","[M] begins eating a [O].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Eating [O]...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		M.RaiseRegen(O.value1, O.value2, O.value3)
		M.hunger -= O.value3 * 800
		M.mess("Yummy!","[M] ate a [O].")
		DelStack(O, 1)

	v_drink(mob/game/M, atom/O, val)
		if(M.action)
			return 0
		if(!Validate(O, adj(M)))
			return
		if(istype(O, /obj/game/item/water_container))
			if(!O:savvalue1)
				M.mess("[O] is empty.")
				return 0
		if(istype(O, /obj/game/structure/water_container))
			if(!O:savvalue1)
				M.mess("[O] is empty. Give it time to refill.")
				return 0
		if(3 + M.fullness > M.maxfullness)
			M.mess("You are too full!")
			return 0
		var/delay = M.Delay("drink")
		M.mess("You begin drinking. ([delay])","[M] begins drinking.")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Drinking...", M.icon, M.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		if(istype(O, /obj/game/item/water_container))
			if(O:savvalue1)
				O:savvalue1--
				UpdateStack(O)
				O:Unstack()
		if(istype(O, /obj/game/structure/water_container))
			if(O:savvalue1)
				O:savvalue1--
		M.ChangeHP(val/5)
		M.ChangeStamina(val*3)
		M.RaiseRegen(1, 1, 3)
		M.thirst -= val * 400
		M.mess("Ahhh!")

	v_fill(mob/game/M, obj/game/item/water_container/O, atom/A)
		if(M.action)
			return 0
		if(!Validate(O, adj(M)))
			return
		if(istype(A, /obj/game/structure/water_container))
			if(A:savvalue1 < (O.savvalue2 - O.savvalue1))
				M.mess("[A] is empty. Give it time to refill.")
				return 0
			else
				A:savvalue1 -= (O.savvalue2 - O.savvalue1)
		var/delay = M.Delay("water-fill")
		M.mess("You fill [O]. ([delay])","[M] fills [O].")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Filling [O]...", M.icon, M.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		O.savvalue1 = O.savvalue2
		UpdateStack(O)
		O.Unstack()

	v_light(mob/game/M, obj/game/O)
		if(M.action)
			return 0
		if(!Validate(O, M.contents))
			return
		var/delay = M.Delay("light")
		M.mess("You light \a [O]. ([delay])","[M] lights \a [O].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Lighting [O]...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		var/obj/game/item/light/lit_torch/I = new /obj/game/item/light/lit_torch()
		I.value1 = O.value1
		MoveStack(I, M, 1)
		M.SetLighting()
		DelStack(O, 1)

	v_extinguish(mob/game/M, obj/game/O)
		if(M.action)
			return 0
		if(!Validate(O, M.contents))
			return
		var/delay = M.Delay("light")
		M.mess("You extinguish \a [O]. ([delay])","[M] extinguishs \a [O].")
		M.action = new/atom/movable/action(O.contents)
		M.action.Setup("Extinguishing [O]...", O.icon, O.icon_state)
		M.action.Run(O, M, PAC_SELF, delay)
		var/obj/game/item/light/torch/I = new /obj/game/item/light/torch()
		I.value1 = O.value1
		MoveStack(I, M, 1)
		M.SetLighting()
		DelStack(O, 1)

	v_skillset(mob/game/M, type, skill)
		if(M.action)
			return 0
		for(var/skill/S in M.skill_list)
			if(S.name == skill)
				S.status = type
				switch(type)
					if(INCREASE)
						M.mess("Now increasing the focus of [skill].")
					if(DECREASE)
						M.mess("Now decreasing the focus of [skill].")
					if(LOCKED)
						M.mess("Now the focus of [skill] is locked.")
				break;

	v_target(mob/game/M, mob/game/H)
		M.hit_target = null
		M.target = H
		if(M.client)
			del(M.target_marker)
			del(M.hit_target_marker)
			var/image/L = image('shiny effects.dmi', H, icon_state = "target", layer = LAYER_FLY_0)
			L.pixel_y = 20
			M.target_marker = L
			M << L

	v_setattack(mob/game/M, mob/game/H)
		M.target = null
		M.hit_target = H
		if(M.client)
			del(M.target_marker)
			del(M.hit_target_marker)
			var/image/L = image('shiny effects.dmi', H, icon_state = "attacking target", layer = LAYER_FLY_0)
			L.pixel_y = 20
			M.hit_target_marker = L
			M << L

	v_hide(mob/game/M, obj/game/I)
		return
		if(M.action)
			return 0
		if(!Validate(I, adj(M)))
			return
		M.stealth_prev_loc = M.loc
		//world << "[M.x],[M.y],[M.z]"
		M.density = 0
		if(M.Move(I.loc))
			M.mess("You slip behind [I].", "[M] slips behind [I].")
			M.stealth = I
			M.invisibility = 1
			M.Transfer(M.stealth_prev_loc)
			//M.layer = 0
		else
			M.mess("You cannot get in.")
		M.density = 1

	v_loot(mob/game/M, obj/game/I)
		if(M.action)
			return 0
		if(!Validate(I, adj(M)))
			return
		var/delay = M.Delay("loot")
		M.mess("You begin looting [I.name]. ([delay])","[M] begins looting [I.name].")
		M.action = new/atom/movable/action(M.contents)
		M.action.Setup("Looting...", M.icon, M.icon_state)
		M.action.Run(I, M, PAC_SELF, delay)
		var/item_looted = 0
		if(M.name == I.owner)
			for(var/obj/game/O in I)
				MoveStack(O, M, O.amount)
			M.mess("You recovered your corpse!","[M] recovered their corpse!")
		else
			for(var/obj/game/O in I)
				if(item_looted == 0)
					var/amt = 0
					var/nam = O.name
					if(O.amount > 1)
						amt = O.amount
						amt = min(amt,5)
					if(O.amount > 5)
						MoveStack(O, M, 5)
					else
						MoveStack(O, M, O.amount)
					item_looted = 1
					if(amt)
						M.mess("You looted [amt] [nam] from [I.name]!","[M] looted [amt] [nam]'s from [I.name]!")
						world.log << "[M]: loots [I] - [amt] [nam]"
					else
						M.mess("You looted [nam] from [I.name]!","[M] looted [nam] from [I.name]!")
						world.log << "[M]: loots [I] - [nam]"
		if(item_looted == 0)
			M.mess("[I] decays into dust.","[I] decays into dust.")
			I.loc = null
			spawn(20)
				del(I)

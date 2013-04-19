turf
	layer = LAYER_GROUND
	var
		water = 0
		being_entered = 0
		joinflag = 0
		joinstyle = 1
		autojointype


	water
		icon = 'water.dmi'
		icon_state = "water"
		water = 1
		joinstyle = 2
		var
			fish = /obj/game/item/food/fish/minnow
		Click()
			if(get_dist(usr, src) <= 1)
				v_drink(usr, src, 20)
			else
				v_fish(usr, src)
		Enter(mob/game/M)
			if(istype(M))
				M.old_icon = M.icon
				M.old_icon_state = M.icon_state
				M.old_overlays = M.overlays
				if(locate(/obj/game/item/boat) in src)
					if((locate(/obj/game/item/boat/raft) in src) && (locate(/mob/game) in src))
						return 0
					M.move_delay = 7
					return ..()
				else
					M.move_delay = 12
					M.icon = 'MyIcon.dmi'
					M.icon_state = "swimming [M.gender]"
					M.overlays -= M.head_overlay
					return ..()
			return ..()
		Exit(mob/game/M)
			if(istype(M))
				if(M.icon_state == "swimming [M.gender]")
					M.icon = M.old_icon
					M.icon_state = M.old_icon_state
					M.overlays += M.head_overlay
				M.move_delay = 3
				return ..()
			return ..()

		proc
			NewFish()
				fish = pick(fish_types)
			Fish(delay)
				spawn(delay)
					fish = pick(fish_types)

area
	recall

	noob_mine
	noob_mine_spawn


	// Wraps the world to allow infinite walking in both X/Y axis.
	wrap
		Enter(mob/M)
			if(istype(M, /obj/system/flyover))
				del(M)
				return
			..()
		wrap_to_south
			Enter(mob/M)
				if(istype(M, /obj/system/flyover))
					del(M)
					return
				M.y = 10
		wrap_to_north
			Enter(mob/M)
				if(istype(M, /obj/system/flyover))
					del(M)
					return
				M.y = 390
		wrap_to_east
			Enter(mob/M)
				if(istype(M, /obj/system/flyover))
					del(M)
					return
				M.x = 390
		wrap_to_west
			Enter(mob/M)
				if(istype(M, /obj/system/flyover))
					del(M)
					return
				M.x = 10


	// Used when automatically populating the world with plant life, animals and more.
	// Also used for crop growth and some player actions and skills.
	low_fertility
		no_fertility
			no_build

	high_fertility
		very_high_fertility
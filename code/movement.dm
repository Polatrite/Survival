/*world
    fps = 40
#define TILE_WIDTH  32
#define TILE_HEIGHT 32
#define TICK_LAG    0.25 //set to (10 / world.fps) a define is faster, though

atom/movable
    var
        move_glide_delay = TICK_LAG * 8
    Move(atom/NewLoc,Dir=0,step_x=0,step_y=0)
        if(ismob(src))
            var/mob/game/M = src
            if(M.moving)
                return 0
        //set up glide sizes before the move
        //ensure this is a step, not a jump
        if(src.loc && get_dist(src,NewLoc)==1)
            . = get_dir(src,NewLoc)
            if(. & . - 1) //if a diagonal move
                src.glide_size = sqrt(TILE_WIDTH**2 + TILE_HEIGHT**2) / move_glide_delay * TICK_LAG
                //glide value must be based on the hypotenuse
            else if(. < 4) //north or south case
                src.glide_size = TILE_HEIGHT / move_glide_delay * TICK_LAG
                //glide value must be based on the adjacent
            else //east or west case
                src.glide_size = TILE_WIDTH / move_glide_delay * TICK_LAG
                //glide value must be based on the opposite
        . = ..(NewLoc,Dir,step_x,step_y)
        if(ismob(src))
            var/mob/game/M = src
            M.moving = 1
            spawn(M.move_glide_delay)
                M.moving = 0*/



atom/movable
	Move(atom/newLoc, dir, step_x, step_y)
		var/oldloc = loc
		if(followers.len)
			if(ismob(src))
				world << "[initial(src:move_delay)],[followers.len]"
				src:move_delay = initial(src:move_delay) + followers.len // replace this with real logic based on the type of follower later
			for(var/atom/movable/A in followers)
				step_to(A, oldloc)
				A.dir = dir
		return ..()


mob/game
	Move()
		if(src.movable)
			return ..()


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


/*	Move(O,I)
		if(moving <= 0)
			if(..())
				moving = 1
				spawn(move_delay)
					moving = 0
		else
			return*/


/*client

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
				src.mob.dir = turn(src.mob.dir, 90)*/


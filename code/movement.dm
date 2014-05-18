/*world
    icon_size = 32
    fps = 25
#define TILE_WIDTH  32
#define TILE_HEIGHT 32
#define TICK_LAG    0.4 //set to (10 / world.fps) a define is faster, though

atom/movable
    var
        move_glide_delay = TICK_LAG
    Move(atom/NewLoc,Dir=0,step_x=0,step_y=0)
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
*/


atom/movable
	Move(atom/newLoc, dir, step_x, step_y)
		var/oldloc = loc
		if(followers.len)
			for(var/atom/movable/A in followers)
				step_to(A, oldloc)
				A.dir = dir
		return ..()
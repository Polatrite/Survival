
// File:    movement-demo\demo.dm
// Library: Forum_account.Keyboard
// Author:  Forum_account
//
// Description:
//   This demo shows how to use the client's "keys" list to create
//   movement based on what arrow keys are being held.

client

	// by default the key_down and key_repeat procs handle
	// movement, but we want to handle movement differently
	// so we override them to make them do nothing.
	key_down()
	key_repeat()

	New()
		..()

		// start the movement loop
		spawn()
			movement_loop()

	proc
		movement_loop()
			// call the move() proc once per tick
			while(1)
				sleep(world.tick_lag)
				move()

		move()

			// figure out what direction the client's mob should
			// move in based on what keys they're holding.
			var/d = 0

			if(keys["north"]) d |= NORTH
			if(keys["south"]) d |= SOUTH
			if(keys["east"]) d |= EAST
			if(keys["west"]) d |= WEST

			// move them in that direction
			step(mob, d)

// the rest of this code is needed to create the map used
// in this demo, but this code has nothing to do with how
// to use this library.

atom
	icon = 'keyboard-demo-icons.dmi'

mob
	icon_state = "mob"

client
	view = 5

turf
	grass
		icon_state = "grass"

	rock
		density = 1
		icon_state = "rock"

	water
		density = 1
		icon_state = "water"

	trees
		density = 1
		icon_state = "trees"
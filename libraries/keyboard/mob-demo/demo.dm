
// File:    mob-demo\demo.dm
// Library: Forum_account.Keyboard
// Author:  Forum_account
//
// Description:
//   This demo shows how to define how keyboard input affects a mob
//   and change client.focus to easily make the player able to control
//   different mobs.
//
//   Click on a mob to control it, then use the arrow keys to make it move.

mob
	Login()
		..()

		src << "Click on a mob to direct your keyboard events to that mob."
		src << "Use the arrow keys to make the selected mob move."

		client.focus = src

	// pressing an arrow key triggers movement
	key_down(k)
		if(k == "north")
			step(src, NORTH)
		else if(k == "south")
			step(src, SOUTH)
		else if(k == "east")
			step(src, EAST)
		else if(k == "west")
			step(src, WEST)

	// handle the key repeat events the same was as key down events
	key_repeat(k)
		key_down(k)

client
	Click(atom/a)
		focus = a


// the rest of this code is needed to create the map used
// in this demo, but this code has nothing to do with how
// to use this library.

atom
	icon = 'keyboard-demo-icons.dmi'

mob
	icon_state = "mob"

	other_mob
		icon_state = "other-mob"

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

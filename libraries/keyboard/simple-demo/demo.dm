
// File:    simple-demo\demo.dm
// Library: Forum_account.Keyboard
// Author:  Forum_account
//
// Description:
//   This demo shows how you can use the mob's key_down() proc to make
//   actions happen when keys are pressed.
//
//   Use the arrow keys to move, press A to attack and S to speak.

mob
	Login()
		..()

		// this will cause the mob's key_down() proc to be called
		// when you press a key. if we didn't do this, the client's
		// key_down() proc would be called instead.
		client.focus = src

	key_down(k)

		// handle actions (attacking and speaking)
		if(k == "a")
			attack()
		else if(k == "s")
			speak()

		// handle movement
		else if(k == "north")
			step(src, NORTH)
		else if(k == "south")
			step(src, SOUTH)
		else if(k == "east")
			step(src, EAST)
		else if(k == "west")
			step(src, WEST)

	proc
		attack()
			src << "\red You attack!"

		speak()
			var/message = input(src, "What would you like to say?") as text
			world << "\blue[src] says: [message]"


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
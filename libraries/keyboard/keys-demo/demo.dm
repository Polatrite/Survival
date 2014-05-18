
// File:    keys-demo\demo.dm
// Library: Forum_account.Keyboard
// Author:  Forum_account
//
// Description:
//   This demo shows how to customize which keys are macroed.

// We only create macros for the arrow keys and number keys.
client
	keys = ARROWS + NUMBERS

	// we can also set the keys var to be a pipe-delimited
	// list of the exact set of keys we want to macro.
	// keys = "north|south|east|west|1|2|3|4"

mob
	Stat()

		// display the list of keys being held
		var/keys_held = ""
		for(var/k in client.keys)
			if(client.keys[k])
				if(keys_held)
					keys_held += ", "
				keys_held += "[k]"

		stat("keys", keys_held)

	Login()
		..()

		src << "Use the arrow keys to move and 1-4 for special attacks."
		src << "Look at the stat panel to see which keys are being held. Press keys that aren't macroed (ex: any letter key) and see that the stat panel doesn't list those keys."

		client.focus = src

	key_down(k)

		// pressing an arrow key triggers movement
		if(k == "north")
			step(src, NORTH)
		else if(k == "south")
			step(src, SOUTH)
		else if(k == "east")
			step(src, EAST)
		else if(k == "west")
			step(src, WEST)

		// the 1-4 keys trigger special attacks
		else if(k == "1" || k == "2" || k == "3" || k == "4")
			special_attack(k)

	proc
		special_attack(number)
			world << "[src] uses special attack #[number]."


// the rest of this code is needed to create the map used
// in this demo, but this code has nothing to do with how
// to use this library.

world
	fps = 30

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


// File:    icon-selection-demo\demo.dm
// Library: Forum_account.Keyboard
// Author:  Forum_account
//
// Description:
//   This demo shows how we can shift the focus between the client and
//   another object to create an icon selection feature. To manage this
//   we define the IconSelection object and make its key_down proc handle
//   changing your icon.
//
//   Press the I key to enable icon selection, then use the left/right
//   keys to change icons. Press Esc when you're done to be able to move
//   again.

IconSelection
	var
		// the index of the selected icon state
		index = 1

		// the list of possible icon states
		list/choices = list("mob", "other-mob", "blue-mob")

	// k is the key that was pressed, c is the client who pressed it
	key_down(k, client/c)

		// pressing right and left make you switch to the
		// next or previous icon.
		if(k == "east")
			index += 1
			if(index > choices.len)
				index = 1

			c.mob.icon_state = choices[index]

		else if(k == "west")
			index -= 1
			if(index <= 0)
				index = choices.len

			c.mob.icon_state = choices[index]

		// pressing Esc sets focus back to the client.
		else if(k == "escape")
			c.focus = c
			c << "Use the arrow keys to move again."

client
	var
		IconSelection/icon_selection = new()

	New()
		..()
		src << "Press the I key to enable icon selection. When selecting an icon, press the left or right arrow key to change icons and the Esc key to accept the icon."

	key_down(k)

		// when they press I, set focus to icon_selection.
		if(k == "i")
			focus = icon_selection
			src << "Use the left/right keys to change your icon. Press Esc when you're done."

		// if they pressed any other key, run the default behavior.
		// the default behavior makes the mob move when an arrow
		// key is pressed
		else
			..()

// the rest of this code is needed to create the map used
// in this demo, but this code has nothing to do with how
// to use this library.

atom
	icon = 'keyboard-demo-icons.dmi'

client
	view = 5

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

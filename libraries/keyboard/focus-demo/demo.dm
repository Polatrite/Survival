
// File:    focus-demo\demo.dm
// Library: Forum_account.Keyboard
// Author:  Forum_account
//
// Description:
//   This demo shows what the effect of changing client.focus is. When
//   a key press, release, or repeat event occurs, the event will be
//   passed to the object referenced by client.focus. By changing the
//   object that client.focus points to, you can easily create and
//   manage different input modes.
//
//   This demo shows the default behavior that happens when the client's
//   focus is the client - it makes your mob move when the arrow keys are
//   pressed. When client.focus is null, no object is notified of the
//   keyboard events so nothing happens when you press the arrow keys.

mob
	verb
		Null_Focus()
			client.focus = null
			src << "client.focus = null, now the arrow keys <b>won't</b> make you move."

		Reset_Focus()
			client.focus = client
			src << "client.focus = client, now the arrow keys <b>will</b> make you move."


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
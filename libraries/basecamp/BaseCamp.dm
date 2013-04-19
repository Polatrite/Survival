////////////////////////////////////////////////
// BaseCamp: From here you can reach Everest! //
////////////////////////////////////////////////
// BaseCamp is Deadron's set of libraries providing
// core game functionality.
//
// This library is used by the other BaseCamp libraries
// for items in common between the libraries.
// It doesn't do anything interesting in itself.

/*
 Global GameController variable
 ------------------------------
 This is where the global GameController is stored.
 You can access it from anywhere in your code:

 GameController.cycle_delay = 3
*/
var/BaseCamp/GameController/GameController




// The rest of this is used by various BaseCamp libraries.
// You don't need to touch any of it.
world
	New()
		var/result = ..()
		if (!GameController)
			GameController = new()
		return result


BaseCamp/GameController
	// Runs the game event loop.
	var/tmp
		name = "GameController"
		initialized = 0


	proc
		Initialize()
			initialized = 1
			return

	Write()
//		GlobalMessage("\red BaseCamp: Illegal attempt to write GameController to savefile!")
		world.log << "BaseCamp: Illegal attempt to write GameController to savefile!"
		return


client
	var/tmp/base_initialized = 0

	New()
		var/result = ..()
		base_Initialize()
		return result

	proc/base_Initialize()
		base_initialized = 1
		return

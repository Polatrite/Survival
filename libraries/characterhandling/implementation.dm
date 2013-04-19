////////////////////////////
// DON'T TOUCH THIS FILE! //
////////////////////////////
/*
 Unless you are a BYOND guru who is curious how this works,
 there is no point in reading this file.  It's just the gritty
 code, and you NEVER need to touch it or even read it.

 See characterhandling.dm for full library documentation.

 If you touch this file and then your character saving breaks,
 don't bug me about it, it's not my problem.
*/

#include <deadron/basecamp>

#define BASE_MENU_CREATE_CHARACTER	"Create New Character"
#define BASE_MENU_DELETE_CHARACTER	"Delete Character"
#define BASE_MENU_CANCEL			"Cancel"
#define BASE_MENU_QUIT				"Quit"


// Implementation
client/var/tmp
	base_num_characters_allowed = 1
	base_autoload_character = 1
	base_autosave_character = 1
	base_autodelete_mob = 1
	base_save_verbs = 1

mob
	var/tmp
		base_save_allowed = 1	// Is this mob allowed to be saved?
		base_save_location = 1	// Should the mob's location be saved and restored?

	var/list/base_saved_verbs	// If we're saving verbs they are stored here.

	proc/base_InitFromSavefile()
		return

	Write(savefile/F)
		// Save the location if that has been specified and there is a map.
		// First, call the default Write() behavior for mobs.
		..()

		if (base_save_location && world.maxx)
			F["last_x"] << x
			F["last_y"] << y
			F["last_z"] << z
		return

	Read(savefile/F)
		// Restore the mob's location if that has been specified and there is a map.
		// Tries to use Move() to place the character, in case the game has special Move() handling.
		// If that fails, forces the move by setting the loc.

		// Call the default Read() behavior for mobs.
		..()

		if (base_save_location && world.maxx)
			var/last_x
			var/last_y
			var/last_z
			F["last_x"] >> last_x
			F["last_y"] >> last_y
			F["last_z"] >> last_z
			var/destination = locate(last_x, last_y, last_z)

			if (!Move(destination))
				loc = destination
		return

mob/BaseCamp
	base_save_allowed = 0			// BaseCamp mobs are for admin only.

	Login()
		RemoveVerbs()
		// Don't use any other Login() code.
		return

	Stat()
		// Don't want any stat panels for BaseCamp mobs.
		return

	Logout()
		// Don't use any other Logout() code.
		return

	proc/RemoveVerbs()
		for (var/my_verb in verbs)
			verbs -= my_verb

mob/BaseCamp/FirstTimePlayer
	proc/FirstTimePlayer()
		// Here in case developer wants to do something first time a player ever logs in.
		return 1


mob/BaseCamp/ChoosingCharacter
	Login()
		// spawn to make sure all administrative tasks are over.
		spawn()
			ChooseCharacter()
		return ..()

	proc/ChooseCharacter()
		var/list/available_char_names = client.base_CharacterNames()
		var/list/menu = new()
		menu += available_char_names

		if (length(available_char_names) < client.base_num_characters_allowed)
			if (client.base_num_characters_allowed == 1)
				// If only one character allowed, jump right to creating character.
				client.base_NewMob()
				del(src)
				return
			else
				menu += BASE_MENU_CREATE_CHARACTER

		if (length(available_char_names))
			menu += BASE_MENU_DELETE_CHARACTER

		menu += BASE_MENU_QUIT

		// Let developer provide their own menu if they wish.
		ChooseCharacterMenu(menu)

	proc/ChooseCharacterMenu(list/menu)
		// Given a list of menu options, display them and call ChooseCharacterResult() with the choice.
		var/default = null
		var/result = input(src, "Who do you want to be this fine day?", "Welcome to [world.name]!", default) in menu
		ChooseCharacterResult(result)

	proc/ChooseCharacterResult(menu_choice)
		// Respond to the option the player chose from the character choosing menu.
		switch(menu_choice)
			if (0, BASE_MENU_QUIT)
				// Kick them off.
				del(src)
				return

			if (BASE_MENU_CREATE_CHARACTER)
				client.base_NewMob()
				del(src)
				return

			if (BASE_MENU_DELETE_CHARACTER)
				// Give them a chance to delete something, but then they need to choose.
				DeleteCharacter()
				return

		// They must have chosen a character, so load it.
		var/mob/Mob = client.base_LoadMob(menu_choice)
		if (Mob)
			del(src)
		else
			ChooseCharacter()

	proc/DeleteCharacter()
		var/list/available_char_names = client.base_CharacterNames()
		var/list/menu = new()
		menu += available_char_names

		menu += BASE_MENU_CANCEL
		menu += BASE_MENU_QUIT

		// Let developer provide their own menu if they wish.
		DeleteCharacterMenu(menu)

	proc/DeleteCharacterMenu(list/menu)
		// Given a list of menu options, display them and return the result.
		var/default = null
		var/result = input(src, "Which character do you want to delete?", "Deleting character", default) in menu
		if (result)
			DeleteCharacterResult(result)

	proc/DeleteCharacterResult(menu_choice)
		// Respond to the option the player chose from the character deletion menu.
		switch(menu_choice)
			if (0, BASE_MENU_QUIT)
				// Kick them off.
				del(src)
				return

			if (BASE_MENU_CANCEL)
				ChooseCharacter()
				return

		// They chose a character to delete.
		client.base_DeleteMob(menu_choice)
		ChooseCharacter()
		return


client
	var/tmp/savefile/_base_player_savefile

	New()
		// Let them choose/create a character.
		if (base_autoload_character)
			base_ChooseCharacter()
			base_Initialize()
			return
		return ..()

	Del()
		// Save character.
		if (base_autosave_character)
			base_SaveMob()

		// Delete mob.
		if (base_autodelete_mob)
			del(mob)
		return ..()


	proc/base_PlayerSavefile()
		if (!_base_player_savefile)
			// Put in players/[first_initial]/[ckey].sav
			var/start = 1
			var/end = 2
			var/first_initial = copytext(ckey, start, end)
			var/filename = "players/[first_initial]/[ckey].sav"
			_base_player_savefile = new(filename)
		return _base_player_savefile


	proc/base_FirstTimePlayer()
		var/mob/BaseCamp/FirstTimePlayer/first_mob = new()
		first_mob.name = key
		first_mob.gender = gender
		mob = first_mob
		return first_mob.FirstTimePlayer()


	proc/base_ChooseCharacter()
		// Switches the player to a choosing character mob.
		// In case switching in middle of game, save previous mob.
		base_SaveMob()

		var/mob/BaseCamp/ChoosingCharacter/chooser

		// Do they have any characters to choose from?
		var/list/names = base_CharacterNames()
		if (!length(names))
			// They must be a first time player.
			var/result = base_FirstTimePlayer()
			if (!result)
				// They weren't approved, so boot 'em.
				del(src)
				return

			// Okay let them create their first character.
			chooser = new()
			mob = chooser
			return

		// If only one character is allowed, try to just load it.
		if (base_num_characters_allowed == 1)
			base_LoadMob(names[1])
			return

		chooser = new()
		mob = chooser
		return


	proc/base_CharacterNames()
		// Get the full names of all this player's characters.
		var/list/names = new()
		var/savefile/F = base_PlayerSavefile()

		F.cd = "/players/[ckey]/mobs/"
		var/list/characters = F.dir
		var/char_name
		for (var/entry in characters)
			F["[entry]/name"] >> char_name
			names += char_name
		return names


	proc/base_NewMob()
		// Give the player a standard mob.
		// First save existing mob if necessary.
		base_SaveMob()
		var/mob/new_mob
		new_mob = new world.mob()
		new_mob.name = key
		new_mob.gender = gender
		mob = new_mob
//		new_mob.base_Initialize()

		// Clear out the savefile to keep it from staying open.
		_base_player_savefile = null
		return new_mob


	proc/base_SaveMob()
		// Saves the player's current mob based on the ckey of its name.
		if (!mob || !mob.base_save_allowed)
			return

		// If we're saving verbs, move them over now.
		if (base_save_verbs)
			mob.base_saved_verbs = mob.verbs

		var/savefile/F = base_PlayerSavefile()

		var/mob_ckey = ckey(mob.name)

		var/directory = "/players/[ckey]/mobs/[mob_ckey]"
		F.cd = directory
		F["name"] << mob.name
		F["mob"] << mob
		_base_player_savefile = null


	proc/base_LoadMob(char_name)
		// Look for a character with the ckey version of this name.
		// If found, load it, set the client mob to it, and return it.
		// Otherwise return null.
		var/mob/new_mob
		var/char_ckey = ckey(char_name)
		var/savefile/F = base_PlayerSavefile()
		_base_player_savefile = null

		F.cd = "/players/[ckey]/mobs/"
		var/list/characters = F.dir
		if (!characters.Find(char_ckey))
			world.log << "[key]'s client.LoadCharacter() could not locate character [char_name]."
			mob << "Unable to load [char_name]."
			return null

		F["[char_ckey]/mob"] >> new_mob
		if (new_mob)
			mob = new_mob
			new_mob.base_InitFromSavefile()

			// If we're doing verbs, set them now.
			if (base_save_verbs && new_mob.base_saved_verbs)
				for (var/item in new_mob.base_saved_verbs)
					new_mob.verbs += item
			return new_mob
		return null


	proc/base_DeleteMob(char_name)
		// Look for a character with the ckey version of this name.
		// If found, delete it.
		var/char_ckey = ckey(char_name)
		var/savefile/F = base_PlayerSavefile()

		F.cd = "/players/[ckey]/mobs/"
		F.dir.Remove(char_ckey)


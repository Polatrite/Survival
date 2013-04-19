#include "implementation.dm"

/////////////////////////////////////////////
// WELCOME TO BASECAMP: CHARACTER HANDLING //
/////////////////////////////////////////////
/*
 For a fully working example using this library, download:

 byond://Deadron.SimpleSaving

 or

 byond://Deadron.CharacterSaving

 Everything you need to read about the library is in this file.
 You don't need to look at anything else in the library, unless
 you have a good understanding of BYOND and want to see how it
 works.
*/


/****
 USING THE LIBRARY
 To use the library, you only need to include it, with this line:

#include <deadron/characterhandling>

 You don't need to copy/paste any library code or anything.
 By including it, it will automatically add itself to your game.

 You don't need to do anything else special to use the library.
 The only requirement is the same as for any BYOND game:
 Specify the mob type for new mobs in world.mob, as discussed
 in detail below.

 What it does
 ------------
 When a player logs in, the library checks to see if they have
 any characters saved.  If they do, and if you only allow for
 one character, then the player is immediately logged into that
 character and all their attributes and inventory are restored.

 When the player logs out, their character is automatically saved.
 The character is saved based on its name.


 Choosing a character
 --------------------
 If you allow for multiple characters, then the library lets the
 player choose which character they want to play, or to create
 or delete a character.  When the player chooses a character,
 they are logged into it.  By default he library handles the choosing
 process automatically.  You don't need to do anything.

 You can customize the menus used for choosing and deleting characters,
 as discussed below.

 If you want to change the default behavior, look at the client
 variables discussed further down in this file.


 Creating a character
 --------------------
 If a character needs to be created, then the library creates
 a mob of type world.mob and logs the character into it.
 Whatever you specify as world.mob is what is created.
 For example, if this is how world.mob is set:

world
    mob = /mob/new_character

 Then when a brand new character is created, it will be of type
 /mob/new_character.  You can make this any class you want, and
 can do anything you want with the class.  The library just creates
 a mob of that class and logs the player into it.

 If you want the player to specify attributes when their character
 is created, then you might have a mob class designed just to
 ask them what kind of character they want.  See the CharacterSaving
 demo for a complete example of this.

***/


/*
 Setting the number of characters
 --------------------------------
 You can specify how many characters a player is allowed to have.
 using the client variable, base_num_characters_allowed.

 If you set it to 1, then players will be immediately logged into
 their one character.  If you allow more than one, then players will
 automatically be given a choice of which character to they want to play,
 as well as options for creating and deleting characters.
*/
client/base_num_characters_allowed = 1


/*
 Automatically loading/saving player characters
 ---------------------------------------
 By default, CharacterHandling will automatically load the player's
 character on login, and save a player's character and delete the mob
 on logout.  If you don't want one or more of these to happen by default,
 then set the appropriate "auto" variable(s) to 0.

 If you don't want the character autoloaded, call the player's
 client.base_ChooseCharacter() when you DO want it loaded.
*/
client/base_autoload_character = 1
client/base_autosave_character = 1
client/base_autodelete_mob = 1

/*
 Saving verbs
 ------------
 BYOND does not save verbs, but the library takes care of this for you
 by default. If you don't want verbs saved, then set this to 0 in
 your code.
*/
client/base_save_verbs = 1


client/base_ChooseCharacter()
	/*
	 Choosing a character
	 --------------------
	 This function is called automatically on login if
	 client.base_autoload_character is 1.  If only one
	 character is allowed, it immediately logs the player
	 into a character.  If multiple characters are allowed,
	 it gives the player a menu to create/choose/delete
	 characters.
	*/
	return ..()


mob/BaseCamp/ChoosingCharacter
	ChooseCharacterMenu(list/menu)
		/*
		 Customizing Choose menu
		 -----------------------
		 This function receives the list of menu items for choosing
		 a character.  It can display these any way it wishes,
		 then send the player's choice to the ChooseCharacterResult()
		 proc.  The default behavior uses an ugly input() list.
		*/
		return ..()

	DeleteCharacterMenu(list/menu)
		/*
		 Customizing Delete menu
		 -----------------------
		 This function receives the list of menu items for deleting
		 a character.  It can display these any way it wishes,
		 then send the player's choice to the DeleteCharacterResult()
		 proc.  The default behavior uses an ugly input() list.
		*/
		return ..()

client/base_SaveMob()
	/*
	 Forcing the character to be saved
	 ---------------------------------
	 Characters are saved automatically when the player logs out.
	 If you want them saved at other times too, just call this
	 client function for the mob when you want it saved:
	*/
	return ..()



mob/BaseCamp/FirstTimePlayer
	FirstTimePlayer()
		/*
		 Handling first time players
		 ---------------------------
		 If you want to do something special the first time a player ever logs
		 into your game, you can do so by putting code in the FirstTimePlayer
		 class, FirstTimePlayer() proc. This is only the first time EVER that
		 they login...it is not called everytime they login.

		 You can use this to charge the player, or get their email address,
		 or give them special help or whatever.

		 If you don't want to use this, then don't do anything.  By default,
		 nothing will happen.  This is ONLY called the very first time a
		 player logs in, so it's not useful for things that check everytime
		 the player logs in.
		*/
		return 1


/*
 If you don't want a mob to be saved, set
 mob/base_save_allowed to 0.
*/
mob/base_save_allowed = 1


/*
 If you don't want the mob's location to be saved and restored,
 set mob/base_save_location to 0.
*/
mob/base_save_location = 1


mob/base_InitFromSavefile()
	/*
	 Initializing from savefile
	 --------------------------
	 Sometimes you have special checks you need to do or things you need
	 to add when a character is read in from the savefile.  If so,
	 you can do them in this mob function:

	 By default nothing happens.  This is just here in case you need it.
	*/
	return



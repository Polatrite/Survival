/*
   Example of creating a character using the html form library, and saving it
   using the CharacterHandling library.

   This demo saves the player and their last location on the map.

   The library is a part of BaseCamp, Deadron's game infrastructure system.

   Full documentation for the library can be found by looking at the
   characterhandling.dm file.

   If you have questions or suggestions, please email ron@deadron.com.

   BaseCamp: From here you can reach Everest!
*/
#include <deadron/characterhandling>
#include <dantom/htmllib>


/*
   How many characters is a player allowed to have?
   Change this to whatever number you want for your game.
*/
client/base_num_characters_allowed = 3


/*
   Turning off automatic features
   ------------------------------
   By default, the CharacterHandling library automatically loads and saves characters
   for you. There are settings that will turn off the automatic behavior if you wish.

   client/base_autoload_character = 0
   ----------------------------------
   This turns off auto-loading when a player logs in.
   Whenever you do want the player to load a character, call that player's
   client.base_ChooseCharacter() function.

   client/base_autosave_character = 0
   ----------------------------------
   This turns off auto-saving when a player logs out.
   If you turn off auto-saving or also want to save at other times, use
   the player's client.base_SaveMob() function, as shown in the save_me()
   verb below.

   client/base_autodelete_mob = 0
   ------------------------------
   This stops the library from deleting the player's mob after they log out.
   Without this, the mob will stay in the game until you delete it yourself.

   mob/base_save_location = 0
   ------------------------------
   This turns off the location saving, which means you will need to manually
   place the mob after it is read in from the savefile.

   Uncomment one or more of the following lines to turn off a feature.
*/
// client/base_autoload_character = 0
// client/base_autosave_character = 0
// client/base_autodelete_mob = 0
// mob/base_save_location = 0


/*
   Customizing the choosing menus
   ------------------------------
   If you'd like something that looks better than the default menus for
   choosing and deleting characters, you can override ChooseCharacterMenu()
   and DeleteCharacterMenu(). In each case the list of standard menu items
   is passed in, and you can choose to display them however you want; you
   then return the player's choice by calling ChooseCharacterResult() or
   DeleteCharacterResult(). In our case we'll make each menu item a link on
   an HTML page.

   You could also choose to add extra options to the menu here and respond
   to them. If you'd like even more control over the menus, then copy the
   ChooseCharacter() and DeleteCharacter() procs from the implementation.dm
   file and override them for your game. DON'T change them in the
   implementation.dm file, though, because your changes will be lost the next
   time the library is upgraded.
*/
mob/BaseCamp/ChoosingCharacter
	ChooseCharacterMenu(list/menu)
		// For each menu item, we'll create an HTML link in a table.
		// The Topic() proc gets called when a link is clicked.
		// The src setting tells it to call Topic() for this object.
		var/menu_rows = ""
		for (var/item in menu)
			menu_rows += {"<tr><td align="center"><a href="?menu=choosing_character;choice=[item];src=\ref[src]">\[[item]]</a></td></tr>"}

		var/page = {"
		<body bgcolor=olive scroll=no>
		<center>
		<h2><font color="blue">Welcome to a whole new world!</font></h2>
		<b><i>Choose a character</i></b><br><br>
		<table border=1 cellpadding=3>
			[menu_rows]
		</table>
		</center>
		"}

		// Send them the page.
		src << browse(page, "window=CharacterMenu;titlebar=0;can_close=0;can_minimize=0;size=600x400")

	DeleteCharacterMenu(list/menu)
		var/menu_rows = ""
		for (var/item in menu)
			menu_rows += {"<tr><td align="center"><a href="?menu=deleting_character;choice=[item];src=\ref[src]">\[[item]]</a></td></tr>"}

		var/page = {"
		<body bgcolor=olive scroll=no>
		<center>
		<h2><font color="blue">Deleting character!</font></h2>
		<b><i>Choose who to rub out</i></b><br><br>
		<table border=1 cellpadding=3>
			[menu_rows]
		</table>
		</center>
		"}

		// Send them the page.
		src << browse(page, "window=CharacterMenu;titlebar=0;can_close=0;can_minimize=0;size=600x400")


	Topic(href, href_list[])
		// This is called when the user clicks on a link from the HTML page.
		// We need to let the library know which choice was made.
		var/menu = href_list["menu"]
		switch(menu)
			if ("choosing_character")
				// Close the menu window.
				src << browse(null, "window=CharacterMenu")

				var/choice = href_list["choice"]
				ChooseCharacterResult(choice)
				return

			if ("deleting_character")
				// Close the menu window.
				src << browse(null, "window=CharacterMenu")

				var/choice = href_list["choice"]
				DeleteCharacterResult(choice)
				return

		// If we got this far, this didn't come from one of our links, so let superclass handle.
		return ..()

/*
   Specifying the mob type
   -----------------------
   When a new character needs to be created, the CharacterHandling library
   creates a mob of type world.mob and logs the player into it.

   You can choose any mob type and anything you want with this mob.

   This example sets the default mob to /mob/creating_character.
   When the player is logged into the creating_character class, they are
   sent an HTML form to fill out for their character. When they are done, their
   character is created.

   To make sure that the player can't interact with the rest of the game while
   filling out this form, the /mob/creating_character removes any verbs it has
   and overrides Stat() to keep statpanels from showing up.
*/
world/mob = /mob/creating_character

mob/creating_character
	base_save_allowed = 0	// If player quits before choosing, don't want to save this mob.

	var
		Form/NewCharacter/char_form = new()
		error_text = ""		// For error text if they fill out the form wrong.

	Login()
		// Spawn here to avoid problems with calling prompts during login.
		spawn()
			src.char_form.DisplayForm()

		// Don't want any verbs accessible.
		RemoveVerbs()
		return

	Stat()
		// No statpanels.
		return

	proc/RemoveVerbs()
		for (var/item in verbs)
			verbs -= item
		return

/*
   Character creation form
   -----------------------
   This is the form object that defines the web page where they set their
   character attributes.

   You tell the form object what kind of controls to use (radio buttons, popup menu,
   text area, etc) by adding specially named variables to the object. To see the complete
   list of possible controls, in the file tree on the left go to Lib/Dantom.htmllib and
   look at the documentation.
*/
Form/NewCharacter
	/*
	   The form_window variable provides the browse() options that the form will use.
	   We want the form to show up in its own window (not the built-in browser view).
	*/
	form_window = "window=NewCharacter;titlebar=0;can_close=0;can_minimize=0;size=600x400"

	var
		name

		/*
		   To create radio buttons for a variable, specify the radio button options
		   by creating variables named variablename_1, variablename_2, etc.
		*/
		gender
		gender_1 = "Male"
		gender_2 = "Female"

		/*
		   To create a popup menu they can choose from, put the options in a list
		   called variablename_values.
		*/
		class
		class_values = list("Cop", "Nurse")

	Initialize()
		/*
		   This sets the initial values for the form each time before it is displayed.
		   The browse_rsc() calls sends an image to the player that is used
		   in the web page.
		*/
		if (!name)	 name = usr.key
		if (!gender) gender = "Male"
		if (!class)	 class = "Cop"
		usr << browse_rsc('face.png', "face.png")

	HtmlLayout()
		/*
		   You control the appearance of the form here.

		   We have added an error_text variable to the creating character mob, so we
		   can display an error if the form wasn't filled out correctly and needs to
		   be redisplayed with a message.  The error_text variable can't be part of
		   the form object, because then the form tries to let the player edit it.

		   When you embed a variable such as [name], the html library automatically
		   puts in the HTML for the text field or radio button or whatever is needed.
		   In the case of radio buttons, you place the numbered variables where each
		   should be displayed.

		   The [submit] variable puts in the necessary submit button at that spot.
		   You can also place a [reset] button if you want.

		   There is an image here, which was sent to the player in Initialize()
		   to put it on their system so it would show up on the page.

		   This example puts everything in table to make layout control easier.
		   Some of the table rows are blank to provide extra space between options.
		   You can change the HTML in any way you like for your game.
		*/
		var/mob/creating_character/player = usr

		var/page = {"<body bgcolor=olive>
		<center><img src="face.png"></center>
		<font color=red><b>[player.error_text]</b></font><br>
		<table>
		  <tr><td><b>Name:</b></td><td>[name]</td></tr>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  <tr><td><b>Gender:</b></td>
		      <td>
		      [gender_1] Male<br>
		      [gender_2] Female
		      </td>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  <tr><td><b>Class:</b></td><td>[class]</td>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  <tr><td>&nbsp;</td><td>[submit]</td></tr>
		</table>
		"}
		return page

	ProcessForm()
		/*
		   This is called when the player submits the form.
		   Make sure everything is valid; if not, send them back to the
		   form with an error message.

		   If everything is okay, create their character and log them
		   into it, then blank out the web page.

		   This checks the ckey() version of the name they chose, to make
		   sure it has actual letters and isn't just punctuation.
		*/
		var/mob/creating_character/player = usr

		var/ckey_name = ckey(name)
		if (!ckey_name || ckey_name == "")
			player.error_text = "Your name must have alpha-numeric characters in it!"
			DisplayForm()
			return

		// Everything is okay, so create the new mob based on the class they chose.
		var/mob/new_mob
		switch(class)
			if ("Cop")		new_mob = new /mob/cop()
			if ("Nurse")	new_mob = new /mob/nurse()

		// Set the new mob's attributes.
		new_mob.name = name
		switch(gender)
			if ("Male")		new_mob.gender = MALE
			if ("Female")	new_mob.gender = FEMALE

		// Log their client into the new mob.
		usr.client.mob = new_mob

		// And finally, blank out their web page since they don't need it now.
		new_mob << browse(null, "window=NewCharacter")
		return


mob
	Login()
		..()

		// This is just here for this sample, to make it clear which mob you've logged into.
		sample_report()


	verb
		save_me()
			// This demonstrates how to manually save the mob whenever you want.
			src.client.base_SaveMob()
			src << "\red You have been saved."

	proc
		sample_report()
			src << "<BR><BR>"
			src << "\blue You are a [gender] [name]."
			src << "\blue Your class is [type]."

mob/cop
	icon = 'keystone.dmi'

mob/nurse
	icon = 'nurse.dmi'

turf
	icon = 'floorgreen.dmi'

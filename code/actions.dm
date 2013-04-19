/* Action Control by Polatrite -- 1.4
   http://developer.byond.com/hub/Polatrite/ActionControl

   The scoop:
   This is the one-stop library to control actions. An action, in this context, is any
   proceedure that needs to control time-delayed proceedures with a variable. An example
   would be the game Proelium by SilkWizard. Actions are used in that game when firing
   a rocket, recharging mana, spawning a wolf, and many other tasks. When a player is
   performing an action, they can't do any other "actions" at the same time. This is
   an excellent addition to any game featuring real-time attacking proceedures and things
   of that nature, as you can make sure a player with a fast connection isn't getting 10
   hits a second, where a player with a slow connection may only get 2.

   How it works:
   The library creates an atom/movable/action, which is essentially an object stored
   on whatever player executes the action. As long as an action is stored on a player,
   they are considered to be "performing an action." The library also stores important
   variables on the action itself. The action will typically have an icon and a name.
   The time remaining on executing an action is saved as the action.suffix. This
   time is in seconds remaining.

   How to apply it in your own code:
   You can use this in your own code, by checking if(player.action), and if it
   returns 1 (true) then you know a player is performing an action. You are expected
   to edit all necessary code to include the action functions and checks.

   As you can see in the dynamic weapon, it's easy to pick a base object and pass it's
   variables as the action variables. In the Hood will display an icon matching the
   object you're using. Syntax can be found in the proceedures itself. Also, an optional
   action saving function is included. If you want a player to be able to logout, then
   log back in and resume the same function, you need to set...

mob
	pac_save_actions = 1

   At some place in your own code. There is a slight caveat with this saving method,
   wherein if the running atom gets deleted during the time the player is logged out,
   then the proceedure will stop completely. An example of this would be a lumberjacking
   verb. Say the player begins to lumberjack a tree, but needs to logoff before it can
   finish. If the tree is completely cut down when he logs back in, his action will not
   execute at all. The code will pretend it was never saved. But what if the running
   object was not deleted, but moved instead? You will need to add your own checks to
   make sure the action is still valid on login. (After all, you should only be able
   to lumberjack in view(1), right? Not halfway across the world.)

   My action isn't saving, why is this?
   You need to provide your own saving code, and it needs to save the variable
   "pac_save_actions."

   Why should I use this?
   This library provides a bulletproof action control system. If you implement the
   checks properly, it will work properly. Where some spawn and sleeping systems
   typically have trouble with reliability (every once in a while they may fail),
   this library does not. Plus, it gives a valid count-down of time remaining,
   and gives options for icon and icon_state, so you can overlay or display the
   action in the statpanel with no advanced code. Just a simple stat(action).

   Here are a few examples from my game, In the Hood.
Using a close range weapon:
		src.action = new(src.contents)
		src.action.Setup("Attacking...", 'sword.dmi', "slash")
		src.action.Run(src, src, PAC_SELF, "", 2)
Using a dynamic close range weapon:
		src.action = new(src.contents)
		src.action.Setup("Attacking...", O.icon, O.icon_state)
		src.action.Run(src, src, PAC_SELF, "", O.time)

   Where do I go if I have problems?
   You can contact me, Polatrite, via the BYOND pager. Preferribly, however, send
   an e-mail to polatrite_byond@hotmail.com.

   Do I have to donate a book of credits to use this library?
   While a mention of my name and a reference to this library would be nice, it's
   not required. Include me in your credits at your discretion.

   What are the usage limitations on this library?
   Use it. Modify it. Post it on the hub. The only thing you're not allowed to do
   is charge money for it. (Or any modifications of it.) This is a free library.

   Will you improve this with later versions?
   Yes. More documentation will be added, any bugs will be fixed, and possibly
   feature requests to be implemented. */



#define PAC_SELF 1
#define PAC_OTHER 2

atom/movable/action
	var/tmp
		atom/runatom
		atom/actatom
		acttype
		actexec
		delay
		argList
	proc
		Run(running_atom, mob/game/acting_atom, action_type, newdelay, action_to_execute)
			// running_atom - the atom that the action is being executed ON, like a tree, plant,
			//                or weapon.
			// acting_atom - the atom that is executing the action, typically the player's mob.
			// action_to_execute - the library is setup to run the delay, then execute.
			//                     [action_to_execute]_finish when it is done. If the proc
			//                     doesn't exist, it won't be executed.
			// delay - the delay of the delay that the proc should be executed, this works
			//         the same as the spawn or sleep commands.
			// additional arguments - various arguments you can use to save data about the action. Useful
			//                        if you are incorporating the save feature and need more information
			//                        about the action to be saved.
			runatom = running_atom
			actatom = acting_atom
			acttype = action_type
			actexec = action_to_execute
			delay = newdelay
			var/obj/system/action_gfx/acted/acted
			var/obj/system/action_gfx/acting/acting
			if(runatom != actatom)
				if(isturf(runatom) || isarea(runatom))
					acted = new(runatom)
					acted.Delay(delay)
				else if(istype(runatom, /atom) && runatom.loc)
					acted = new(runatom.loc)
					acted.Delay(delay)
			acting = new(actatom.loc)
			acting.Delay(delay)
			var/list/a = args.Copy()
			a.Cut(3, 6)
			argList = a
			while(delay < 0)
				sleep(1)
			while(delay > 0)
				if(!acting_atom)
					break
				if(!acting_atom.action)
					break
				suffix = "[delay]"
				delay -= 1
				sleep(1)
			if(actexec)
				call(actexec)(arglist(argList))
			//world.log << "[world.timeofday] - [usr] finish [name] --"
			del acted
			del acting
			del src

		Setup(pname, picon, picon_state)
			// pname - sets the action name
			// picon - sets the action icon
			// picon_state - sets the action icon state
			//world.log << "[world.timeofday] - [usr] using  [pname] ++"
			name = pname
			icon = picon
			icon_state = picon_state

mob
	var
		tmp/atom/movable/action/action
		pac_save_actions = 0

/*	Login()
		if(pac_save_actions)
			if(action)
				if(action.suffix && action.runatom && action.acttype && action.actexec)
					action.Run(action.runatom, action.actatom, action.acttype, action.actexec, \
					text2num(action.suffix), action.arg1, action.arg2, action.arg3, action.arg4, \
					action.arg5, action.arg6)
		return ..()*/


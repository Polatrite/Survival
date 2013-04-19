client
	verb
		tabnext() // Left here to prevent client-side errors.  See /mob/game/verb/tabnext
			set name = ".tabnext"
			set hidden = 1

		tabclose()
			if(!istype(mob, /mob/game))
				return
			var/current_tab = winget(src, "mainPane.chatTabs", "current-tab")
			mob:closeptab(current_tab)

		tabprevious() // Same.
			set name = ".tabprevious"
			set hidden = 1

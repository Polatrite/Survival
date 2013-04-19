obj
	game
		item


/*				drop()
					set src in usr
					if(!istype(usr, /mob/game)) return
					if(!Validate(src, usr.contents))
						return
					if(!usr:action)
						usr:v_drop(src, src.loc)

				get()
					set src in usr.loc
					if(!istype(usr, /mob/game)) return
					if(!Validate(src, adj(usr)))
						return
					if(!usr:action)
						usr:v_get(src)*/


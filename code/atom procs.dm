atom
	proc
		Bumped()

		Timer()

		Clone()
			var/atom/O = src
			var/atom/new_O = new O.type(O.loc)
			for(var/V in O.vars)
				if(issaved(O.vars[V]))
					new_O.vars[V] = O.vars[V]
			return new_O

	movable
		Bump(atom/M)
			M.Bumped(src)

		proc

			Transfer(newloc)
				var/turf/oldloc = loc	// remember for range calculations
				// list turfs in view and luminosity range of old loc
				var/list/oldview
				if(isturf(loc))
					oldview = view(luminosity,loc)
				else
					oldview = list()
				loc = newloc
				if(luminosity>0)	// if the atom moved and is luminous
					if(istype(oldloc))
						sd_StripLum(oldview,oldloc)
						oldloc.sd_lumcount++	// correct "off by 1" error in oldloc
					sd_ApplyLum()

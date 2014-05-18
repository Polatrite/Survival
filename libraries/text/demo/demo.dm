
mob
	Login()

		world << int("10", 16)
		world << int("ff", 16)
		world << int("123", 10) + 1
		world << ""

		world << replace("hello, world!", "world", "BYOND")
		world << ""

		var/list/l = split("a|b|c|d", "|")

		world << l
		for(var/a in l)
			world << " * [a]"
		world << ""

		world << merge(l, ", ")
		world << ""

		world << prefix("testing", "tes")
		world << prefix("testing", "testig")
		world << ending("testing", "ing")
		world << ending("testing", "testig")
		world << ""

		world << dir2txt(NORTH)
		world << dir2txt(EAST)
		world << dir2txt(NORTHEAST)
		world << dir2txt(NORTH+SOUTH+WEST)

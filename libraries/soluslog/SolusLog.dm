world
	New()
		world.log = file("logs/[time2text(world.realtime,"MM-DD-YY-hh.mm")].txt")
		..()
		slog_loop()

	proc
		slog_loop()
			spawn while(1)
				sleep(36000)
				world.log = file("logs/[time2text(world.realtime,"YYYY-MM-DD-hh.mm")].txt")

proc
	slog_timestamp()
		return time2text(world.timeofday, "hh:mm:ss")

	slog_lenstring(mob/string, val)
		if(!val)
			val = 44
		var/new_string = string
		new_string = "[slog_timestamp()] ([string.x],[string.y],[string.z]) [new_string]                                                               "
		new_string = copytext(new_string, 1, val)
		return new_string

var
	rain_creep_pause = 4

	inventory_close_button
	dmifont/ComicSansMS7pt_AA16/textfont = new
	dmifont/ComicSansMSItalic7pt_AA16/itfont = new
	dmifont/Arial7pt/namefont = new
	dmifont/BitstreamVeraSansBold36pt_AA16/hugefont = new


	tiles_grass = 0
	tiles_dirt = 0
	tiles_cavern = 0
	tiles_desert = 0
	tiles_water = 0

	tiles_grass_list[] = list()
	tiles_grass_fert_list[] = list()
	tiles_dirt_list[] = list()
	tiles_cavern_list[] = list()
	tiles_desert_list[] = list()

	fish_types[] = list()

	regenloop_cycle = 0


	daytime = 0


	weather_type
	weather_counter = 0
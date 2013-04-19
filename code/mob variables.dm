mob
	layer = LAYER_MOB

mob/ghost
	invisibility = 5
	density = 0
	action = 1
	sight = SEE_SELF|SEE_TURFS|SEE_PIXELS

mob/game
	luminosity = 4
	//see_in_dark = 4

	icon = 'MyIcon.dmi'
	icon_state = "white male"
	mouse_opacity = 1

	var
		time_created
		time_online = 0
		time_active = 0
		tmp
			version = 0
			time_online_session = 0
			time_active_session = 0
			layer_base = LAYER_MOB
			pixel_y_tree = 0
			x_loc = 0
			y_loc = 0

		maxhp
		hp
		stamina
		maxstamina
		toughness

		attack = 30
		attackspeed = 20
		attackdelay
		defense = 0

		exptotal

		fullness
		maxfullness = 30
		hunger
		thirst
		hp_regen
		stamina_regen

		aura_temp
		body_temp

		weight_held
		weight_max

		equipment[30]

		fighting = 0
		murderer = 0
		tmp/attacker = 0

		pkills
		pdeaths
		kills
		deaths

		recent_kills[]
		current_fight[]

		pknewbie = 7200

		guilds[]

		kill_log

		plots

		debug[]

		icon_red = 255
		icon_green = 255
		icon_blue = 255

		volume = 60

		stealth
		stealth_prev_loc

		admin = 0

		tmp
			account/account

			expsession = 0
			exp_per_hour = 0

			sound/current_song
			sound/previous_song
			current_song_duration = 0

			mob/game/target
			target_marker

			mob/game/hit_target
			hit_target_marker

			obj/system/hp_bar/hp_bar
			old_icon
			old_icon_state
			old_overlays
			head_overlay
			movable = 1
			moving = 0
			move_delay = 3
			move_force = 0
			elevated = 0

		error_message = "<B><font color = \"blue\">That command doesn't exist!"


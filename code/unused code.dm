/*********************************************************************/
/*                         Speed throttle movement                   */
/*********************************************************************/
			MovementLoop()
				spawn(max(1, 32 - speed + 1)) // 32 pixels per tile, 1 pixel of buffer
					MovementLoop()

				speed = min(32, speed + speed_gen)
				if(speed <= 1)
					pixel_step_size = 1
				else if(speed <= 16)
					pixel_step_size = 2
				else if(speed <= 22)
					pixel_step_size = 3
				else
					pixel_step_size = 0



/*********************************************************************/
/*                         CACHED MOVEMENT                           */
/*********************************************************************/
	Move(O,I)
		if(moving <= 0)
			if(..())
				moving = 1
				spawn(move_delay)
					moving = 0
	/*				if(moves_to_do)
						if(moves_to_do.len >= 1)
							step(src,moves_to_do[1])
							moves_to_do.Cut(1,2)
			else
				if(moves_to_do)
					if(moves_to_do.len >= 1)
						moves_to_do.Cut(1,2)
						return*/
		else
	//		moves_to_do += list(I)
			return

		setrain()
			var/weldel
			for(var/turf/T in x1)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x2)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x3)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x4)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x5)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x6)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x7)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x8)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x9)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x10)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x11)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x12)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x13)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x14)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x15)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x16)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x17)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x18)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x19)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x20)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x21)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x22)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x23)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
/*			for(var/turf/T in x24)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x25)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x26)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x27)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x28)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x29)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x30)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x31)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x32)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x33)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x34)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x35)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x36)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x37)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x38)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x39)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x40)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x41)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x42)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x43)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x44)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x45)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x46)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x47)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x48)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x49)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x50)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x51)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x52)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x53)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x54)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x55)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x56)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x57)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x58)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x59)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x60)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x61)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x62)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x63)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x64)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x65)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x66)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x67)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x68)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x69)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x70)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x71)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x72)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x73)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x74)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x75)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x76)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x77)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x78)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x79)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x80)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x81)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x82)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x83)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x84)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x85)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x86)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x87)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x88)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x89)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x90)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x91)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x92)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x93)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x94)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x95)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x96)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x97)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x98)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x99)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x100)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x101)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x102)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x103)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x104)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x105)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x106)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x107)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x108)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x109)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x110)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x111)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x112)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x113)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x114)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x115)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x116)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x117)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x118)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x119)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x120)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x121)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x122)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x123)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x124)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x125)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x126)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x127)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x128)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x129)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x130)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x131)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x132)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x133)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x134)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x135)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x136)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x137)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x138)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x139)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x140)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x141)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x142)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x143)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x144)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x145)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x146)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x147)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x148)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x149)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x150)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x151)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x152)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x153)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x154)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x155)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x156)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x157)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x158)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x159)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x160)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x161)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x162)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x163)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x164)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x165)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x166)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x167)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x168)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x169)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x170)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x171)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x172)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x173)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x174)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x175)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x176)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x177)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x178)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x179)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x180)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x181)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x182)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x183)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x184)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x185)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x186)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x187)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x188)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x189)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x190)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x191)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x192)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x193)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x194)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x195)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x196)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x197)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x198)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x199)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x200)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x201)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x202)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x203)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x204)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x205)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x206)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x207)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x208)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x209)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x210)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x211)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x212)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x213)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x214)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x215)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x216)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x217)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x218)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x219)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x220)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x221)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x222)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x223)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x224)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x225)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x226)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x227)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x228)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x229)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x230)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x231)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x232)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x233)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x234)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x235)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x236)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x237)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x238)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x239)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x240)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x241)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x242)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x243)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x244)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x245)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x246)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x247)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x248)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x249)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x250)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x251)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x252)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x253)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x254)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x255)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x256)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x257)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x258)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x259)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x260)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x261)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x262)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x263)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x264)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x265)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x266)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x267)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x268)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x269)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x270)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x271)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x272)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x273)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x274)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x275)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x276)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x277)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x278)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x279)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x280)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x281)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x282)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x283)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x284)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x285)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x286)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x287)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x288)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x289)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x290)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x291)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x292)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x293)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x294)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x295)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x296)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x297)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x298)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x299)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x300)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x301)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x302)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x303)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x304)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x305)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x306)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x307)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x308)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x309)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x310)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x311)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x312)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x313)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x314)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x315)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x316)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x317)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x318)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x319)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x320)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x321)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x322)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x323)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x324)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x325)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x326)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x327)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x328)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x329)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x330)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x331)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x332)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x333)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x334)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x335)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x336)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x337)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x338)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x339)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x340)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x341)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x342)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x343)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x344)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x345)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x346)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x347)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x348)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x349)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x350)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x351)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x352)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x353)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x354)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x355)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x356)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x357)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x358)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x359)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x360)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x361)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x362)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x363)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x364)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x365)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x366)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x367)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x368)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x369)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x370)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x371)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x372)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x373)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x374)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x375)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x376)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x377)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x378)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x379)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x380)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x381)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x382)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x383)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x384)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x385)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x386)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x387)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x388)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x389)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x390)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x391)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x392)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x393)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x394)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x395)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x396)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x397)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x398)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x399)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x400)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x401)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x402)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x403)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x404)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x405)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x406)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x407)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x408)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x409)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x410)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x411)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x412)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x413)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x414)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x415)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x416)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x417)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x418)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x419)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x420)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x421)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x422)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x423)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x424)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x425)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x426)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x427)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x428)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x429)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x430)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x431)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x432)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x433)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x434)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x435)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x436)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x437)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x438)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x439)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x440)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x441)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x442)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x443)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x444)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x445)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x446)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x447)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x448)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x449)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x450)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x451)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x452)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x453)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x454)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x455)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x456)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x457)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x458)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x459)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x460)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x461)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x462)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x463)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x464)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x465)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x466)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x467)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x468)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x469)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x470)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x471)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x472)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x473)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x474)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x475)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x476)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x477)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x478)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x479)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x480)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x481)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x482)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x483)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x484)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x485)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x486)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x487)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x488)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x489)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x490)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x491)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x492)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x493)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x494)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x495)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x496)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x497)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x498)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x499)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)
			for(var/turf/T in x500)
				if(T.z == 1)
					if(T.weather)
						T.overlays -= T.weather
						weldel = T.weather
					var/obj/system/weather/W = new/obj/system/weather/rain()
					T.overlays += W
					T.weather = W
			sleep(rain_creep_pause)*/
			del(weldel)



world
	New()
		..()
		spawn()
			CropLoop()
		sleep(10)
		for(var/turf/T in world)
			if(T.x == 1)
				x1 += T
			if(T.x == 2)
				x2 += T
			if(T.x == 3)
				x3 += T
			if(T.x == 4)
				x4 += T
			if(T.x == 5)
				x5 += T
			if(T.x == 6)
				x6 += T
			if(T.x == 7)
				x7 += T
			if(T.x == 8)
				x8 += T
			if(T.x == 9)
				x9 += T
			if(T.x == 10)
				x10 += T
			if(T.x == 11)
				x11 += T
			if(T.x == 12)
				x12 += T
			if(T.x == 13)
				x13 += T
			if(T.x == 14)
				x14 += T
			if(T.x == 15)
				x15 += T
			if(T.x == 16)
				x16 += T
			if(T.x == 17)
				x17 += T
			if(T.x == 18)
				x18 += T
			if(T.x == 19)
				x19 += T
			if(T.x == 20)
				x20 += T
			if(T.x == 21)
				x21 += T
			if(T.x == 22)
				x22 += T
			if(T.x == 23)
				x23 += T
			if(T.x == 24)
				x24 += T
			if(T.x == 25)
				x25 += T
			if(T.x == 26)
				x26 += T
			if(T.x == 27)
				x27 += T
			if(T.x == 28)
				x28 += T
			if(T.x == 29)
				x29 += T
			if(T.x == 30)
				x30 += T
			if(T.x == 31)
				x31 += T
			if(T.x == 32)
				x32 += T
			if(T.x == 33)
				x33 += T
			if(T.x == 34)
				x34 += T
			if(T.x == 35)
				x35 += T
			if(T.x == 36)
				x36 += T
			if(T.x == 37)
				x37 += T
			if(T.x == 38)
				x38 += T
			if(T.x == 39)
				x39 += T
			if(T.x == 40)
				x40 += T
			if(T.x == 41)
				x41 += T
			if(T.x == 42)
				x42 += T
			if(T.x == 43)
				x43 += T
			if(T.x == 44)
				x44 += T
			if(T.x == 45)
				x45 += T
			if(T.x == 46)
				x46 += T
			if(T.x == 47)
				x47 += T
			if(T.x == 48)
				x48 += T
			if(T.x == 49)
				x49 += T
			if(T.x == 50)
				x50 += T
			if(T.x == 51)
				x51 += T
			if(T.x == 52)
				x52 += T
			if(T.x == 53)
				x53 += T
			if(T.x == 54)
				x54 += T
			if(T.x == 55)
				x55 += T
			if(T.x == 56)
				x56 += T
			if(T.x == 57)
				x57 += T
			if(T.x == 58)
				x58 += T
			if(T.x == 59)
				x59 += T
			if(T.x == 60)
				x60 += T
			if(T.x == 61)
				x61 += T
			if(T.x == 62)
				x62 += T
			if(T.x == 63)
				x63 += T
			if(T.x == 64)
				x64 += T
			if(T.x == 65)
				x65 += T
			if(T.x == 66)
				x66 += T
			if(T.x == 67)
				x67 += T
			if(T.x == 68)
				x68 += T
			if(T.x == 69)
				x69 += T
			if(T.x == 70)
				x70 += T
			if(T.x == 71)
				x71 += T
			if(T.x == 72)
				x72 += T
			if(T.x == 73)
				x73 += T
			if(T.x == 74)
				x74 += T
			if(T.x == 75)
				x75 += T
			if(T.x == 76)
				x76 += T
			if(T.x == 77)
				x77 += T
			if(T.x == 78)
				x78 += T
			if(T.x == 79)
				x79 += T
			if(T.x == 80)
				x80 += T
			if(T.x == 81)
				x81 += T
			if(T.x == 82)
				x82 += T
			if(T.x == 83)
				x83 += T
			if(T.x == 84)
				x84 += T
			if(T.x == 85)
				x85 += T
			if(T.x == 86)
				x86 += T
			if(T.x == 87)
				x87 += T
			if(T.x == 88)
				x88 += T
			if(T.x == 89)
				x89 += T
			if(T.x == 90)
				x90 += T
			if(T.x == 91)
				x91 += T
			if(T.x == 92)
				x92 += T
			if(T.x == 93)
				x93 += T
			if(T.x == 94)
				x94 += T
			if(T.x == 95)
				x95 += T
			if(T.x == 96)
				x96 += T
			if(T.x == 97)
				x97 += T
			if(T.x == 98)
				x98 += T
			if(T.x == 99)
				x99 += T
			if(T.x == 100)
				x100 += T
			if(T.x == 101)
				x101 += T
			if(T.x == 102)
				x102 += T
			if(T.x == 103)
				x103 += T
			if(T.x == 104)
				x104 += T
			if(T.x == 105)
				x105 += T
			if(T.x == 106)
				x106 += T
			if(T.x == 107)
				x107 += T
			if(T.x == 108)
				x108 += T
			if(T.x == 109)
				x109 += T
			if(T.x == 110)
				x110 += T
			if(T.x == 111)
				x111 += T
			if(T.x == 112)
				x112 += T
			if(T.x == 113)
				x113 += T
			if(T.x == 114)
				x114 += T
			if(T.x == 115)
				x115 += T
			if(T.x == 116)
				x116 += T
			if(T.x == 117)
				x117 += T
			if(T.x == 118)
				x118 += T
			if(T.x == 119)
				x119 += T
			if(T.x == 120)
				x120 += T
			if(T.x == 121)
				x121 += T
			if(T.x == 122)
				x122 += T
			if(T.x == 123)
				x123 += T
			if(T.x == 124)
				x124 += T
			if(T.x == 125)
				x125 += T
			if(T.x == 126)
				x126 += T
			if(T.x == 127)
				x127 += T
			if(T.x == 128)
				x128 += T
			if(T.x == 129)
				x129 += T
			if(T.x == 130)
				x130 += T
			if(T.x == 131)
				x131 += T
			if(T.x == 132)
				x132 += T
			if(T.x == 133)
				x133 += T
			if(T.x == 134)
				x134 += T
			if(T.x == 135)
				x135 += T
			if(T.x == 136)
				x136 += T
			if(T.x == 137)
				x137 += T
			if(T.x == 138)
				x138 += T
			if(T.x == 139)
				x139 += T
			if(T.x == 140)
				x140 += T
			if(T.x == 141)
				x141 += T
			if(T.x == 142)
				x142 += T
			if(T.x == 143)
				x143 += T
			if(T.x == 144)
				x144 += T
			if(T.x == 145)
				x145 += T
			if(T.x == 146)
				x146 += T
			if(T.x == 147)
				x147 += T
			if(T.x == 148)
				x148 += T
			if(T.x == 149)
				x149 += T
			if(T.x == 150)
				x150 += T
			if(T.x == 151)
				x151 += T
			if(T.x == 152)
				x152 += T
			if(T.x == 153)
				x153 += T
			if(T.x == 154)
				x154 += T
			if(T.x == 155)
				x155 += T
			if(T.x == 156)
				x156 += T
			if(T.x == 157)
				x157 += T
			if(T.x == 158)
				x158 += T
			if(T.x == 159)
				x159 += T
			if(T.x == 160)
				x160 += T
			if(T.x == 161)
				x161 += T
			if(T.x == 162)
				x162 += T
			if(T.x == 163)
				x163 += T
			if(T.x == 164)
				x164 += T
			if(T.x == 165)
				x165 += T
			if(T.x == 166)
				x166 += T
			if(T.x == 167)
				x167 += T
			if(T.x == 168)
				x168 += T
			if(T.x == 169)
				x169 += T
			if(T.x == 170)
				x170 += T
			if(T.x == 171)
				x171 += T
			if(T.x == 172)
				x172 += T
			if(T.x == 173)
				x173 += T
			if(T.x == 174)
				x174 += T
			if(T.x == 175)
				x175 += T
			if(T.x == 176)
				x176 += T
			if(T.x == 177)
				x177 += T
			if(T.x == 178)
				x178 += T
			if(T.x == 179)
				x179 += T
			if(T.x == 180)
				x180 += T
			if(T.x == 181)
				x181 += T
			if(T.x == 182)
				x182 += T
			if(T.x == 183)
				x183 += T
			if(T.x == 184)
				x184 += T
			if(T.x == 185)
				x185 += T
			if(T.x == 186)
				x186 += T
			if(T.x == 187)
				x187 += T
			if(T.x == 188)
				x188 += T
			if(T.x == 189)
				x189 += T
			if(T.x == 190)
				x190 += T
			if(T.x == 191)
				x191 += T
			if(T.x == 192)
				x192 += T
			if(T.x == 193)
				x193 += T
			if(T.x == 194)
				x194 += T
			if(T.x == 195)
				x195 += T
			if(T.x == 196)
				x196 += T
			if(T.x == 197)
				x197 += T
			if(T.x == 198)
				x198 += T
			if(T.x == 199)
				x199 += T
			if(T.x == 200)
				x200 += T
			if(T.x == 201)
				x201 += T
			if(T.x == 202)
				x202 += T
			if(T.x == 203)
				x203 += T
			if(T.x == 204)
				x204 += T
			if(T.x == 205)
				x205 += T
			if(T.x == 206)
				x206 += T
			if(T.x == 207)
				x207 += T
			if(T.x == 208)
				x208 += T
			if(T.x == 209)
				x209 += T
			if(T.x == 210)
				x210 += T
			if(T.x == 211)
				x211 += T
			if(T.x == 212)
				x212 += T
			if(T.x == 213)
				x213 += T
			if(T.x == 214)
				x214 += T
			if(T.x == 215)
				x215 += T
			if(T.x == 216)
				x216 += T
			if(T.x == 217)
				x217 += T
			if(T.x == 218)
				x218 += T
			if(T.x == 219)
				x219 += T
			if(T.x == 220)
				x220 += T
			if(T.x == 221)
				x221 += T
			if(T.x == 222)
				x222 += T
			if(T.x == 223)
				x223 += T
			if(T.x == 224)
				x224 += T
			if(T.x == 225)
				x225 += T
			if(T.x == 226)
				x226 += T
			if(T.x == 227)
				x227 += T
			if(T.x == 228)
				x228 += T
			if(T.x == 229)
				x229 += T
			if(T.x == 230)
				x230 += T
			if(T.x == 231)
				x231 += T
			if(T.x == 232)
				x232 += T
			if(T.x == 233)
				x233 += T
			if(T.x == 234)
				x234 += T
			if(T.x == 235)
				x235 += T
			if(T.x == 236)
				x236 += T
			if(T.x == 237)
				x237 += T
			if(T.x == 238)
				x238 += T
			if(T.x == 239)
				x239 += T
			if(T.x == 240)
				x240 += T
			if(T.x == 241)
				x241 += T
			if(T.x == 242)
				x242 += T
			if(T.x == 243)
				x243 += T
			if(T.x == 244)
				x244 += T
			if(T.x == 245)
				x245 += T
			if(T.x == 246)
				x246 += T
			if(T.x == 247)
				x247 += T
			if(T.x == 248)
				x248 += T
			if(T.x == 249)
				x249 += T
			if(T.x == 250)
				x250 += T
			if(T.x == 251)
				x251 += T
			if(T.x == 252)
				x252 += T
			if(T.x == 253)
				x253 += T
			if(T.x == 254)
				x254 += T
			if(T.x == 255)
				x255 += T
			if(T.x == 256)
				x256 += T
			if(T.x == 257)
				x257 += T
			if(T.x == 258)
				x258 += T
			if(T.x == 259)
				x259 += T
			if(T.x == 260)
				x260 += T
			if(T.x == 261)
				x261 += T
			if(T.x == 262)
				x262 += T
			if(T.x == 263)
				x263 += T
			if(T.x == 264)
				x264 += T
			if(T.x == 265)
				x265 += T
			if(T.x == 266)
				x266 += T
			if(T.x == 267)
				x267 += T
			if(T.x == 268)
				x268 += T
			if(T.x == 269)
				x269 += T
			if(T.x == 270)
				x270 += T
			if(T.x == 271)
				x271 += T
			if(T.x == 272)
				x272 += T
			if(T.x == 273)
				x273 += T
			if(T.x == 274)
				x274 += T
			if(T.x == 275)
				x275 += T
			if(T.x == 276)
				x276 += T
			if(T.x == 277)
				x277 += T
			if(T.x == 278)
				x278 += T
			if(T.x == 279)
				x279 += T
			if(T.x == 280)
				x280 += T
			if(T.x == 281)
				x281 += T
			if(T.x == 282)
				x282 += T
			if(T.x == 283)
				x283 += T
			if(T.x == 284)
				x284 += T
			if(T.x == 285)
				x285 += T
			if(T.x == 286)
				x286 += T
			if(T.x == 287)
				x287 += T
			if(T.x == 288)
				x288 += T
			if(T.x == 289)
				x289 += T
			if(T.x == 290)
				x290 += T
			if(T.x == 291)
				x291 += T
			if(T.x == 292)
				x292 += T
			if(T.x == 293)
				x293 += T
			if(T.x == 294)
				x294 += T
			if(T.x == 295)
				x295 += T
			if(T.x == 296)
				x296 += T
			if(T.x == 297)
				x297 += T
			if(T.x == 298)
				x298 += T
			if(T.x == 299)
				x299 += T
			if(T.x == 300)
				x300 += T
			if(T.x == 301)
				x301 += T
			if(T.x == 302)
				x302 += T
			if(T.x == 303)
				x303 += T
			if(T.x == 304)
				x304 += T
			if(T.x == 305)
				x305 += T
			if(T.x == 306)
				x306 += T
			if(T.x == 307)
				x307 += T
			if(T.x == 308)
				x308 += T
			if(T.x == 309)
				x309 += T
			if(T.x == 310)
				x310 += T
			if(T.x == 311)
				x311 += T
			if(T.x == 312)
				x312 += T
			if(T.x == 313)
				x313 += T
			if(T.x == 314)
				x314 += T
			if(T.x == 315)
				x315 += T
			if(T.x == 316)
				x316 += T
			if(T.x == 317)
				x317 += T
			if(T.x == 318)
				x318 += T
			if(T.x == 319)
				x319 += T
			if(T.x == 320)
				x320 += T
			if(T.x == 321)
				x321 += T
			if(T.x == 322)
				x322 += T
			if(T.x == 323)
				x323 += T
			if(T.x == 324)
				x324 += T
			if(T.x == 325)
				x325 += T
			if(T.x == 326)
				x326 += T
			if(T.x == 327)
				x327 += T
			if(T.x == 328)
				x328 += T
			if(T.x == 329)
				x329 += T
			if(T.x == 330)
				x330 += T
			if(T.x == 331)
				x331 += T
			if(T.x == 332)
				x332 += T
			if(T.x == 333)
				x333 += T
			if(T.x == 334)
				x334 += T
			if(T.x == 335)
				x335 += T
			if(T.x == 336)
				x336 += T
			if(T.x == 337)
				x337 += T
			if(T.x == 338)
				x338 += T
			if(T.x == 339)
				x339 += T
			if(T.x == 340)
				x340 += T
			if(T.x == 341)
				x341 += T
			if(T.x == 342)
				x342 += T
			if(T.x == 343)
				x343 += T
			if(T.x == 344)
				x344 += T
			if(T.x == 345)
				x345 += T
			if(T.x == 346)
				x346 += T
			if(T.x == 347)
				x347 += T
			if(T.x == 348)
				x348 += T
			if(T.x == 349)
				x349 += T
			if(T.x == 350)
				x350 += T
			if(T.x == 351)
				x351 += T
			if(T.x == 352)
				x352 += T
			if(T.x == 353)
				x353 += T
			if(T.x == 354)
				x354 += T
			if(T.x == 355)
				x355 += T
			if(T.x == 356)
				x356 += T
			if(T.x == 357)
				x357 += T
			if(T.x == 358)
				x358 += T
			if(T.x == 359)
				x359 += T
			if(T.x == 360)
				x360 += T
			if(T.x == 361)
				x361 += T
			if(T.x == 362)
				x362 += T
			if(T.x == 363)
				x363 += T
			if(T.x == 364)
				x364 += T
			if(T.x == 365)
				x365 += T
			if(T.x == 366)
				x366 += T
			if(T.x == 367)
				x367 += T
			if(T.x == 368)
				x368 += T
			if(T.x == 369)
				x369 += T
			if(T.x == 370)
				x370 += T
			if(T.x == 371)
				x371 += T
			if(T.x == 372)
				x372 += T
			if(T.x == 373)
				x373 += T
			if(T.x == 374)
				x374 += T
			if(T.x == 375)
				x375 += T
			if(T.x == 376)
				x376 += T
			if(T.x == 377)
				x377 += T
			if(T.x == 378)
				x378 += T
			if(T.x == 379)
				x379 += T
			if(T.x == 380)
				x380 += T
			if(T.x == 381)
				x381 += T
			if(T.x == 382)
				x382 += T
			if(T.x == 383)
				x383 += T
			if(T.x == 384)
				x384 += T
			if(T.x == 385)
				x385 += T
			if(T.x == 386)
				x386 += T
			if(T.x == 387)
				x387 += T
			if(T.x == 388)
				x388 += T
			if(T.x == 389)
				x389 += T
			if(T.x == 390)
				x390 += T
			if(T.x == 391)
				x391 += T
			if(T.x == 392)
				x392 += T
			if(T.x == 393)
				x393 += T
			if(T.x == 394)
				x394 += T
			if(T.x == 395)
				x395 += T
			if(T.x == 396)
				x396 += T
			if(T.x == 397)
				x397 += T
			if(T.x == 398)
				x398 += T
			if(T.x == 399)
				x399 += T
			if(T.x == 400)
				x400 += T
			if(T.x == 401)
				x401 += T
			if(T.x == 402)
				x402 += T
			if(T.x == 403)
				x403 += T
			if(T.x == 404)
				x404 += T
			if(T.x == 405)
				x405 += T
			if(T.x == 406)
				x406 += T
			if(T.x == 407)
				x407 += T
			if(T.x == 408)
				x408 += T
			if(T.x == 409)
				x409 += T
			if(T.x == 410)
				x410 += T
			if(T.x == 411)
				x411 += T
			if(T.x == 412)
				x412 += T
			if(T.x == 413)
				x413 += T
			if(T.x == 414)
				x414 += T
			if(T.x == 415)
				x415 += T
			if(T.x == 416)
				x416 += T
			if(T.x == 417)
				x417 += T
			if(T.x == 418)
				x418 += T
			if(T.x == 419)
				x419 += T
			if(T.x == 420)
				x420 += T
			if(T.x == 421)
				x421 += T
			if(T.x == 422)
				x422 += T
			if(T.x == 423)
				x423 += T
			if(T.x == 424)
				x424 += T
			if(T.x == 425)
				x425 += T
			if(T.x == 426)
				x426 += T
			if(T.x == 427)
				x427 += T
			if(T.x == 428)
				x428 += T
			if(T.x == 429)
				x429 += T
			if(T.x == 430)
				x430 += T
			if(T.x == 431)
				x431 += T
			if(T.x == 432)
				x432 += T
			if(T.x == 433)
				x433 += T
			if(T.x == 434)
				x434 += T
			if(T.x == 435)
				x435 += T
			if(T.x == 436)
				x436 += T
			if(T.x == 437)
				x437 += T
			if(T.x == 438)
				x438 += T
			if(T.x == 439)
				x439 += T
			if(T.x == 440)
				x440 += T
			if(T.x == 441)
				x441 += T
			if(T.x == 442)
				x442 += T
			if(T.x == 443)
				x443 += T
			if(T.x == 444)
				x444 += T
			if(T.x == 445)
				x445 += T
			if(T.x == 446)
				x446 += T
			if(T.x == 447)
				x447 += T
			if(T.x == 448)
				x448 += T
			if(T.x == 449)
				x449 += T
			if(T.x == 450)
				x450 += T
			if(T.x == 451)
				x451 += T
			if(T.x == 452)
				x452 += T
			if(T.x == 453)
				x453 += T
			if(T.x == 454)
				x454 += T
			if(T.x == 455)
				x455 += T
			if(T.x == 456)
				x456 += T
			if(T.x == 457)
				x457 += T
			if(T.x == 458)
				x458 += T
			if(T.x == 459)
				x459 += T
			if(T.x == 460)
				x460 += T
			if(T.x == 461)
				x461 += T
			if(T.x == 462)
				x462 += T
			if(T.x == 463)
				x463 += T
			if(T.x == 464)
				x464 += T
			if(T.x == 465)
				x465 += T
			if(T.x == 466)
				x466 += T
			if(T.x == 467)
				x467 += T
			if(T.x == 468)
				x468 += T
			if(T.x == 469)
				x469 += T
			if(T.x == 470)
				x470 += T
			if(T.x == 471)
				x471 += T
			if(T.x == 472)
				x472 += T
			if(T.x == 473)
				x473 += T
			if(T.x == 474)
				x474 += T
			if(T.x == 475)
				x475 += T
			if(T.x == 476)
				x476 += T
			if(T.x == 477)
				x477 += T
			if(T.x == 478)
				x478 += T
			if(T.x == 479)
				x479 += T
			if(T.x == 480)
				x480 += T
			if(T.x == 481)
				x481 += T
			if(T.x == 482)
				x482 += T
			if(T.x == 483)
				x483 += T
			if(T.x == 484)
				x484 += T
			if(T.x == 485)
				x485 += T
			if(T.x == 486)
				x486 += T
			if(T.x == 487)
				x487 += T
			if(T.x == 488)
				x488 += T
			if(T.x == 489)
				x489 += T
			if(T.x == 490)
				x490 += T
			if(T.x == 491)
				x491 += T
			if(T.x == 492)
				x492 += T
			if(T.x == 493)
				x493 += T
			if(T.x == 494)
				x494 += T
			if(T.x == 495)
				x495 += T
			if(T.x == 496)
				x496 += T
			if(T.x == 497)
				x497 += T
			if(T.x == 498)
				x498 += T
			if(T.x == 499)
				x499 += T
			if(T.x == 500)
				x500 += T
			if(prob(1))
				if(prob(1))
					sleep(1)


	x0[] = list()
	x1[] = list()
	x2[] = list()
	x3[] = list()
	x4[] = list()
	x5[] = list()
	x6[] = list()
	x7[] = list()
	x8[] = list()
	x9[] = list()
	x10[] = list()
	x11[] = list()
	x12[] = list()
	x13[] = list()
	x14[] = list()
	x15[] = list()
	x16[] = list()
	x17[] = list()
	x18[] = list()
	x19[] = list()
	x20[] = list()
	x21[] = list()
	x22[] = list()
	x23[] = list()
	x24[] = list()
	x25[] = list()
	x26[] = list()
	x27[] = list()
	x28[] = list()
	x29[] = list()
	x30[] = list()
	x31[] = list()
	x32[] = list()
	x33[] = list()
	x34[] = list()
	x35[] = list()
	x36[] = list()
	x37[] = list()
	x38[] = list()
	x39[] = list()
	x40[] = list()
	x41[] = list()
	x42[] = list()
	x43[] = list()
	x44[] = list()
	x45[] = list()
	x46[] = list()
	x47[] = list()
	x48[] = list()
	x49[] = list()
	x50[] = list()
	x51[] = list()
	x52[] = list()
	x53[] = list()
	x54[] = list()
	x55[] = list()
	x56[] = list()
	x57[] = list()
	x58[] = list()
	x59[] = list()
	x60[] = list()
	x61[] = list()
	x62[] = list()
	x63[] = list()
	x64[] = list()
	x65[] = list()
	x66[] = list()
	x67[] = list()
	x68[] = list()
	x69[] = list()
	x70[] = list()
	x71[] = list()
	x72[] = list()
	x73[] = list()
	x74[] = list()
	x75[] = list()
	x76[] = list()
	x77[] = list()
	x78[] = list()
	x79[] = list()
	x80[] = list()
	x81[] = list()
	x82[] = list()
	x83[] = list()
	x84[] = list()
	x85[] = list()
	x86[] = list()
	x87[] = list()
	x88[] = list()
	x89[] = list()
	x90[] = list()
	x91[] = list()
	x92[] = list()
	x93[] = list()
	x94[] = list()
	x95[] = list()
	x96[] = list()
	x97[] = list()
	x98[] = list()
	x99[] = list()
	x100[] = list()
	x101[] = list()
	x102[] = list()
	x103[] = list()
	x104[] = list()
	x105[] = list()
	x106[] = list()
	x107[] = list()
	x108[] = list()
	x109[] = list()
	x110[] = list()
	x111[] = list()
	x112[] = list()
	x113[] = list()
	x114[] = list()
	x115[] = list()
	x116[] = list()
	x117[] = list()
	x118[] = list()
	x119[] = list()
	x120[] = list()
	x121[] = list()
	x122[] = list()
	x123[] = list()
	x124[] = list()
	x125[] = list()
	x126[] = list()
	x127[] = list()
	x128[] = list()
	x129[] = list()
	x130[] = list()
	x131[] = list()
	x132[] = list()
	x133[] = list()
	x134[] = list()
	x135[] = list()
	x136[] = list()
	x137[] = list()
	x138[] = list()
	x139[] = list()
	x140[] = list()
	x141[] = list()
	x142[] = list()
	x143[] = list()
	x144[] = list()
	x145[] = list()
	x146[] = list()
	x147[] = list()
	x148[] = list()
	x149[] = list()
	x150[] = list()
	x151[] = list()
	x152[] = list()
	x153[] = list()
	x154[] = list()
	x155[] = list()
	x156[] = list()
	x157[] = list()
	x158[] = list()
	x159[] = list()
	x160[] = list()
	x161[] = list()
	x162[] = list()
	x163[] = list()
	x164[] = list()
	x165[] = list()
	x166[] = list()
	x167[] = list()
	x168[] = list()
	x169[] = list()
	x170[] = list()
	x171[] = list()
	x172[] = list()
	x173[] = list()
	x174[] = list()
	x175[] = list()
	x176[] = list()
	x177[] = list()
	x178[] = list()
	x179[] = list()
	x180[] = list()
	x181[] = list()
	x182[] = list()
	x183[] = list()
	x184[] = list()
	x185[] = list()
	x186[] = list()
	x187[] = list()
	x188[] = list()
	x189[] = list()
	x190[] = list()
	x191[] = list()
	x192[] = list()
	x193[] = list()
	x194[] = list()
	x195[] = list()
	x196[] = list()
	x197[] = list()
	x198[] = list()
	x199[] = list()
	x200[] = list()
	x201[] = list()
	x202[] = list()
	x203[] = list()
	x204[] = list()
	x205[] = list()
	x206[] = list()
	x207[] = list()
	x208[] = list()
	x209[] = list()
	x210[] = list()
	x211[] = list()
	x212[] = list()
	x213[] = list()
	x214[] = list()
	x215[] = list()
	x216[] = list()
	x217[] = list()
	x218[] = list()
	x219[] = list()
	x220[] = list()
	x221[] = list()
	x222[] = list()
	x223[] = list()
	x224[] = list()
	x225[] = list()
	x226[] = list()
	x227[] = list()
	x228[] = list()
	x229[] = list()
	x230[] = list()
	x231[] = list()
	x232[] = list()
	x233[] = list()
	x234[] = list()
	x235[] = list()
	x236[] = list()
	x237[] = list()
	x238[] = list()
	x239[] = list()
	x240[] = list()
	x241[] = list()
	x242[] = list()
	x243[] = list()
	x244[] = list()
	x245[] = list()
	x246[] = list()
	x247[] = list()
	x248[] = list()
	x249[] = list()
	x250[] = list()
	x251[] = list()
	x252[] = list()
	x253[] = list()
	x254[] = list()
	x255[] = list()
	x256[] = list()
	x257[] = list()
	x258[] = list()
	x259[] = list()
	x260[] = list()
	x261[] = list()
	x262[] = list()
	x263[] = list()
	x264[] = list()
	x265[] = list()
	x266[] = list()
	x267[] = list()
	x268[] = list()
	x269[] = list()
	x270[] = list()
	x271[] = list()
	x272[] = list()
	x273[] = list()
	x274[] = list()
	x275[] = list()
	x276[] = list()
	x277[] = list()
	x278[] = list()
	x279[] = list()
	x280[] = list()
	x281[] = list()
	x282[] = list()
	x283[] = list()
	x284[] = list()
	x285[] = list()
	x286[] = list()
	x287[] = list()
	x288[] = list()
	x289[] = list()
	x290[] = list()
	x291[] = list()
	x292[] = list()
	x293[] = list()
	x294[] = list()
	x295[] = list()
	x296[] = list()
	x297[] = list()
	x298[] = list()
	x299[] = list()
	x300[] = list()
	x301[] = list()
	x302[] = list()
	x303[] = list()
	x304[] = list()
	x305[] = list()
	x306[] = list()
	x307[] = list()
	x308[] = list()
	x309[] = list()
	x310[] = list()
	x311[] = list()
	x312[] = list()
	x313[] = list()
	x314[] = list()
	x315[] = list()
	x316[] = list()
	x317[] = list()
	x318[] = list()
	x319[] = list()
	x320[] = list()
	x321[] = list()
	x322[] = list()
	x323[] = list()
	x324[] = list()
	x325[] = list()
	x326[] = list()
	x327[] = list()
	x328[] = list()
	x329[] = list()
	x330[] = list()
	x331[] = list()
	x332[] = list()
	x333[] = list()
	x334[] = list()
	x335[] = list()
	x336[] = list()
	x337[] = list()
	x338[] = list()
	x339[] = list()
	x340[] = list()
	x341[] = list()
	x342[] = list()
	x343[] = list()
	x344[] = list()
	x345[] = list()
	x346[] = list()
	x347[] = list()
	x348[] = list()
	x349[] = list()
	x350[] = list()
	x351[] = list()
	x352[] = list()
	x353[] = list()
	x354[] = list()
	x355[] = list()
	x356[] = list()
	x357[] = list()
	x358[] = list()
	x359[] = list()
	x360[] = list()
	x361[] = list()
	x362[] = list()
	x363[] = list()
	x364[] = list()
	x365[] = list()
	x366[] = list()
	x367[] = list()
	x368[] = list()
	x369[] = list()
	x370[] = list()
	x371[] = list()
	x372[] = list()
	x373[] = list()
	x374[] = list()
	x375[] = list()
	x376[] = list()
	x377[] = list()
	x378[] = list()
	x379[] = list()
	x380[] = list()
	x381[] = list()
	x382[] = list()
	x383[] = list()
	x384[] = list()
	x385[] = list()
	x386[] = list()
	x387[] = list()
	x388[] = list()
	x389[] = list()
	x390[] = list()
	x391[] = list()
	x392[] = list()
	x393[] = list()
	x394[] = list()
	x395[] = list()
	x396[] = list()
	x397[] = list()
	x398[] = list()
	x399[] = list()
	x400[] = list()
	x401[] = list()
	x402[] = list()
	x403[] = list()
	x404[] = list()
	x405[] = list()
	x406[] = list()
	x407[] = list()
	x408[] = list()
	x409[] = list()
	x410[] = list()
	x411[] = list()
	x412[] = list()
	x413[] = list()
	x414[] = list()
	x415[] = list()
	x416[] = list()
	x417[] = list()
	x418[] = list()
	x419[] = list()
	x420[] = list()
	x421[] = list()
	x422[] = list()
	x423[] = list()
	x424[] = list()
	x425[] = list()
	x426[] = list()
	x427[] = list()
	x428[] = list()
	x429[] = list()
	x430[] = list()
	x431[] = list()
	x432[] = list()
	x433[] = list()
	x434[] = list()
	x435[] = list()
	x436[] = list()
	x437[] = list()
	x438[] = list()
	x439[] = list()
	x440[] = list()
	x441[] = list()
	x442[] = list()
	x443[] = list()
	x444[] = list()
	x445[] = list()
	x446[] = list()
	x447[] = list()
	x448[] = list()
	x449[] = list()
	x450[] = list()
	x451[] = list()
	x452[] = list()
	x453[] = list()
	x454[] = list()
	x455[] = list()
	x456[] = list()
	x457[] = list()
	x458[] = list()
	x459[] = list()
	x460[] = list()
	x461[] = list()
	x462[] = list()
	x463[] = list()
	x464[] = list()
	x465[] = list()
	x466[] = list()
	x467[] = list()
	x468[] = list()
	x469[] = list()
	x470[] = list()
	x471[] = list()
	x472[] = list()
	x473[] = list()
	x474[] = list()
	x475[] = list()
	x476[] = list()
	x477[] = list()
	x478[] = list()
	x479[] = list()
	x480[] = list()
	x481[] = list()
	x482[] = list()
	x483[] = list()
	x484[] = list()
	x485[] = list()
	x486[] = list()
	x487[] = list()
	x488[] = list()
	x489[] = list()
	x490[] = list()
	x491[] = list()
	x492[] = list()
	x493[] = list()
	x494[] = list()
	x495[] = list()
	x496[] = list()
	x497[] = list()
	x498[] = list()
	x499[] = list()
	x500[] = list()



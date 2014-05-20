dmp_writer{
	/*
		/dmp_writer version 1.4.1
			Released February 8th, 2007.

		defines the object /dmp_writer
			- provides the public method write_dmp()
				- Returns a text string of the map in dmp format
					ready for output to a file.
			- provides the public method save_map()
				- Returns a .dmp file if map is saved
				- Returns FALSE if map fails to save

		The /dmp_writer approximates DM's map saving process in order to allow dynamic map
		saving.	To save a map at runtime, create an instance of /dmp_writer, and then call
		write_map(), which accepts three arguments:
			- A turf representing one corner of a three dimensional grid (Required).
			- Another turf representing the other corner of the same grid (Required).
			- Any, or a combination, of several bit flags (Optional, see documentation).

		The order in which the turfs are supplied does not matter, the /dmp_writer will
		determine the grid containing both, in much the same way as DM's block() function.
		write_map() will then return a string representing the saved map in dmp format;
		this string can then be saved to a file, or used for any other purose.
		*/
	var{
		quote = "\""
		list/letter_digits = list(
			"a","b","c","d","e",
			"f","g","h","i","j",
			"k","l","m","n","o",
			"p","q","r","s","t",
			"u","v","w","x","y",
			"z",
			"A","B","C","D","E",
			"F","G","H","I","J",
			"K","L","M","N","O",
			"P","Q","R","S","T",
			"U","V","W","X","Y",
			"Z"
			)
		}
	verb{
		save_map(var/turf/t1 as turf, var/turf/t2 as turf, var/map_name as text, var/flags as num){
			//Check for illegal characters in file name... in a cheap way.
			if(!((ckeyEx(map_name)==map_name) && ckeyEx(map_name))){
				CRASH("Invalid text supplied to proc save_map, invalid characters or empty string.")
				}
			//Check for valid turfs.
			if(!isturf(t1) || !isturf(t2)){
				CRASH("Invalid arguments supplied to proc save_map, arguments were not turfs.")
				}
			var/file_text = write_dmp(t1,t2,flags)
			if(fexists("[map_name].dmp")){
				fdel("[map_name].dmp")
				}
			var/saved_map = file("[map_name].dmp")
			saved_map << file_text
			return saved_map
			}
		write_dmp(var/turf/t1 as turf, var/turf/t2 as turf, var/flags as num){
			//Check for valid turfs.
			if(!isturf(t1) || !isturf(t2)){
				CRASH("Invalid arguments supplied to proc write_dmp, arguments were not turfs.")
				}
			var/turf/nw = locate(min(t1.x,t2.x),max(t1.y,t2.y),min(t1.z,t2.z))
			var/turf/se = locate(max(t1.x,t2.x),min(t1.y,t2.y),max(t1.z,t2.z))
			var/list/templates[0]
			var/template_buffer = {""}
			var/dmp_text = {""}
			for(var/pos_z=nw.z;pos_z<=se.z;pos_z++){
				for(var/pos_y=nw.y;pos_y>=se.y;pos_y--){
					for(var/pos_x=nw.x;pos_x<=se.x;pos_x++){
						var/turf/test_turf = locate(pos_x,pos_y,pos_z)
						var/test_template = make_template(test_turf, flags)
						var/template_number = templates.Find(test_template)
						if(!template_number){
							templates.Add(test_template)
							template_number = templates.len
							}
						template_buffer += "[template_number],"
						}
					template_buffer += ";"
					world << pos_y
					sleep(-1)
					}
				template_buffer += "."
				}
			var/key_length = round/*floor*/(log(letter_digits.len,templates.len-1)+1)
			var/list/keys[templates.len]
			for(var/key_pos=1;key_pos<=templates.len;key_pos++){
				keys[key_pos] = get_model_key(key_pos,key_length)
				dmp_text += {""[keys[key_pos]]" = ([templates[key_pos]])\n"}
				}
			var/z_level = 0
			for(var/z_pos=1;TRUE;z_pos=findtext(template_buffer,".",z_pos)+1){
				if(z_pos>=length(template_buffer)){break}
				if(z_level){dmp_text+={"\n"}}
				dmp_text += {"\n(1,1,[++z_level]) = {"\n"}
				var/z_block = copytext(template_buffer,z_pos,findtext(template_buffer,".",z_pos))
				for(var/y_pos=1;TRUE;y_pos=findtext(z_block,";",y_pos)+1){
					if(y_pos>=length(z_block)){break}
					var/y_block = copytext(z_block,y_pos,findtext(z_block,";",y_pos))
					for(var/x_pos=1;TRUE;x_pos=findtext(y_block,",",x_pos)+1){
						if(x_pos>=length(y_block)){break}
						var/x_block = copytext(y_block,x_pos,findtext(y_block,",",x_pos))
						var/key_number = text2num(x_block)
						var/temp_key = keys[key_number]
						dmp_text += temp_key
						//sleep(-1)
						}
					dmp_text += {"\n"}
					world << y_pos
					sleep(-1)
					}
				dmp_text += {"\"}"}
				sleep(-1)
				}
			return dmp_text
			}
		}
	proc{
		make_template(var/turf/model as turf, var/flags as num){
			var/template = ""
			var/obj_template = ""
			var/mob_template = ""
			var/turf_template = ""
			if(!(flags & DMP_IGNORE_TURFS)){
				turf_template = "[model.type][check_attributes(model)],"
				} else{ turf_template = "[world.turf],"}
			var/area_template = ""
			if(!(flags & DMP_IGNORE_OBJS)){
				for(var/obj/O in model.contents){
					obj_template += "[O.type][check_attributes(O)],"
					}
				}
			for(var/mob/M in model.contents){
				if(M.client){
					if(!(flags & DMP_IGNORE_PLAYERS)){
						mob_template += "[M.type][check_attributes(M)],"
						}
					}
				else{
					if(!(flags & DMP_IGNORE_NPCS)){
						mob_template += "[M.type][check_attributes(M)],"
						}
					}
				}
			if(!(flags & DMP_IGNORE_AREAS)){
				var/area/m_area = model.loc
				area_template = "[m_area.type][check_attributes(m_area)]"
				} else{ area_template = "[world.area]"}
			template = "[obj_template][mob_template][turf_template][area_template]"
			return template
			}
		check_attributes(var/atom/A){
			var/attributes_text = {"{"}
			for(var/V in A.vars){
				//sleep(-1)
				if((!issaved(A.vars[V])) || (A.vars[V]==initial(A.vars[V]))){continue}
				if(istext(A.vars[V])){
					attributes_text += {"[V] = "[A.vars[V]]""}
					}
				else if(isnum(A.vars[V])||ispath(A.vars[V])){
					attributes_text += {"[V] = [A.vars[V]]"}
					}
				else if(isicon(A.vars[V])||isfile(A.vars[V])){
					attributes_text += {"[V] = '[A.vars[V]]'"}
					}
				else{
					continue
					}
				if(attributes_text != {"{"}){
					attributes_text+={"; "}
					}
				}
			if(attributes_text=={"{"}){
				return
				}
			if(copytext(attributes_text, length(attributes_text)-1, 0) == {"; "}){
				attributes_text = copytext(attributes_text, 1, length(attributes_text)-1)
				}
			attributes_text += {"}"}
			return attributes_text
			}
		get_model_key(var/which as num, var/key_length as num){
			var/key = ""
			var/working_digit = which-1
			for(var/digit_pos=key_length;digit_pos>=1;digit_pos--){
				var/place_value = round/*floor*/(working_digit/(letter_digits.len**(digit_pos-1)))
				working_digit-=place_value*(letter_digits.len**(digit_pos-1))
				key = "[key][letter_digits[place_value+1]]"
				}
			return key
			}
		}
	}
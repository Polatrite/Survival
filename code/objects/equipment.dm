obj
	game
		item

			weapons
				icon = 'obj2.dmi'
				equipable = 1
				equipslot = EQUIP_WEAPON
				Click()
					usr:v_equip(src)
				verb
					equip()
						set src in usr
						usr:v_equip(src)
				sword
					machete
						icon = 'obj1.dmi'
						icon_state = "machete"
						attack = 8
					short_sword
						icon_state = "shortsword"
						attack = 20
					long_sword
						icon_state = "longsword"
						attack = 50
				spear
					iron_spear
						icon_state = "spear"
						attack = 60
				ranged
					var
						ammo_type
					throwing_star
						icon = 'obj1.dmi'
						icon_state = "throwing star"
						attack = 35
					wooden_bow
						icon = 'obj2.dmi'
						icon_state = "bow"
						attack = 10
				ammunition
					bow
						wooden_arrow
							icon = 'obj1.dmi'
							icon_state = "arrow"
							attack = 15

			equipment
				icon = 'obj2.dmi'
				equipable = 1
				Click()
					usr:v_equip(src)
				verb
					equip()
						set src in usr
						usr:v_equip(src)

				torso
					equipslot = EQUIP_TORSO

					crude_mail_hauberk
						icon_state = "crude mail hauberk"
						defense = 25
					reinforced_mail_hauberk
						icon_state = "reinforced mail hauberk"
						defense = 45


			tools
				icon = 'obj1.dmi'
				equipable = 1
				equipslot = EQUIP_WEAPON
				Click()
					usr:v_equip(src)
				verb
					equip()
						set src in usr
						usr:v_equip(src)
				skinning
					skinning_knife
						icon = 'obj2.dmi'
						icon_state = "skinning knife"
						durability = 80
						maxdurability = 80
						attack = 1
				fishing
					Click()
						v_fish(usr, get_step(usr, usr.dir))
					fishing_pole
						icon_state = "fishing pole"
						durability = 60
						maxdurability = 60
					reinforced_fishing_pole
						icon_state = "reinforced fishing pole"
						durability = 150
						maxdurability = 150
				hoe
					Click()
						v_till(usr)
					wooden_hoe
						icon_state = "wooden hoe"
						durability = 60
						maxdurability = 60
					iron_hoe
						icon_state = "iron hoe"
						durability = 150
						maxdurability = 150
					reinforced_iron_hoe
						icon_state = "reinforced iron hoe"
						durability = 400
						maxdurability = 400
				shovel
					Click()
						v_excavate(usr, get_step(usr, usr.dir))
					wooden_shovel
						icon_state = "wooden shovel"
						durability = 60
						maxdurability = 60
					iron_shovel
						icon_state = "iron shovel"
						durability = 150
						maxdurability = 150
					reinforced_iron_shovel
						icon_state = "reinforced iron shovel"
						durability = 400
						maxdurability = 400
				pickaxe
					Click()
						v_mine(usr, get_step(usr, usr.dir))
					wooden_pickaxe
						icon_state = "wooden pickaxe"
						durability = 60
						maxdurability = 60
					iron_pickaxe
						icon_state = "iron pickaxe"
						durability = 150
						maxdurability = 150
					reinforced_iron_pickaxe
						icon_state = "reinforced iron pickaxe"
						durability = 400
						maxdurability = 400
				axe
					Click()
						v_lumberjack(usr, get_step(usr, usr.dir))
					wooden_axe
						icon_state = "wooden axe"
						durability = 120
						maxdurability = 120
					iron_axe
						icon_state = "iron axe"
						durability = 250
						maxdurability = 250
					reinforced_iron_axe
						icon_state = "reinforced iron axe"
						durability = 500
						maxdurability = 500
				cooking
					Click()
						v_craft(usr, "Culinary Arts", usr:skill_culinary_arts)
					skillet
						icon = 'Metalwork.dmi'
						icon_state = "iron cooking pan"
						durability = 300
						maxdurability = 300
					sauce_pan
						icon = 'Metalwork.dmi'
						icon_state = "iron cooking pot"
						durability = 300
						maxdurability = 300
				chisel
					iron_chisel
						icon_state = "iron chisel"
						durability = 80
						maxdurability = 80
					reinforced_iron_chisel
						icon_state = "iron chisel"
						durability = 200
						maxdurability = 200
				gouge
					iron_gouge
						icon_state = "iron gouge"
						durability = 80
						maxdurability = 80
					reinforced_iron_gouge
						icon_state = "iron gouge"
						durability = 200
						maxdurability = 200
				crowbar
					iron_crowbar
						icon_state = "iron crowbar"
						durability = 20
						maxdurability = 20
				brick_rack
					var
						brickobj
						clayobj
					Click()
						v_brickrack(usr, src)
					wooden_brick_rack
						icon_state = "brick rack"
						durability = 15
						maxdurability = 15
						brickobj = /obj/game/item/brick/clay_brick
						clayobj = /obj/game/item/clay/clay
						value2 = 80
					fired_stone_brick_rack
						icon_state = "brick rack"
						durability = 20
						maxdurability = 20

			clothes
				equipable = 1
				equipslot // must se
				Click()
					usr:v_equip(src)
				verb
					equip()
						set src in usr
						usr:v_equip(src)
				survivor_clothes
					equipslot = EQUIP_TORSO

				cotton_shirt        //you start with this, just a basic shirt, offers little protection against anything, can be made using twine and a needle
					equipslot = EQUIP_TORSO
					defense = 10
					stamina = 10
				cotton_pants        //you start with this, same as above
					equipslot = EQUIP_LEGS
					defense = 15
					stamina = 15
				cotton_bandana        //can be made like above
					equipslot = EQUIP_HEAD
					defense = 8
					stamina = 5
				cotton_wristbands    //can be made like above
					equipslot = EQUIP_ARMS
					defense = 7
					stamina = 5
				cotton_sash        //can be made like above, can be used to hold sheaths, but might rip

				wool_shirt        //can be made using thread and knitting needles, offers protection from cold but can overheat you also
				wool_sweater        //more cold protection and overheating
				wool_hooded_sweater    //the ultimate in overheating clothing! lol...
				wool_pants        //same as wool shirt
				wool_scarf        //yay for more overheating!
				moccasins        //can be made from using raw wool, twine or thread, leather, and a needle, same as wool shirt

				leather_vest        //can be made using twine or thread, leather, and a needle, offers decent physical protection, not much otherwise
				leather_pants        //same as above
				leather_sandals        //probably the only shoes that will save you from the horrible pains of walking across scorching sand, rugged gravel and freezing snow
				leather_shoes        //basicaly better than sandals
				leather_boots        //basicaly better than leather sandals/shoes
				sneakers        //bonus item! requires high quality leather, shoe laces (made from high quality wool thread, sap and a needle), rubber, and insane tailoring skills, offers slightly better stats than leather shoes and a small speed boost (not to mention they look good xp)
				leather_belt        //it keeps your pants up and looks cool! can also be used to hold sheaths
				leather_sheath        //can be used to hold swords and other weapons
				leather_hat        //offers slightly more heat protection than the other leather items by shading head and face slightly from the sun
				leather_gloves        //uh...prevents blisters from using tools all day?

				padded_vest        //probably the best but hardest to make clothing in the game, offers good physical, heat, and cold protection utilizing two leather layers with metal padding inbetween to absorb damage of any kind
				padded_pants        //same as above but forgot to mention, requires twine or thread, leather, metal pads, a needle, and insane tailoring/blacksmithing skills
				padded_shoes        //same as above
				padded_boots        //same
				buckled_belt        //this belt has a buckle!
				padded_sheath        //no more annoying swords and other sharp weapons slicing through and falling out of their sheaths and into your enemy's hands ending in your demise ^_^
				padded_helm        //let's see those annoying snipers get you with headshots now!
				padded_gloves        //aww what a cute wolf ^_^ *pets and get's bitten then watches it run away yelping dropping teeth as it goes* oo;
				bracers         //wristbands with power and style
				padded_shield        //a sheild made from the basics as well as two medium wooden rods

				wooden_buckler        //a shield made from twine or thread, a large wooden bowl and two medium wooden rods

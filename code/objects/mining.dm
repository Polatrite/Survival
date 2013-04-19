obj
	game
		item
			coal

			gems
				icon = 'obj2.dmi'
				emerald
					icon_state = "emerald"
				sapphire
					icon_state = "sapphire"
				sunstone
					icon_state = "sunstone"
				topaz
					icon_state = "topaz"
				jasper
					icon_state = "jasper"
				asterite
					icon_state = "asterite"
				pearl
					icon_state = "pearl"
				diamond
					icon_state = "diamond"
				amethyst
					icon_state = "amethyst"
				ruby
					icon_state = "ruby"
				bloodstone
					icon_state = "bloodstone"
				aventurine
					icon_state = "aventurine"
				moonstone
					icon_state = "moonstone"
				onyx
					icon_state = "onyx"
				obsidian
					icon_state = "obsidian"

			metal
				var
					refineobj

				gold

				silver

				platinum
					icon = 'obj3.dmi'
					platinum_ore
						icon_state = "rawore"
					platinum_bar
						icon_state = "metalbar"

				titanium
					icon = 'obj3.dmi'
					titanium_ore
						icon_state = "rawore"
						refineobj = /obj/game/item/metal/titanium/titanium_bar
						Click()
							v_refine(usr, src)
						verb
							refine()
								set src in usr.contents
								v_refine(usr, src)
					titanium_bar
						icon_state = "metalbar"
						Click()
							v_craft(usr, "Smithing", usr:skill_smithing)
					titanium_foil

				steel
					steel_bar

				aluminum
					icon = 'obj3.dmi'
					aluminum_ore
						icon_state = "rawore"
						refineobj = /obj/game/item/metal/aluminum/aluminum_bar
						Click()
							v_refine(usr, src)
						verb
							refine()
								set src in usr.contents
								v_refine(usr, src)
					aluminum_bar
						icon_state = "metalbar"
						Click()
							v_craft(usr, "Smithing", usr:skill_smithing)
					aluminum_foil

				iron
					icon = 'Resources.dmi'
					iron_ore         //a concentration of minerals often found in caves and in the ground that can be refined and smelted into metal
						icon_state = "iron ore"
						refineobj = /obj/game/item/metal/iron/iron_bar
						Click()
							v_refine(usr, src)
						verb
							refine()
								set src in usr.contents
								v_refine(usr, src)
					iron_bar        //made after refining iron succesfully, can be used to store iron for later use or turned into something else
						icon_state = "iron bar"
						Click()
							v_craft(usr, "Smithing", usr:skill_smithing)


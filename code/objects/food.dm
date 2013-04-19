obj
	game
		item
			food
				var
					gen
				Click()
					v_eat(usr, src)
				verb
					eat()
						set src in usr
						v_eat(usr, src)


				wheat                //from wheat bundles
				flour                //from wheat after grinded into powder
				bread                //from flour, eggs, and water after being baked
				blueberries          //from blueberry bushes
				raspberries          //from raspberry bushes
				blackberries         //from blackberry bushes

				cooked
					seared_turnip
						icon = 'turnip.dmi'
						icon_state = "inv"
						value1 = 8
						value2 = 10
						value3 = 7
					cooked_minnow
						icon = 'obj3.dmi'
						icon_state = "fish"
						value1 = 12
						value2 = 12
						value3 = 9
					baked_carrot_fish
						icon = 'carrot.dmi'
						icon_state = "inv"
						value1 = 15
						value2 = 15
						value3 = 11
					baked_potato
						icon = 'potato.dmi'
						icon_state = "inv"
						value1 = 12
						value2 = 8
						value3 = 10
					cream_of_cabbage_soup
						icon = 'cabbage.dmi'
						icon_state = "inv"
						value1 = 17
						value2 = 17
						value3 = 12

				lime


				turnip
					icon = 'turnip.dmi'
					icon_state = "inv"
					value1 = 6
					value2 = 8
					value3 = 6
					var
						gatherobj = /obj/game/item/seeds/turnip_seed
					Click()
						v_eat(usr, src)
					wild_turnip
						icon_state = "stage3"
						verb
							gather()
								set src in view(1)
								v_gather(usr, src)
						Click()
							v_gather(usr, src)
				potato
					icon = 'potato.dmi'
					icon_state = "inv"
					value1 = 10
					value2 = 6
					value3 = 10
					var
						gatherobj = /obj/game/item/seeds/potato_seed
					Click()
						v_eat(usr, src)
					wild_potato
						icon_state = "stage3"
						verb
							gather()
								set src in view(1)
								v_gather(usr, src)
						Click()
							v_gather(usr, src)
				cucumber
					icon = 'cucumber.dmi'
					icon_state = "inv"
					value1 = 8
					value2 = 8
					value3 = 7
					var
						gatherobj = /obj/game/item/seeds/cucumber_seed
					Click()
						v_eat(usr, src)
					wild_cucumber
						icon_state = "stage3"
						verb
							gather()
								set src in view(1)
								v_gather(usr, src)
						Click()
							v_gather(usr, src)
				cabbage
					icon = 'cabbage.dmi'
					icon_state = "inv"
					value1 = 6
					value2 = 6
					value3 = 6
					var
						gatherobj = /obj/game/item/seeds/cabbage_seed
					Click()
						v_eat(usr, src)
					wild_cabbage
						icon_state = "stage3"
						verb
							gather()
								set src in view(1)
								v_gather(usr, src)
						Click()
							v_gather(usr, src)
				carrot
					icon = 'carrot.dmi'
					icon_state = "inv"
					value1 = 8
					value2 = 9
					value3 = 8
					var
						gatherobj = /obj/game/item/seeds/carrot_seed
					Click()
						v_eat(usr, src)
					wild_carrot
						icon_state = "stage3"
						verb
							gather()
								set src in view(1)
								v_gather(usr, src)
						Click()
							v_gather(usr, src)

				fish
					icon = 'obj3.dmi'
					icon_state = "fish"
					var
						reqskill = 0
						commonmult = 1
					gen = "filleted"
					anchovie             //small 3 inch long fish found along ocean coastlines, common
						name = "anchovy" // damnit Jace, lrn2spell
						weight = 6 // 2
						reqskill = 5
						value1 = 3
						value2 = 3
						value3 = 2
						commonmult = 6
					minnow               //medium 5 inch long fish found in most freshwater bodies, very common
						weight = 24 // 8
						value1 = 2
						value2 = 2
						value3 = 2
						commonmult = 10
					small_bass           //medium 10 inch long fish found in freshwater streams and rivers, common
						weight = 144
						value1 = 4
						value2 = 4
						value3 = 4
						commonmult = 8
					medium_bass          //large 25 inch long fish found in both fresh and saltwater areas (mainly connections between ocean and river), uncommon and difficult to catch
						weight = 720
						reqskill = 3
						value1 = 7
						value2 = 7
						value3 = 7
						commonmult = 7
					large_bass           //huge 50 inch long fish found in saltwater at medium depths, rare and hard to catch
						weight = 2400
						reqskill = 15
						value1 = 10
						value2 = 10
						value3 = 10
						commonmult = 6
					trout
						weight = 2400
						reqskill = 17
						value1 = 10
						value2 = 10
						value3 = 10
						commonmult = 4
					herring              //medium 15 inch long fish found in fast flowing streams and rivers, rare
						weight = 432
						reqskill = 20
						value1 = 10
						value2 = 12
						value3 = 11
						commonmult = 2
					tuna                 //huge 50 inch long fish found in the deep ocean waters, rare and hard to catch
						weight = 2800
						reqskill = 25
						value1 = 20
						value2 = 20
						value3 = 20
						commonmult = 2
					swordfish            //huge 60 inch long fish found in the deep ocean waters, very rare and very hard to catch
						weight = 3000
						reqskill = 35
						commonmult = 1
					crab                 //found in almost all saltwater areas, difficult to catch
						weight = 100
						reqskill = 25
						commonmult = 4
					lobster              //found at the sea floor in deep and medium ocean waters, uncommon and difficult to catch
						weight = 160
						reqskill = 15
						commonmult = 3
					/*great_white          //hook one of these bad boys and your as good as dead, lol
						weight = 3800
					squid                //found at the sea floor in deep ocean waters, rare and hard to catch
						weight = 336*/
				beef
				chicken
				bear
				turkey
				venison
				pork



			ingredients
				icon = 'obj1.dmi'
				Click()
					v_craft(usr, "Culinary Arts", usr:skill_culinary_arts)
				verb
					cook()
						set src in usr
						v_craft(usr, "Culinary Arts", usr:skill_culinary_arts)

				ground_thyme
					icon_state = "ground thyme"

				black_pepper
					icon_state = "black pepper"

				anchovy_sauce

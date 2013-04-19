obj
	game

		crop
			stackable = 0
			value1 = 0
			value2 = 1
			var
				stage0 // from planting to sprout(stage1)
				stage1 // from sprout(stage1) to stage2
				stage2 // from stage2 to stage3(last growth or ripe)
				stage3 // from stage3 to stage4(ripe)
				stage4
				invobj
				healthy_cycles = 0
				cycles = 0
			Click()
				v_harvest(usr, src)
			verb
				harvest()
					set src in view(1)
					v_harvest(usr, src)
			turnip
				icon = 'turnip.dmi'
				icon_state = "inv"
				stage0 = 20
				stage1 = 50
				stage2 = 80
				invobj = /obj/game/item/food/turnip
			potato
				icon = 'potato.dmi'
				icon_state = "inv"
				stage0 = 30
				stage1 = 60
				stage2 = 90
				stage3 = 120
				invobj = /obj/game/item/food/potato
			cucumber
				icon = 'cucumber.dmi'
				icon_state = "inv"
				stage0 = 15
				stage1 = 30
				stage2 = 50
				stage3 = 70
				invobj = /obj/game/item/food/cucumber
			cabbage
				icon = 'cabbage.dmi'
				icon_state = "inv"
				stage0 = 30
				stage1 = 60
				stage2 = 80
				stage3 = 100
				invobj = /obj/game/item/food/cabbage
			carrot
				icon = 'carrot.dmi'
				icon_state = "inv"
				stage0 = 20
				stage1 = 50
				stage2 = 80
				invobj = /obj/game/item/food/carrot
			tree
				icon = 'tree.dmi'
				icon_state = "palm tree"
				stage0 = 80
				stage1 = 160
				stage2 = 240
				stage3 = 320
				stage4 = 400
				invobj = /obj/game/landscape/tree


		item
			seeds
				icon = 'obj1.dmi'
				icon_state = "seeds"
				var
					cropobj
				Click()
					v_plant(usr, src)
				verb
					plant()
						set src in usr
						v_plant(usr, src)

				turnip_seed
					cropobj = /obj/game/crop/turnip
				potato_seed
					cropobj = /obj/game/crop/potato
				cucumber_seed
					cropobj = /obj/game/crop/cucumber
				cabbage_seed
					cropobj = /obj/game/crop/cabbage
				carrot_seed
					cropobj = /obj/game/crop/carrot
				tree_seed
					icon_state = "tree seed"
					tmp = 1
					cropobj = /obj/game/crop/tree


turf
	desert
		icon = 'desert.dmi'

		sand
			icon_state = "sand1"
			autojointype = 10
			/*New()
				..()
				if(prob(5))
					icon_state = pick("sand_grass","sand_dead")
				else
					icon_state = pick("sand1","sand2","sand3","sand4")*/
			Click()
				v_dig(usr, src)
			verb
				dig()
					set src in view(1)
					v_dig(usr, src)

		rock
			icon_state = "rock1"
			density = 1
			New()
				..()
				icon_state = pick("rock1","rock2")

		small_rock
			icon_state = "rock3"
			New()
				..()
				icon_state = pick("rock3","rock4","rock5")

		rubble
			icon_state = "rubble"
			density = 1

		dune1
			name = "dune"
			icon_state = "dune1"

		dune2
			name = "dune"
			icon_state = "dune2"

		dune3
			name = "dune"
			icon_state = "dune3"

		dead_tree
			icon_state = "dead1"
			density = 1
			New()
				..()
				icon_state = pick("dead1","dead2","dead3")

		wastelands
			icon = 'wasteland.dmi'
			density = 1
			opacity = 1

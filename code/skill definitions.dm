skill
	var
		mob/game/owner
		name
		print_name
		level = 1
		exp = 0
		exptnl = 55
		exptotal = 0
		focus = 80
		focusexp = 500
		focusexpnext = 10000
		focusexpprev = -10000
		focusexptnl = 0
		focusexptotal = 0
		status = LOCKED

	New()
		..()
		print_name = "[uppertext(copytext(name, 1, 2))][copytext(name, 2)]"

	proc
		ApplyExperience(expadd)
			var/ret = 1
			exp += expadd
			exptotal += expadd
			while(exp >= exptnl)
				level++
				owner.bonus_mess("[print_name] increased to level [level]!")
				ret = 2
				exp -= exptnl
				exptnl = 1.13 ** (level - 1) * 55 // used to be 1.1
				exptnl = round(exptnl)
			//debug("[usr] - [name]'s exp += [expadd] = [exp]/[exptnl], and [exptotal] total")
			return ret

		CanApplyFocus(statype)
			if(status == LOCKED)
				return 0
			if(status != statype)
				return 0
			if(statype == DECREASE)
				if(focus <= 50)
					return 0
			if(statype == INCREASE)
				if(focus >= 100)
					return 0
			return 1

		ApplyFocus(focusadd)
			var/ret = 1
			focusexp += focusadd
			focusexpnext = 1.1 ** (focus-50) * 30
			focusexpprev = 1.1 ** (focus-50-1) * 30
			while(focusexp >= focusexpnext && focus < 100)
				focus++
				ret = 2
				owner.bonus_mess("[print_name] increased to [focus]% focus!")
				focusexpprev = 1.1 ** (focus-50-1) * 30
				focusexpnext = 1.1 ** (focus-50) * 30
			while(focusexp < focusexpprev && focus > 50)
				focus--
				if(focus == 50)
					owner.bonus_mess("[print_name] decreased to [focus]% focus!")
				ret = 2
				focusexpprev = 1.1 ** (focus-50-1) * 30
				focusexpnext = 1.1 ** (focus-50) * 30

/*				ret = 2
				focusexp -= focusexptnl
				if(focus <= 80)
					focusexptnl = 30
				else if(focus <= 90)
					focusexptnl = 60
				else if(focus <= 95)
					focusexptnl = 150
				else if(focus < 100)
					focusexptnl = 500
			while(focusexp < 0 && focus > 50)
				focus--
				ret = 2
				if(focus <= 80)
					focusexp += 30
				else if(focus <= 90)
					focusexp += 60
				else if(focus <= 95)
					focusexp += 150
				else if(focus < 100)
					focusexp += 500*/
			return ret

	surrvival
		name = "survival"

	woodworking
		name = "woodworking"
	culinary_arts
		name = "culinary arts"
	farming
		name = "farming"
	tailoring
		name = "tailoring"
	leatherworking
		name = "leatherworking"
	alchemy
		name = "alchemy"
	smithing
		name = "smithing"
	mysticism
		name = "mysticism"
	combat
		name = "combat"
	ranged_combat
		name = "ranged combat"
	shielding
		name = "shielding"
	physique
		name = "physique"

	survival
		name = "survival"

	woodcutting
		name = "woodcutting"
	gathering
		name = "gathering"
	jewelcrafting
		name = "jewelcrafting"
	fishing
		name = "fishing"
	prospecting
		name = "prospecting"
	mining
		name = "mining"
	skinning
		name = "skinning"
	masonry
		name = "masonry"
	swimming
		name = "swimming"
	taming
		name = "taming"
	butchering
		name = "butchering"
	stealth
		name = "stealth"



mob/game
	var

		skill_aptitude

		tmp/skill_list[]

		skill

			skill_survival = 1

// wood
			skill_woodcutting = 1
			skill_woodworking = 1

// plants
			skill_gathering = 1
			skill_culinary_arts = 1
			skill_farming = 1

// fibers
			skill_tailoring = 1
			skill_leatherworking = 1

// herbs/sand
			skill_jewelcrafting = 1
			skill_alchemy = 1

// fish
			skill_fishing = 1

// metal
			skill_mining = 1
			skill_smithing = 1

// gems
			skill_prospecting = 1

// bricks
			skill_masonry = 1

// physical
			skill_swimming = 1
			skill_stealth = 1

// mental
			skill_mysticism = 1

// creatures
			skill_taming = 1
			skill_butchering = 1
			skill_skinning = 1

// fighting
			skill_combat = 1
			skill_ranged_combat = 1
			skill_shielding = 1







			skill_survival_level = 1

// wood
			skill_woodcutting_level = 1
			skill_woodworking_level = 1

// plants
			skill_gathering_level = 1
			skill_culinary_arts_level = 1
			skill_farming_level = 1

// fibers
			skill_tailoring_level = 1
			skill_leatherworking_level = 1

// herbs/sand
			skill_jewelcrafting_level = 1
			skill_alchemy_level = 1

// fish
			skill_fishing_level = 1

// metal
			skill_mining_level = 1
			skill_smithing_level = 1

// gems
			skill_prospecting_level = 1

// bricks
			skill_masonry_level = 1

// physical
			skill_swimming_level = 1
			skill_stealth_level = 1

// mental
			skill_mysticism_level = 1

// creatures
			skill_taming_level = 1
			skill_butchering_level = 1
			skill_skinning_level = 1

// fighting
			skill_combat_level = 1
			skill_ranged_combat_level = 1
			skill_shielding_level = 1


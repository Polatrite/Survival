/*
craft data.dm

All about crafting stuff! Adding elements to these lists allow you to craft new stuff.
To make something craftable, literally just add the new entry and it will show up
automatically to eligible characters.

*/


var/list/craftables = list(
//		"Craft Name" = list(
//			new/craftable("Name", "Description",
//				/type, ammount,
//				skillname, level, focus, resoures, icon, buildonground)
//			)
//
		"Survival" = list(
			new/craftable("Fire", "A fire to keep warm. Can also be used for cooking and other tasks.",
				/obj/game/landscape/fire, 1,
				"survival", 1, 0, 9, list(),
				list(/:materials/lumber = 2, /:item/stone/stone = 1), icon('fires.dmi', "fire"), 1),
			new/craftable("Torch", "An ignitable torch that will aid your vision at night.",
				/obj/game/item/light/torch, 1,
				"survival", 1, 0, 9, list(),
				list(/:materials/lumber = 3), icon('obj1.dmi', "torch")),
			),



		"Wood Craft" = list(
			new/craftable("Torch", "An ignitable torch that will aid your vision at night.",
				/obj/game/item/light/torch, 1,
				"woodworking", 1, 0, 6, list(),
				list(/:materials/lumber = 2), icon('obj1.dmi', "torch")),
			new/craftable("Small Wooden Pole", "A very versatile small pole.",
				/obj/game/item/wood/small_wooden_pole, 1,
				"woodworking", 1, 0, 9, list(),
				list(/:materials/lumber = 3), icon('obj1.dmi', "small wooden pole")),
			new/craftable("Wooden Shovel", "A wooden shovel that is capable of digging in soft dirt.",
				/obj/game/item/tools/shovel/wooden_shovel, 1,
				"woodworking", 2, 0, 30, list(),
				list(/:materials/lumber = 10), icon('obj1.dmi', "wooden shovel")),
			new/craftable("Medium Wooden Pole", "A very versatile medium pole.",
				/obj/game/item/wood/medium_wooden_pole, 1,
				"woodworking", 2, 0, 15, list(),
				list(/:materials/lumber = 5), icon('obj1.dmi', "medium wooden pole")),
			new/craftable("Fishing Pole", "A wooden fishing pole for catching some fish!",
				/obj/game/item/tools/fishing/fishing_pole, 1,
				"woodworking", 3, 0, 54, list(),
				list(/:materials/lumber = 8, /:materials/twine = 10), icon('obj1.dmi', "fishing pole")),
			new/craftable("Wooden Hoe", "A wooden hoe for tilling grass soil.",
				/obj/game/item/tools/hoe/wooden_hoe, 1,
				"woodworking", 3, 0, 60, list(),
				list(/:materials/lumber = 20), icon('obj1.dmi', "wooden hoe")),
			new/craftable("Wooden Pickaxe", "A wooden pickaxe for mining that lacks durability but can get the job done.",
				/obj/game/item/tools/pickaxe/wooden_pickaxe, 1,
				"woodworking", 4, 0, 45, list(),
				list(/:materials/lumber = 15), icon('obj1.dmi', "wooden pickaxe")),
			new/craftable("Wooden Axe", "A wooden axe for cutting, highly prone to breaking.",
				/obj/game/item/tools/axe/wooden_axe, 1,
				"woodworking", 5, 0, 51, list(),
				list(/:materials/lumber = 12, /:item/stone/stone = 5), icon('obj1.dmi', "wooden axe")),
			new/craftable("Raft", "A small raft for short trips on the water, supports one person.",
				/obj/game/item/boat/raft, 1,
				"woodworking", 6, 0, 180, list(),
				list(/:materials/lumber = 60), icon('obj1.dmi', "raft")),
			new/craftable("Brick Rack", "A rack used for drying clay into bricks.",
				/obj/game/item/tools/brick_rack/wooden_brick_rack, 1,
				"woodworking", 7, 0, 60, list(),
				list(/:materials/lumber = 20), icon('obj1.dmi', "brick rack")),
			new/craftable("Large Wooden Pole", "A very versatile large pole.",
				/obj/game/item/wood/large_wooden_pole, 1,
				"woodworking", 8, 0, 24, list(),
				list(/:materials/lumber = 8), icon('obj1.dmi', "large wooden pole")),
			new/craftable("Machete", "A wooden machete for hacking through brush.",
				/obj/game/item/weapons/sword/machete, 1,
				"woodworking", 9, 85, 63, list(),
				list(/:materials/lumber = 21), icon('obj1.dmi', "machete")),
			new/craftable("Crude Floor", "A rather crude wooden floor.",
				/obj/game/structure/plank/floor, 1,
				"woodworking", 10, 60, 30, list(),
				list(/:materials/lumber = 10), icon('structure_plank.dmi', "floor"), 1),
			new/craftable("Crude Wall", "A rather crude wooden wall.",
				/obj/game/structure/plank/wall, 1,
				"woodworking", 10, 60, 45, list(),
				list(/:materials/lumber = 15), icon('structure_plank.dmi', "wall1"), 1),
			new/craftable("Crude Door", "A rather crude wooden door.",
				/obj/game/structure/plank/door, 1,
				"woodworking", 10, 70, 75, list(),
				list(/:materials/lumber = 25), icon('structure_plank.dmi', "door closed"), 1),
			new/craftable("Small Wooden Disc", "A small disc made of wood.",
				/obj/game/item/wood/small_wooden_disc, 1,
				"woodworking", 11, 0, 60, list(),
				list(/:materials/lumber = 20), icon('obj1.dmi', "small wooden disc")),
			new/craftable("Crude Window", "A rather crude wooden wall with a window.",
				/obj/game/structure/plank/window, 1,
				"woodworking", 12, 75, 45, list(),
				list(/:materials/lumber = 15), icon('structure_plank.dmi', "window closed"), 1),
			new/craftable("Wooden Arrow", "A stone-tipped wooden arrow.",
				/obj/game/item/weapons/ammunition/bow/wooden_arrow, 1,
				"woodworking", 12, 75, 9, list(),
				list(/:materials/lumber = 2, /:item/stone/stone = 1), icon('obj1.dmi', "arrow")),
			new/craftable("Wooden Bow", "A basic bow with a weak twine draw.",
				/obj/game/item/weapons/ranged/wooden_bow, 1,
				"woodworking", 14, 85, 96, list(),
				list(/:materials/lumber = 10, /:materials/twine = 22), icon('obj2.dmi', "bow")),
			new/craftable("Huge Wooden Pole", "A very versatile huge pole.",
				/obj/game/item/wood/huge_wooden_pole, 1,
				"woodworking", 15, 0, 15, list(),
				list(/:materials/lumber = 3, /:wood/medium_wooden_pole = 2), icon('obj1.dmi', "huge wooden pole")),
			new/craftable("Large Wooden Disc", "A large disc made of wood.",
				/obj/game/item/wood/large_wooden_disc, 1,
				"woodworking", 17, 0, 180, list(),
				list(/:materials/lumber = 60), icon('obj1.dmi', "large wooden disc")),
			new/craftable("Reinforced Fishing Pole", "A reinforced fishing pole with excellent durability.",
				/obj/game/item/tools/fishing/fishing_pole, 1,
				"woodworking", 18, 0, 105, list(),
				list(/:materials/lumber = 20, /:materials/twine = 15), icon('obj1.dmi', "reinforced fishing pole")),
			new/craftable("Sturdy Floor", "A solid wooden floor.",
				/obj/game/structure/wood/floor, 1,
				"woodworking", 20, 70, 45, list(),
				list(/:materials/lumber = 15), icon('structure_wood.dmi', "floor"), 1),
			new/craftable("Boat", "A seaworthy vessel that can support four people.",
				/obj/game/item/boat, 1,
				"woodworking", 22, 85, 600, list(),
				list(/:materials/lumber = 200), icon('obj1.dmi', "raft")),
			new/craftable("Sturdy Wall", "A sturdy wooden wall.",
				/obj/game/structure/wood/wall, 1,
				"woodworking", 35, 75, 60, list(),
				list(/:materials/lumber = 20), icon('structure_wood.dmi', "wall1"), 1),
			new/craftable("Sturdy Door", "A sturdy wooden door.",
				/obj/game/structure/wood/door, 1,
				"woodworking", 35, 85, 105, list(),
				list(/:materials/lumber = 35), icon('structure_wood.dmi', "door closed"), 1),
			new/craftable("Sturdy Window", "A sturdy wooden wall with a window.",
				/obj/game/structure/wood/window, 1,
				"woodworking", 37, 85, 60, list(),
				list(/:materials/lumber = 20), icon('structure_wood.dmi', "window closed"), 1),
			),

		"Smithing" = list(
			new/craftable("Skinning Knife", "An iron-crafted skinning knife.",
				/obj/game/item/tools/skinning/skinning_knife, 1,
				"smithing", 1, 0, 30, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 10), icon('obj2.dmi', "skinning knife")),
			new/craftable("Skillet", "A basic pan for cooking.",
				/obj/game/item/tools/cooking/skillet, 1,
				"smithing", 1, 0, 60, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 20), icon('obj1.dmi', "cooking pan")),
			new/craftable("Iron Shovel", "A crude shovel made of iron.",
				/obj/game/item/tools/shovel/iron_shovel, 1,
				"smithing", 2, 0, 33, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 10, /:wood/small_wooden_pole = 1), icon('obj1.dmi', "iron shovel")),
			new/craftable("Iron Hoe", "A crude hoe made of iron.",
				/obj/game/item/tools/hoe/iron_hoe, 1,
				"smithing", 3, 0, 63, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 20, /:wood/large_wooden_pole = 1), icon('obj1.dmi', "iron hoe")),
			new/craftable("Lantern", "A reusable light to help you see at night.",
				/obj/game/item/light/lantern, 1,
				"smithing", 4, 0, 60, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 20), icon('obj1.dmi', "lantern")),
			new/craftable("Iron Pickaxe", "A crude pickaxe made of iron.",
				/obj/game/item/tools/pickaxe/iron_pickaxe, 1,
				"smithing", 4, 0, 48, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 15, /:wood/medium_wooden_pole = 1), icon('obj1.dmi', "iron pickaxe")),
			new/craftable("Iron Axe", "A crude axe made of iron.",
				/obj/game/item/tools/axe/iron_axe, 1,
				"smithing", 5, 0, 39, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 12, /:wood/medium_wooden_pole = 1), icon('obj1.dmi', "iron axe")),
			new/craftable("Sauce Pan", "A small sauce pan for mixing and cooking dishes.",
				/obj/game/item/tools/cooking/sauce_pan, 1,
				"smithing", 7, 0, 120, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 40), icon('obj1.dmi', "cooking pan")),
			new/craftable("Crude Mail Hauberk", "A hauberk made of crude iron chainmail.",
				/obj/game/item/equipment/torso/crude_mail_hauberk, 1,
				"smithing", 9, 70, 150, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 50), icon('obj2.dmi', "crude mail hauberk")),
			new/craftable("Basic Anvil", "A basic anvil made of iron.",
				/obj/game/structure/anvil/basic_anvil, 1,
				"smithing", 10, 85, 750, list(/obj/game/landscape/fire = 1),
				list(/:metal/iron/iron_bar = 250), icon('obj1.dmi', "anvil"), BUILD_ON_FLOOR),
			new/craftable("Short Sword", "A short sword made of crude iron.",
				/obj/game/item/weapons/sword/short_sword, 1,
				"smithing", 10, 85, 90, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 30), icon('obj2.dmi', "shortsword")),
			new/craftable("Aluminum Foil", "Aluminum foil that is handy for cooking.",
				/obj/game/item/metal/aluminum/aluminum_foil, 2,
				"smithing", 13, 0, 3, list(/obj/game/landscape/fire = 1),
				list(/:metal/aluminum/aluminum_bar = 1), icon('obj1.dmi', "aluminum foil")),
			new/craftable("Reinforced Iron Shovel", "A sturdy shovel made of iron.",
				/obj/game/item/tools/shovel/reinforced_iron_shovel, 1,
				"smithing", 14, 0, 66, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 20, /:wood/small_wooden_pole = 2), icon('obj1.dmi', "reinforced iron shovel")),
			new/craftable("Reinforced Iron Hoe", "A sturdy hoe made of iron.",
				/obj/game/item/tools/hoe/reinforced_iron_hoe, 1,
				"smithing", 18, 0, 126, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 40, /:wood/large_wooden_pole = 2), icon('obj1.dmi', "reinforced iron hoe")),
			new/craftable("Throwing Star", "A sharp throwing star.",
				/obj/game/item/weapons/ranged/throwing_star, 1,
				"smithing", 20, 90, 3, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 1), icon('obj1.dmi', "throwing star")),
			new/craftable("Reinforced Iron Pickaxe", "A sturdy pickaxe made of iron.",
				/obj/game/item/tools/pickaxe/reinforced_iron_pickaxe, 1,
				"smithing", 21, 70, 96, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 30, /:wood/medium_wooden_pole = 2), icon('obj1.dmi', "reinforced iron pickaxe")),
			new/craftable("Reinforced Mail Hauberk", "A hauberk made of iron chainmail reinforced with metal rivets.",
				/obj/game/item/equipment/torso/reinforced_mail_hauberk, 1,
				"smithing", 22, 70, 330, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 110), icon('obj2.dmi', "reinforced mail hauberk")),
			new/craftable("Long Sword", "A long sword made of crude iron.",
				/obj/game/item/weapons/sword/long_sword, 1,
				"smithing", 23, 90, 270, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 90), icon('obj2.dmi', "longsword")),
			new/craftable("Reinforced Iron Axe", "A sturdy axe made of iron.",
				/obj/game/item/tools/axe/reinforced_iron_axe, 1,
				"smithing", 25, 70, 78, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 24, /:wood/medium_wooden_pole = 2), icon('obj1.dmi', "reinforced iron axe")),
			new/craftable("Iron Spear", "A heavy spear made of iron.",
				/obj/game/item/weapons/spear/iron_spear, 1,
				"smithing", 28, 90, 156, list(/obj/game/landscape/fire = 1, /obj/game/structure/anvil/basic_anvil = 1),
				list(/:metal/iron/iron_bar = 50, /:wood/large_wooden_pole = 2), icon('obj2.dmi', "spear")),
			),

		"Masonry" = list(
			new/craftable("Clay Bucket", "A completely sealed clay bucket.",
				/obj/game/item/water_container/clay_bucket, 1,
				"masonry", 1, 0, 36, list(),
				list(/:clay/clay = 10, /:sand/sand = 2), icon('obj3.dmi', "clay bucket")),
			new/craftable("Brick Floor", "A solid brick floor.",
				/obj/game/structure/brick/floor, 1,
				"masonry", 5, 0, 60, list(),
				list(/:brick/clay_brick = 20), icon('structure_sandstone.dmi', "floor"), 1),
			new/craftable("Brick Wall", "A sturdy brick wall.",
				/obj/game/structure/brick/wall, 1,
				"masonry", 5, 0, 75, list(),
				list(/:brick/clay_brick = 25), icon('structure_sandstone.dmi', "wall1"), 1),
			new/craftable("Brick Door", "A sturdy brick door.",
				/obj/game/structure/brick/door, 1,
				"masonry", 5, 0, 120, list(),
				list(/:brick/clay_brick = 40), icon('structure_sandstone.dmi', "door closed"), 1),
			new/craftable("Brick Window", "A sturdy brick wall with a window.",
				/obj/game/structure/brick/window, 1,
				"masonry", 6, 0, 75, list(),
				list(/:brick/clay_brick = 25), icon('structure_sandstone.dmi', "window closed"), 1),
			new/craftable("Cross Floor", "A solid brick floor with a criss-cross tiling.",
				/obj/game/structure/brick/cross_floor, 1,
				"masonry", 10, 85, 90, list(),
				list(/:brick/clay_brick = 30), icon('structure_sandstone.dmi', "cross floor"), 1),
			new/craftable("Brick Gate", "A sturdy brick gate that can be opened by anyone. Useful for city walls.",
				/obj/game/structure/brick/gate, 1,
				"masonry", 13, 0, 210, list(),
				list(/:brick/clay_brick = 70), icon('structure_sandstone.dmi', "gate closed"), 1),
			new/craftable("Cobblestone Floor", "A cobblestone floor.",
				/obj/game/structure/brick/cobblestone_floor, 1,
				"masonry", 14, 80, 60, list(),
				list(/:item/stone/stone = 20), icon('structure_sandstone.dmi', "cobblestone floor"), 1),
			new/craftable("Brick Pillar", "A pillar made of a compressed brick column.",
				/obj/game/structure/brick/pillar, 1,
				"masonry", 15, 85, 150, list(),
				list(/:brick/clay_brick = 50), icon('structure_sandstone.dmi', "pillar"), BUILD_ON_FLOOR),
			new/craftable("Fountain", "A brick fountain that has a refilling water supply.",
				/obj/game/structure/water_container/brick_fountain, 1,
				"masonry", 20, 80, 450, list(),
				list(/:brick/clay_brick = 150), icon('obj1.dmi', "brick fountain"), BUILD_ON_FLOOR),
			new/craftable("Lime Mortar", "Mortar made of clay, sand, and lime.",
				/obj/game/item/mortar/lime_mortar, 5,
				"masonry", 22, 0, 48, list(),
				list(/:clay/clay = 2, /:sand/sand = 10, /:food/lime = 4), icon('obj1.dmi', "lime mortar")),
			new/craftable("Ceremic Brick Kiln", "A kiln made of bricks. Used to fire bricks and wood to strengthen them.",
				/obj/game/structure/kiln/ceremic_brick_kiln, 1,
				"masonry", 25, 80, 924, list(),
				list(/:brick/clay_brick = 300, /:wood/large_wooden_pole = 8), icon('obj1.dmi', "brick kiln"), BUILD_ON_FLOOR),
			/*new/craftable("Fired Brick Floor", "A fired brick floor.",
				/obj/game/structure/fired_brick/floor, 1,
				"masonry", 35, 80, 66, list(),
				list(/:brick/fired_clay_brick = 20, /:mortar/lime_mortar = 2), icon('structure_fired_brick.dmi', "floor"), 1),*/
			new/craftable("Fired Brick Wall", "A fired brick wall.",
				/obj/game/structure/fired_brick/wall, 1,
				"masonry", 35, 80, 99, list(),
				list(/:brick/fired_clay_brick = 25, /:mortar/lime_mortar = 8), icon('structure_fired_brick.dmi', "wall1"), 1),
			new/craftable("Fired Brick Door", "A fired brick door.",
				/obj/game/structure/fired_brick/door, 1,
				"masonry", 35, 90, 135, list(),
				list(/:brick/fired_clay_brick = 40, /:mortar/lime_mortar = 5), icon('structure_fired_brick.dmi', "door closed"), 1),
			/*new/craftable("Fired Brick Window", "A fired brick wall with a window.",
				/obj/game/structure/fired_brick/window, 1,
				"masonry", 37, 92, 93, list(),
				list(/:brick/fired_clay_brick = 25, /:mortar/lime_mortar = 6), icon('structure_fired_brick.dmi', "window closed"), 1),*/
			new/craftable("Fired Brick Gate", "A fired brick gate that can be opened by anyone. Useful for city walls.",
				/obj/game/structure/fired_brick/door, 1,
				"masonry", 40, 90, 135, list(),
				list(/:brick/fired_clay_brick = 70, /:mortar/lime_mortar = 10), icon('structure_fired_brick.dmi', "gate closed"), 1),
			),

		"Jewelcrafting" = list(
			new/craftable("Decorative Bead", "A basic decorative glass bead.",
				/obj/game/item/bead/decorative_bead, 1,
				"jewelcrafting", 1, 0, 30, list(),
				list(/:glass/sand = 5), icon('beads.dmi', "basic")),
			),

		"Culinary Arts" = list(
			new/craftable("Seared Turnip", "Delicious turnips seared over an open fire.",
				/obj/game/item/food/cooked/seared_turnip, 3,
				"culinary arts", 1, 0, 2*9, list(/obj/game/landscape/fire = 1, /:tools/cooking/skillet = 1),
				list(/:food/turnip = 3), icon('turnip.dmi', "inv")),
			new/craftable("Cooked Minnow", "A dish of cooked minnows.",
				/obj/game/item/food/cooked/cooked_minnow, 1,
				"culinary arts", 1, 0, 2*30, list(/obj/game/landscape/fire = 1, /:tools/cooking/skillet = 1),
				list(/:food/fish/minnow = 10), icon('obj3.dmi', "fish")),
			new/craftable("Baked Potato", "A baked potato!",
				/obj/game/item/food/cooked/baked_potato, 3,
				"culinary arts", 1, 0, 2*3, list(/obj/game/landscape/fire = 1, /:tools/cooking/skillet = 1),
				list(/:food/potato = 3, /:aluminum/aluminum_foil = 1), icon('potato.dmi', "inv")),
			new/craftable("Baked Carrot Fish", "A flavorful anchovy sauce useful for seasoning dishes.",
				/obj/game/item/food/cooked/baked_carrot_fish, 1,
				"culinary arts", 4, 0, 2*15, list(/obj/game/landscape/fire = 1, /:tools/cooking/skillet = 1),
				list(/:food/fish/small_bass = 1, /:food/carrot = 3, /:ingredients/black_pepper = 1), icon('obj3.dmi', "fish")),
			new/craftable("Anchovy Sauce", "A flavorful anchovy sauce useful for seasoning dishes.",
				/obj/game/item/ingredients/anchovy_sauce, 1,
				"culinary arts", 6, 0, 2*24, list(/obj/game/landscape/fire = 1, /:tools/cooking/sauce_pan = 1),
				list(/:food/fish/anchovie = 3, /:gatherables/thyme = 2, /:ingredients/black_pepper = 3), icon('obj3.dmi', "fish")),
			new/craftable("Cream of Cabbage Soup", "A delicious cream of cabbage concoction.",
				/obj/game/item/food/cooked/cream_of_cabbage_soup, 1,
				"culinary arts", 8, 0, 2*27, list(/obj/game/landscape/fire = 1, /:tools/cooking/skillet = 1, /:tools/cooking/sauce_pan = 1),
				list(/:food/cabbage = 4, /:fish/trout = 1, /:gatherables/thyme = 2, /:ingredients/black_pepper = 2), icon('cabbage.dmi', "inv")),
			),

		"Leatherworking" = list(
			new/craftable("Leather Strap", "A leather strap used to hold things in place.",
				/obj/game/item/strap/leather_strap, 1,
				"leatherworking", 1, 0, 24, list(/:leather/rough_leather = 8), icon('obj1.dmi', "lantern")),
			),

		"Tailoring" = list(
			new/craftable("Cotton Shirt", "A simple cotton shirt.",
				/obj/game/item/clothes/cotton_shirt, 1,
				"tailoring", 1, 0, 45, list(),
				list(/:materials/cotton = 15), icon('obj2.dmi', "padded")),
			new/craftable("Cotton Pants", "Simple cotton pants.",
				/obj/game/item/clothes/cotton_pants, 1,
				"tailoring", 1, 0, 60, list(),
				list(/:materials/cotton = 20), icon('obj2.dmi', "padded")),
			new/craftable("Cotton Bandana", "A simple cotton bandana.",
				/obj/game/item/clothes/cotton_bandana, 1,
				"tailoring", 1, 0, 18, list(),
				list(/:materials/cotton = 6), icon('obj2.dmi', "padded")),
			new/craftable("Cotton Wristbands", "Simple cotton wristbands.",
				/obj/game/item/clothes/cotton_wristbands, 1,
				"tailoring", 1, 0, 24, list(),
				list(/:materials/cotton = 8), icon('obj2.dmi', "padded")),
			)


		)

var/list/resourceIcons = list(
	"Lumber" = icon('obj3.dmi', "log"),
	"Twine" = icon('obj3.dmi', "twine"),
	"Stone" = icon('obj3.dmi', "rock"),
	"Sand" = icon('obj3.dmi', "wheatgrains"), // *shrugs*
	"Clay" = icon('obj3.dmi', "clay"),
	"Clay Brick" = icon('obj1.dmi', "clay brick"),
	"Fired Clay Brick" = icon('obj1.dmi', "fired clay brick"),
	"Lime Mortar" = icon('obj1.dmi', "lime mortar"),
	"Iron Bar" = icon('obj3.dmi', "metalbar"),
	"Aluminum Bar" = icon('obj3.dmi', "metalbar"),
	"Titanium Bar" = icon('obj3.dmi', "metalbar"),
	"Platinum Bar" = icon('obj3.dmi', "metalbar"),
	"Aluminum Foil" = icon('obj3.dmi', "metalbar"),
	"Rough Leather" = icon('obj1.dmi', "animal_hide"),
	"Sprig of Thyme" = icon('obj1.dmi', "thyme"),
	"Ground Thyme" = icon('obj1.dmi', "ground thyme"),
	"Black Pepper" = icon('obj1.dmi', "black pepper"),
	"Anchovy Sauce" = icon('obj3.dmi', "fish"),
	"Turnip" = icon('turnip.dmi', "inv"),
	"Lime" = icon('obj1.dmi', "inv"),
	"Potato" = icon('potato.dmi', "inv"),
	"Carrot" = icon('carrot.dmi', "inv"),
	"Cabbage" = icon('cabbage.dmi', "inv"),
	"Cucumber" = icon('cucumber.dmi', "inv"),
	"Minnow" = icon('obj3.dmi', "fish"),
	"Anchovy" = icon('obj3.dmi', "fish"),
	"Small Bass" = icon('obj3.dmi', "fish"),
	"Trout" = icon('obj3.dmi', "fish"),
	"Small Wooden Pole" = icon('obj1.dmi', "small wooden pole"),
	"Medium Wooden Pole" = icon('obj1.dmi', "medium wooden pole"),
	"Large Wooden Pole" = icon('obj1.dmi', "large wooden pole"))

var/list/resourceNames = list(
	/:materials/lumber = "Lumber",
	/:materials/twine = "Twine",
	/:item/stone/stone = "Stone",
	/:sand/sand = "Sand",
	/:clay/clay = "Clay",
	/:brick/clay_brick = "Clay Brick",
	/:brick/fired_clay_brick = "Fired Clay Brick",
	/:mortar/lime_mortar = "Lime Mortar",
	/:iron/iron_bar = "Iron Bar",
	/:aluminum/aluminum_bar = "Aluminum Bar",
	/:titanium/titanium_bar = "Titanium Bar",
	/:platinum/platinum_bar = "Platinum Bar",
	/:aluminum/aluminum_foil = "Aluminum Foil",
	/:leather/rough_leather = "Rough Leather",
	/:gatherables/thyme = "Sprig of Thyme",
	/:ingredients/ground_thyme = "Ground Thyme",
	/:ingredients/black_pepper = "Black Pepper",
	/:ingredients/anchovy_sauce = "Anchovy Sauce",
	/:food/turnip = "Turnip",
	/:food/lime = "Lime",
	/:food/potato = "Potato",
	/:food/carrot = "Carrot",
	/:food/cabbage = "Cabbage",
	/:food/cucumber = "Cucumber",
	/:food/fish/minnow = "Minnow",
	/:food/fish/anchovie = "Anchovy",
	/:food/fish/small_bass = "Small Bass",
	/:food/fish/trout = "Trout",
	/:wood/small_wooden_pole = "Small Wooden Pole",
	/:wood/medium_wooden_pole = "Medium Wooden Pole",
	/:wood/large_wooden_pole = "Large Wooden Pole",
	)

craftable
	var
		name = ""
		desc = ""
		reqSkill = ""
		reqLevel = 1
		reqFocus = 0
		exp = 0
		prototype = /obj/game
		ammount = 1
		list/resources
		list/required
		icon = null
		grounded = 0

	New(n, desc, prototype, ammount=1, skill="woodworking", level=1, focus=0, exp=0, required=list(), resources=list(), icon=null, onground=0)
		src.name = n
		src.desc = desc
		src.prototype = prototype
		src.ammount = ammount
		src.reqSkill = skill
		src.reqLevel = level
		src.reqFocus = focus
		src.exp = exp
		src.required = required
		src.resources = resources
		src.icon = icon
		src.grounded = onground

	Topic(ref, list/params)
		var/mob/game/user = locate(params["user"])
		if(!user || user != usr) return
		Build(user)

	proc
		IsVisible(mob/game/m)
			var/skill/s = m.GetSkill(reqSkill)
			if(!s) return 0
			return s.level >= reqLevel
		IsBuildable(mob/game/m)
			var/skill/s = m.GetSkill(reqSkill)
			if(!s || !(s.level >= reqLevel && s.focus >= reqFocus))
				return 0
			var/list/res = resources.Copy()
			for(var/obj/game/item/o in m)
				res[o.type] -= o.amount
			for(var/r in res) if(res[r] > 0)
				return 0
			var/list/req = required.Copy()
			for(var/obj/game/o in view(m,1))
				req[o.type] -= max(1, o.amount)
			for(var/r in req)
				if(req[r] > 0)
					var/obj/game/O = new r()
					m.mess("You need \an [O.name].")
					return 0
			return 1

		Build(mob/game/m)
			if(m.action) return
			if(!IsBuildable(m))
				m.mess("You lack the requirements for \a [lowertext(name)].")
				return
			if(!CanBuildHere(m))
				return
			/*if(istype(m.loc, /turf/water))
				m.mess("You cannot build this on water.")
				return
			var/obj/game/structure/struct = locate() in m.loc
			if(grounded == BUILD_ON_GROUND && struct)
				world << "Ground check: [grounded] and [struct.structure_type]"
				m.mess("Something is blocking construction.")
				return
			if(grounded == BUILD_ON_FLOOR && struct && struct.structure_type != STRUCTURE_FLOOR)
				world << "Floor check: [grounded] and [struct.structure_type]"
				m.mess("Something is blocking construction.")
				return*/
			var/delay = m.Delay(reqSkill, exp)
			m.mess("You begin crafting \a [lowertext(name)]. ([delay])")
			m.action = new/atom/movable/action(m.contents)
			m.action.Setup("Crafting \a [lowertext(name)]", 'obj1.dmi', "hammer")
			m.action.Run(src, m, PAC_SELF, delay, .BuildFinished)

		CanBuildHere(mob/game/m)
			var/obj/game/structure/struct = locate() in m.loc
			if(grounded == BUILD_ON_GROUND && struct)
				world << "Ground check: [grounded] and [struct.structure_type]"
				m.mess("Something is blocking construction.")
				return
			if(grounded == BUILD_ON_FLOOR && struct && struct.structure_type != STRUCTURE_FLOOR)
				world << "Floor check: [grounded] and [struct.structure_type]"
				m.mess("Something is blocking construction.")
				return
			if(grounded && (istype(m.loc, /turf/water) || istype(m.loc, /turf/cave)))
				m.mess("You cannot build here.")
				return
			if(grounded && (istype(m.loc.loc, /area/low_fertility/no_fertility/no_build)))
				m.mess("You cannot build here.")
				return
			return 1


		BuildFinished(craftable/craft, mob/game/m) // This is a static proc.  Do not use 'src'
			if(!m) return
			if(!craft.IsBuildable(m))
				m.mess("You lack the requirements for \a [lowertext(craft.name)].")
				return
			if(!craft.CanBuildHere(m))
				return
			if(!m.SkillCheckExp(craft.reqSkill, level=craft.reqLevel, exp=craft.exp))
				m.mess("You fail to create \the [lowertext(craft.name)].")
				return
			m.mess("You sucessfully create \the [lowertext(craft.name)]!")
			var/obj/game/o = new craft.prototype(m.loc)//craft.grounded ? m.loc : m)
			o.amount = craft.ammount
			o.owner = "$[ckey(m.name)]|"
			if(!craft.grounded)
				MoveStack(o, m, o.amount)
			var/list/res = craft.resources.Copy()
			for(var/obj/game/item/r in m)
				if(res[r.type] > 0)
					DelStack(r, res[r.type])
					res[r.type] = 0
			var/list/req = craft.required.Copy()
			for(var/obj/game/item/r in m)
				if(req[r.type] > 0)
					if(r.maxdurability)
						r.ChangeDurability(-1)
					req[r.type] = 0

proc/v_craft(mob/game/M, trade, skill/pskill)
	src = M
	var/list/crafts = craftables[trade]
	var/html = craft_html_header
	html += \
{"    <div class="header"><img src="sWoodCraft.png" /> [trade]</div>
    <div class="container">
        <div class="folder">
            &nbsp; <b id="tabTitle">Primary Skill</b>
            <div class="actions">
                <table>
                    <tr>
                        <td style="font-weight: bold">
                            [pskill.print_name]
                        </td>
                        <td style="font-size: 80%; padding-left: 10px">
                            Level: [pskill.level]<br />
                            Focus: [round(pskill.focus)]%
                        </td>
                    </tr>
                </table>
            </div>
            &nbsp; <b id="B1">Available Projects</b>
            <div class="actions">
                <table cellpadding="0" cellspacing="0" class="projects">
                    <colgroup>
                        <col />
                        <col class="projectName" />
                        <col align="center" />
                        <col />
                    </colgroup>
                    <tr>
                        <th> </th>
                        <th>Name</th>
                        <th>Skills</th>
                        <th>Resources</th>
                    </tr>
					"}
	var/n = 1
	for(var/craftable/craft in crafts)
		if(!craft.IsVisible(src)) continue
		html += {"                    <tr[n % 2 ? " class='odd'" : ""]>
                    <td rowspan="2"><img src="sCraft-[ckey(craft.name)].png" alt="" /></td>
                    <td><a href="byond://?src=\ref[craft]&user=\ref[src]">[craft.name]</a></td>
                    <td>Lv [craft.reqLevel] at [round(craft.reqFocus)]%</td>
                    <td>"}
		for(var/r in craft.resources)
			html += {"<span class="resources" title="[resourceNames[r]]"  style="background-image: url('sResource-[ckey(resourceNames[r])].png')">[craft.resources[r]]</span>"}
		html += {"</td>
                    </tr>
                    <tr class="[n % 2 ? "odd " : ""]desc">
                        <td colspan="3">[craft.desc]</td>
                    </tr>
"}
		++n

	html += \
{"
                </table>
              <br/>
              <br/>
              <br/>
            </div>

            &nbsp; <b id="B1">Unavailable Projects</b>
            <div class="actions">
                <table cellpadding="0" cellspacing="0" class="projects">
                    <colgroup>
                        <col />
                        <col class="projectName" />
                        <col align="center" />
                        <col />
                    </colgroup>
                    <tr>
                        <th> </th>
                        <th>Name</th>
                        <th>Skills</th>
                        <th>Resources</th>
                    </tr>
					"}

	n = 1
	for(var/craftable/craft in crafts)
		if(craft.IsVisible(src)) continue
		html += {"                    <tr[n % 2 ? " class='odd'" : ""]>
                    <td rowspan="2"><img src="sCraft-[ckey(craft.name)].png" alt="" /></td>
                    <td><a href="byond://?src=\ref[craft]&user=\ref[src]">[craft.name]</a></td>
                    <td>Lv [craft.reqLevel] at [round(craft.reqFocus)]%</td>
                    <td>"}
		for(var/r in craft.resources)
			html += {"<span class="resources" title="[resourceNames[r]]"  style="background-image: url('sResource-[ckey(resourceNames[r])].png')">[craft.resources[r]]</span>"}
		html += {"</td>
                    </tr>
                    <tr class="[n % 2 ? "odd " : ""]desc">
                        <td colspan="3">?????</td>
                    </tr>
"}
		++n



	html += \
{"                </table>
            </div>
        </div>
    </div>
</body>
</html>"}
	src << browse(html, "window=craft&size=700x600")


/*
	for(var/craftable/craft in crafts)
		if(craft.IsVisible(src)) continue
		html += {"                    <tr[n % 2 ? " class='odd'" : ""]>
                    <td rowspan="2"><img src="sCraft-[ckey(craft.name)].png" alt="" /></td>
                    <td><a href="byond://?src=\ref[craft]&user=\ref[src]">[craft.name]</a></td>
                    <td>Lv [craft.reqLevel] at [round(craft.reqFocus)]%</td>
                    <td>"}
		for(var/r in craft.resources)
			html += {"<span class="resources" title="[resourceNames[r]]"  style="background-image: url('sResource-[ckey(resourceNames[r])].png')">[craft.resources[r]]</span>"}
		html += {"</td>
                    </tr>
                    <tr class="[n % 2 ? "odd " : ""]desc">
                        <td colspan="3">?????[craft.desc]</td>
                    </tr>
"}
		++n



	html += \
{"                </table>
            </div>
        </div>
    </div>
</body>
</html>"}
	src << browse(html, "window=craft&size=700x600")
*/


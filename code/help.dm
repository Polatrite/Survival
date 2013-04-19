datum/helpsys/main
	title="Survival"
	text="<i>Can you make it?</i><BR><br>The following are various topics to help you learn how to play the game, simply click the link!"
	css="body{background: 228b22; color: ffd700; text-align:center; font-family: 'Comic Sans MS' } \
	h1{color: ffd700; font-family: 'Harrington'} \
	A:link {color:202020} A:visited {color:404040} A:active{color:606060} A:hover{color:yellow} \
	.suffix {color:202020} .prefix {color:202020} A.subtopiclink A.closelink {font-style:italic} \
	A.backlink {color: #FF9900}"
	windowsize="500x500"
	prefix="Solus Productions Presents..."
	suffix=""

	getting_started
		linktext="Getting Started"
		title="Getting Started"
		text="You may have already noticed that you can play with this window open, simply by clicking on the BYOND window, then playing like normal, then clicking back to scroll. You'll need to do this while reading this next section.<BR><BR>The first thing you will do is select a character. The actual choices you have won't affect your gameplay in the long run, each selection can do anything that another selection can do. Whichever you decide to choose, you will recieve a boost in skills for that selection's particular strong points. A farmer, for example, gets bonuses in gathering and greenworks. If you are unsure what to pick, Explorer is recommended, as it gives a small boost to quite a few stats. Further information on what stats each selection excel at, can be found further in the guide. Before proceeding you should practice communicating with the world, click the Comm. tab and click chat, this will enable you to talk to the whole world. Now type in 'Hello everyone!' or a similar message to introduce yourself. The tell command can be used to send a private message, the say command will display text to anyone within your character's range of view, and the shout command will broadcast your message to nearby areas. Remember these and please be respectful while using any of the comm. commands."

	chapter_1
		title="Chapter 1: Food and Water"
		text="The basic rule of survival is food, water, shelter and clothing. You've already got the clothing and we'll discuss shelter later. There are many sources of food around the islands, such as wild lettuce (which can be found through the Commands tab, then the search command) along with meat from wild animals and fish from the water. It is recommended you stick with lettuce for now since it's the safest, and if you drop it on the ground you can gather seeds from it by right-clicking and selecting it (or using the Commands tab). Once you have some seeds you just need to find a clear 3x3 patch of grass and choose plant from the Commands Tab (or right-click the seeds) and they'll be planted beneath and around you. In a few days they'll grow into edible lettuce (diffrent from wild lettuce, gives slightly more when eaten). Water can be found almost everywhere and is the quickest way to regain energy. Beware of mushrooms, they only take a second to eat, and if your unlucky, only a second to kill."

	chapter_2
		title="Chapter 2: Gathering Resources and Crafting Tools"
		text="Before you can go out and hunt animals, catch fish, and build a home, you'll need tools, and to make tools, you'll need resources. Your first objective should be to secure a weapon, both for self-defense and for hunting. The most basic weapon is the wooden machete, so we'll go for that. For some unspeakable reason your able to chop trees without an axe, so go and find a tree then choose lumberjack from the Commands Tab. Once you've gathered enough wood, click the woodworking command and try to craft a wooden machete, it may take several attempts. Once you have one, try to kill gazelle and snakes, they're the easiest. If your feeling confident or started as a combatant, try wild dogs. Be sure to get meat through the command in the Command Tab after killing them. Next on your list of tools should be a fishing pole and a raft. For the fishing pole you'll need twine as well as wood, to get it, use the search command until you find some weeds, then drop them and use gather (this might take a while). Once you have a fishing pole you can fish by moving next to water and using the command (you should know how by now). Lastly, to build a raft or prefferably a boat, just gather the required wood and you'll be able to travel over water. Beware, rafts can capsize but boats won't."

	chapter_3
		title="Chapter 3: Shelter"
		text="Now that you have experience in gathering food and resources, and have a raft or boat to explore the islands, it's time to build a shelter. Gather as much wood as you can (at least 100 wood is recommended) and find a nice place you'd like to settle down in. Once you do, choose woodworking, then house, then the item of your choice. Note that it will be built directly under you, and once you step off walls you can't move back on them (although you can destroy them, but you'll only get a fraction of your resources back). Build a nice 3x3 walled in house with one door on any of it's sides, then if you have wood left a floor in the center. Now you've got a house! But beware, people can still vandalize and destroy it, which is why you should place a sentry with the proper command to guard it. Note that sentries can be destroyed too, so make sure they're completely protected by your house."

	chapter_4
		title="Chapter 4: Advanced Part 1"
		text="So you've mastered the basics of Survival have you? Then let's move on to the good stuff, you'll want metal tools and weapons which have a lower chance of breaking as well as a brick house which is much more durable. Not only that, but you need to start training your skills if you want to survive in the harsh enviroment and your enemies. To begin, make a wooden pickaxe, shovel (optional) and a few torches. When it's night out you'll want a torch ready so you can easily find your way around, the pickaxe allows you to use the mine command while next to cave walls to get ore. It may break often, but once you have enough ore, make a wooden stake then using the metalwork command make a metal pickaxe. This will laste MUCH longer and be helpful for the remaining items. Keep mining with your new pickaxe and gather enough ore for a cooking pan and a longsword, these will vastly improve your chances of survival as cooked food restores more and longswords are powerful weapons. Now that you've got all of that, build a brickrack out of wood and search around for mudpits. Once you find one start digging, shovels will speed up the process and improve your chances. Gather plenty of clay, then head back to your home and drop the brickrack, fill it, and wait until the bricks dry (this is visible if you pay attention) and then remove them. Now you can start replacing your old wooden walls with new brick ones!"

	chapter_5
		title="Chapter 5: Advanced Part 2"
		text="Now it's time to improve your skills and learn more advanced ones, such as magic. First things first, all skills improve by using them over time, it takes a lot of patience to train a skill but it's well worth while. Most of the skills are self-explanitory so I'll skip straight to the one you've been waiting for, Mysticism (magic). To use it, type cast in the command line (the pink box) and press enter, this will bring up a list of spells. Remember this, spells drain a lot of energy! Have a supply of water or food close by before practicing as it can kill you if your not careful. This is all the help I can give, if you still have questions please ask the other players."

mob
	verb/help()
		client.help.display()

client
	var/datum/helpsys/main/help
	New()
		..()
		help=new()
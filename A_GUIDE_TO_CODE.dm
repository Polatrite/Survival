
/*

Hi guys, Polatrite here. Thanks for downloading the Survival project. I hope
you can get some useful information out of this, this project is spawned off
several years of programming work.

It's always difficult to pick up a codebase from scratch and try to figure out
what is going on. Below I'm going to describe some of the most interesting files,
as well as examples on how to add some of the things you'd probably want to add
if you're modifying this code for play.

Most interesting files:

combat.dm				Everyone loves fighting, right? Also handles death.
craft data.dm			Handles all crafting, including recipes to make stuff.
global action procs.dm	Some of the base actions players can do, like eating and drinking
obj definitions.dm		Most of the objects in the game defined right here. Add new stuff, give it a graphic!
skill definitions.dm	Want to add new skills? Look no further.
skill handling.dm		More handling for skills, but nothing skill-specific.
objects\*.dm			More objects, this time separated by functional category. Add new weapons, tools, etc.
skills\*.dm				The actual meat of the skills - these are the actions you perform with different skills.
turfs\*.dm				Turf definitions for the landscape, here is where you could add a new tileset (like snow or lava)


Polatrite
Daniel Eichler
polatrite@gmail.com

*/

;
/* sd_DAL change log. See sd_DynamicAreaLighting.dm for instructions
on using the library.

Version 10: 5-27-08
* Added support for custom darkness icons, including customization of
	how many shades of darkness there are.
* Included several demo darkness icons and updated the demo program to
	allow you to switch them at runtime.

Version 9: 1-29-07
* SetOpacity() no longer causes errors due to mob.sight settings.

Version 8: 4-6-05
* Added some optimizations by Lummox JR.
* Fixed a bug that caused outside areas to generate improperly. (Xooxer)

Version 7: 2-23-04
* Added global sd_top_luminosity to cut down on the size of internally
	used lists.
* Added the turf sd_LumReset() proc.
* Changed area.New() to allow zeroing an area's sd_lighting var in the
	same tick it is created without the need to strip the darkness overlay
	manually. If you set sd_lighting after the first tick, you should be
	sure to remove the sd_darkimage from the area's overlays.

Version 6: 3-6-03
* Extended the mob procs slightly to compensate for mob.sight settings.
	The old versions would allow the light to shine through opaque walls
	if a mob's sight was set to SEE_TURFS.

Version 5: 2-25-03
* Changed the turf.sd_lumcount var to a tmp var, so sd_DAL works properly
	with save files.

Version 4: 12-21-02
* Fixed a bug that prevented outside areas from lighting properly if
	sd_outside was set in the map editor.

Version 3:
* Added support for daylight spilling indoors.
* Fixed an error involving atoms moving into and out of the contents of
	non-turfs.

Version 2:
* A major rehash of the internal workings. sd_DAL now works with the
	areas already in your game!
*/
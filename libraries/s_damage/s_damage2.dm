/************************************************
Spuzzum's Damage Numbers Library
                       By Jeremy "Spuzzum" Gibson
*************************************************

This multi-purpose library was created to flash
numbers above targets in a fashion similar to
various console RPGs on the market.

Since numbers are just numbers, and all this does
is display numbers, you don't have to use it for
damage by any means.  You can if you want to, and
that was the original purpose, but that does not
necessarily mean it is a pre-requisite.

Be sure to understand that this library does not
actually inflict damage on characters.  Since this
is a general-purpose library, you have to do the
dirty work yourself; this is just a graphical aid.


There is a numerical limitation of 9999.  If you
tell s_damage to display a number greater than
9999, it will round it off to 9999 to be able to
display it.  The display is also limited to
integer numbers, so subtracting decimal values
will be rounded to the nearest whole number.  If
this is done quite often, the results may seem
confusing to players, so I encourage you to use
whole numbers (using the round() proc) in your
damage procedures.

Also note that the library will force players to
download the damage numbers each time they are
displayed, but only if they are a new colour.
Thus, if you use a lot of colours, players are
likely to suffer lag.  Performance will likely
take a hit each time a new colour is displayed,
but thereafter if the same colour is used, no ill
effects will occur.

*************************************************

s_damage proc

See Also:
    rgb() proc

Format:
    s_damage(ref, num, colour = "#FFFFFF")

Args:
    ref: any mob, obj, or turf on the map to display the numbers over
    num: the numerical amount to display
    colour: an HTML colour constant that is used to colour the numbers


Example:
    var/num = rand(1,100)
    s_damage(src, num, "#FF0000")

This example will display a random number from 1
to 100, in red, over top of src.

One can also use the rgb() proc to make a colour.

    var/num = rand(1,100)
    s_damage(src, num, rgb(255,0,0))

This example has the same effect as the one above.

*************************************************

Alternatively, you can select one of the named-
constant colours.  These are colours that are
predefined; rather than being forced to enter an
HTML string (such as #FF99CC) you can enter
one of the constant terms.

    var/num = rand(1,100)
    s_damage(src, num, "red")

Here is a partial list of the acceptable colours.  If you're willing, you can
find a complete list within the initial setup process of colour2html.dm.

aliceblue     antiquewhite   aqua           aquamarine    azure          beige
bisque        black          blanchedalmond blue          blueviolet     brown
burlywood     cadetblue      chartreuse     chocolate     coral          cornflowerblue
cornsilk      crimson        cyan           darkblue      darkcyan       darkgoldenrod
darkgray      darkgreen      darkkhaki      darkmagenta   darkolivegreen darkorange
darkorchid    darkred        darksalmon     darkseagreen  darkslateblue  darkslategray
darkturquoise darkviolet     deeppink       deepskyblue   dimgray        dodgerblue
firebrick     floralwhite    forestgreen    fuchsia       gainsboro      ghostwhite
gold          goldenrod      gray           green         greenyellow    honeydew
hotpink       indianred      indigo         ivory         khaki          lavender
lavenderblush lawngreen      lemonchiffon   lightblue     lightcoral     lightcyan
lightgreen    lightgray      lightpink      lightsalmon   lightseagreen  lightskyblue
lightyellow   lime           limegreen      linen         magenta        maroon
mediumblue    mediumorchid   mediumpurple   midnightblue  mintcream      mistyrose
moccasin      navajowhite    navy           oldlace       olive          olivedrab
orange        orangered      orchid         palegoldenrod palegreen      paleturquoise
palevioletred papayawhip     peachpuff      peru          pink           plum
powderblue    purple         red            rosybrown     royalblue      saddlebrown
salmon        sandybrown     seagreen       seashell      sienna         silver
skyblue       slateblue      slategray      snow          springgreen    steelblue
tan           teal           thistle        tomato        turquoise      violet
wheat         white          whitesmoke     yellow        yellowgreen

Note that if you have made a spelling mistake, s_damage will complain and display
the number as white.

Also note that the # is required for the HTML colour code.  Without it, it will think
you're trying to use a named colour like the ones above.

************************************************/

//Conditional icon setting.  If you want to use a different icon
//than the default s_damage icon, add the line:
//  #define S_DAMAGE_ICON 'youriconname.dmi'
//replacing youriconname.dmi with the icon's filename,
//to your DME file above the line "//BEGIN_INCLUDE".
//If you don't put in a S_DAMAGE_ICON setting, this one
//will take precedence.

#ifndef S_DAMAGE_ICON
#define S_DAMAGE_ICON 's_damage.dmi'
#endif

/***********************************************/

obj/s_damage_num
	layer = LAYER_FLY
	name = " "
	icon_state = ""


proc/s_damage(ref, num, colour)
	if(!findtext(colour,"#"))
		colour = colour2html(colour)

	//Create a new icon copy and set its colour.
	var/icon = S_DAMAGE_ICON
	icon += colour

	num = round(num,1)

	if(num > 9999)
		num = 9999

	var/string = num2text(num)
	var/first_char
	var/second_char
	var/third_char
	var/fourth_char
	var/obj/s_damage_num/first
	var/obj/s_damage_num/second
	var/obj/s_damage_num/third
	var/obj/s_damage_num/fourth

	if(lentext(string) == 1)
		first_char = copytext(string,1,2)
		first = new

	if(lentext(string) == 2)
		second_char = copytext(string,1,2)
		second = new
		first_char = copytext(string,2,3)
		first = new

	if(lentext(string) == 3)
		third_char = copytext(string,1,2)
		third = new
		second_char = copytext(string,2,3)
		second = new
		first_char = copytext(string,3,4)
		first = new

	if(lentext(string) == 4)
		fourth_char = copytext(string,1,2)
		fourth = new
		third_char = copytext(string,2,3)
		third = new
		second_char = copytext(string,3,4)
		second = new
		first_char = copytext(string,4,5)
		first = new

	var/target = ref
	if(ismob(ref) || isobj(ref)) target = ref:loc

	if(first)  first.loc = target
	if(second) second.loc = target
	if(third)  third.loc = target
	if(fourth) fourth.loc = target

	if(first)
		first.icon = icon
		flick("---[first_char]",first)
	if(second)
		second.icon = icon
		flick("--[second_char]-",second)
	if(third)
		third.icon = icon
		flick("-[third_char]--",third)
	if(fourth)
		fourth.icon = icon
		flick("[fourth_char]---",fourth)

	spawn(10)
		if(first)  del(first)
		if(second) del(second)
		if(third)  del(third)
		if(fourth) del(fourth)
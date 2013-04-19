////////////////////////////////////////////////////////////
// Spuzzum's Cute Speech Bubble Library!                  //
//            by (you guessed it) Jeremy "Spuzzum" Gibson //
////////////////////////////////////////////////////////////
/*

Want a fun feel to your game, but haven't thought of a really
good way to do it?  Well, use my Cute Speech Bubble library!

It's very easy to use; just call the mob procs as appropriate
to popup a speech bubble over their head!  If you want, you
can also specify a duration of time to show the bubble.  Don't
worry, the bubbles dissipate automatically without need of a
specific duration.

If you're feeling creative, open up the "blank" icon state in
the bubbles.dmi file, copy it, and make your own bubbles, using
the BubbleCustom proc.  You also need to copy the "popup" and
"popdown" icon states if you put your new bubble in a different
file than bubbles.dmi.

Here's the procs:

  mob/BubbleTalk(duration)
    Pops up a speech bubble, lasting for -duration-, or three
  seconds if -duration- is not specified.  Generally, you'll
  want to customize the duration on speech bubbles.

  mob/BubbleHappy(duration)
    Pops up a happy face icon, lasting for -duration-, or one
 	second if -duration- is not specified.

 	mob/BubbleAngry(duration)
 	  Pops up a cloud of anger!  It lasts for -duration-, or one
 	second if -duration- is not specified.

 	mob/BubbleSigh(duration)
 	  Pops up an anime teardrop, lasting for -duration- or one
 	second if -duration- is not specified.

 	mob/BubbleX(duration)
 	  Pops up a big X, that lasts for -duration- or one second
 	if -duration- is not specified.

 	mob/BubbleO(duration)
 	  Pops up a big O, that lasts for -duration- or one second
 	if -duration- is not specified.

 	mob/BubbleSad(duration)
 	  Pops up a sad face, lasting for blah blah blah.

 	mob/BubbleFrown(duration)
 	  Pops up a frowning face.

 	mob/BubbleExclaim(duration)
 	  Pops up an exclamation point.

 	mob/BubbleQuery(duration)
 	  Pops up a question mark.

 	mob/BubbleLove(duration)
 	  Pops up a love heart!  (No, there is no double meaning to
 	"bubble love", sicko).

 	mob/BubbleIdea(duration)
 	  Pops up a blinking lightbulb.

 	mob/BubbleSing(duration)
 	  Pops up a musical note!

 	mob/BubbleGrin(duration)
 	  Pops up a really infectious grin.

 	mob/BubbleLaugh(duration)
 	  Laugh your head off!

 	mob/BubbleWink(duration)
 	  Pops up a nice little wink.

 	mob/BubbleTongue(duration)
 	  Pops up a face sticking its tongue out.

 	mob/BubbleCustom(icon,icon_state,duration)
 	  Pop up your own custom bubble.  See below for more detail.


Use BubbleCustom() to make your own bubbles.  In fact, BubbleCustom()
is what all other Bubble___() procs use to display their bubbles.
Here's what you need to do:
- copy the "popup", "blank", and "popdown" states into an icon of
  your own choice
- edit the blank state as you see fit, and rename it to a descriptive
  name (like "skull")
- call BubbleCustom(icon,icon_state,duration) with your new icon and
  state subbed in
- it's as easy as that!


Include the file 'bubbles.dmi' to use this.  If you already
have a bubbles.dmi file, rename this bubbles.dmi to something
else and change the ICON_NAME to the new name.*/

#define ICON_NAME 'bubbles.dmi'

mob
	var
		obj/s_bubble/s_bubble
	proc
		BubbleTalk(duration = 30)
			src.BubbleCustom(ICON_NAME,"talk",duration)

		BubbleHappy(duration = 10)
			src.BubbleCustom(ICON_NAME,"happy",duration)

		BubbleAngry(duration = 10)
			src.BubbleCustom(ICON_NAME,"anger",duration)

		BubbleSigh(duration = 10)
			src.BubbleCustom(ICON_NAME,"sigh",duration)

		BubbleX(duration = 10)
			src.BubbleCustom(ICON_NAME,"X",duration)

		BubbleO(duration = 10)
			src.BubbleCustom(ICON_NAME,"O",duration)

		BubbleSad(duration = 10)
			src.BubbleCustom(ICON_NAME,"sad",duration)

		BubbleFrown(duration = 10)
			src.BubbleCustom(ICON_NAME,"mad",duration)

		BubbleExclaim(duration = 10)
			src.BubbleCustom(ICON_NAME,"!",duration)

		BubbleQuery(duration = 10)
			src.BubbleCustom(ICON_NAME,"?",duration)

		BubbleLove(duration = 10)
			src.BubbleCustom(ICON_NAME,"love",duration)

		BubbleIdea(duration = 10)
			src.BubbleCustom(ICON_NAME,"idea",duration)

		BubbleSing(duration = 10)
			src.BubbleCustom(ICON_NAME,"sing",duration)

		BubbleGrin(duration = 10)
			src.BubbleCustom(ICON_NAME,"grin",duration)

		BubbleTongue(duration = 10)
			src.BubbleCustom(ICON_NAME,"tongue",duration)

		BubbleLaugh(duration = 10)
			src.BubbleCustom(ICON_NAME,"laugh",duration)

		BubbleWink(duration = 10)
			src.BubbleCustom(ICON_NAME,"wink",duration)

		BubbleCustom(icon as icon,icon_state as text,duration = 10)
			del(src.s_bubble)
			src.s_bubble = new
			spawn() src.s_bubble.Display(src,icon,icon_state,duration)

obj/s_bubble/proc/Display(mob/M,icon,icon_state,duration)
	src.pixel_x = 7
	src.layer = LAYER_FLY
	var/turf/T = locate(M.x,M.y+1,M.z)
	if(T)
		src.loc = T
	else
		src.loc = M.loc
	src.icon = icon
	flick("popup",src)
	sleep(2)
	src.icon_state = icon_state
	sleep(duration)
	flick("popdown",src)
	sleep(2)
	del(src)

mob/Move()
	. = ..()
	if(src.s_bubble)
		var/turf/T = locate(src.x,src.y+1,src.z)
		if(T)
			src.s_bubble.loc = T
		else
			src.s_bubble.loc = src.loc
	return .

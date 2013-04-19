/*
	The infamous talking not-so-smileys demo.
 */

var/dmifont/ComicSansMS7pt_AA16/textfont = new
var/dmifont/ComicSansMSItalic7pt_AA16/itfont = new
var/dmifont/Arial7pt/namefont = new
var/dmifont/BitstreamVeraSansBold36pt_AA16/hugefont = new

world
	name = "DmiFonts Demo"
	maxx = 13
	maxy = 13

	New()
		var/icon/I = hugefont.DrawText("Huge text", 0, 0, -1, DF_SET_WIDTH | DF_JUSTIFY_CENTER)
		I.DFP_Outline("#ffffff", "#000000")
		for(var/j=0, j<I.setheight, ++j)
			var/py = (13+j*2-I.setheight) * 16
			for(var/i=0, i<I.setwidth, ++i)
				var/px = (13+i*2-I.setwidth) * 16
				var/obj/O = new
				O.layer = OBJ_LAYER
				O.icon = I
				O.icon_state = "[i],[j]"
				O.pixel_x = px & 31
				O.pixel_y = py & 31
				O.loc = locate((px>>5)+1, (py>>5)+1, 1)

turf
	icon='floor.dmi'

mob
	icon='player.dmi'
	var/talkbubble/bubble

	verb/Say(msg as text)
		if(!msg) return
		if(bubble) del(bubble)
		var/list/msglist = new
		var/i = findtext(msg, "<I>")
		var/j = findtext(msg, "</I>")
		var/k = 1
		var/prevfont
		while(i || j)
			var/next
			if(!i) next = j
			else if(!j) next = i
			else next = min(i, j)
			msglist += copytext(msg, k, next)
			if(next == i)
				if(!prevfont)
					msglist += itfont
					prevfont = itfont
					k = next + 3
				else
					msg = copytext(msg, 1, next) + copytext(msg, next + 3)
					k = next
			else if(next == j)
				if(prevfont == itfont)
					msglist += null
					prevfont = null
					k = next + 4
				else
					msg = copytext(msg, 1, next) + copytext(msg, next + 4)
					k = next
			i = findtext(msg, "<I>", k)
			j = findtext(msg, "</I>", k)
		msglist += copytext(msg, k)

		// rebuild the message, stripping out all HTML tags except <I>
		msg = ""
		prevfont = null
		for(var/item in msglist)
			if(isnull(item))
				msg += "</I>"
				prevfont = null
			else if(item == itfont)
				msg += "<I>"
				prevfont = itfont
			else msg += html_encode(item)
		if(prevfont) msg += "</I>"

		bubble = new(usr, msglist)
		world << "<B>[name]:</B> [msg]"

	verb/Color(r as num, g as num, b as num)
		set desc = "Change color: Red, Green, Blue"
		r=max(0, min(255, round(r, 1)))
		g=max(0, min(255, round(g, 1)))
		b=max(0, min(255, round(b, 1)))
		var/icon/ic = new('player.dmi')
		ic.SwapColor(rgb(255, 255, 0), rgb(r, g, b))
		icon = ic

	verb/NameColor(r as num, g as num, b as num)
		set desc = "Change color: Red, Green, Blue"
		r=max(0, min(255, round(r, 1)))
		g=max(0, min(255, round(g, 1)))
		b=max(0, min(255, round(b, 1)))
		CreateName(r, g, b)

	Login()
		..()
		CreateName()

	proc/CreateName(r=255, g=r, b=r)
		var/outline = "#fff"
		if(30*r+59*g+11*b > 7650) outline = "#000"
		namefont.QuickName(src, key, rgb(r,g,b), outline)

	Logout()
		del(src)


talkbubble
	var/list/objs
	var/list/moremsg

	New(mob/M,list/msg)
		moremsg = new
		objs = new
		if(!M || !msg || !msg.len) del(src)
		var/bdir = NORTHEAST
		if(M.x >= world.maxx) bdir ^= 12	// swap east/west
		if(M.y >= world.maxy) bdir ^= 3	// swap north/south
		var/width
		var/height

		// In previous versions of DmiFonts, the /dmifonttextline datum required
		// manual deletion. This is no longer necessary.
		var/dmifonttextline/txt

		// choose a talk bubble size
		if(textfont.WillFitMultiFont(msg, width=28, maxheight=22))
			width=28
			txt=textfont.GetLinesMultiFont(msg, width = 28, maxheight = 22,\
			                               leftover = moremsg)
		else
			width=60
			txt=textfont.GetLinesMultiFont(msg, width=60, flags = DF_WRAP_ELLIPSIS,\
			                               maxheight = 30,leftover = moremsg)
		if(!txt) del(src)

		height = txt.TotalHeight()
		// set centerline: 12 or 20 for a small bubble, 16 for a large bubble
		var/y = width == 28 ? (bdir & SOUTH ? 20 : 12) : 16
		var/icon/s=textfont.DrawTextMultiFont(txt,\
		                                      round((width - txt.TotalWidth()) / 2) + 2,\
		                                      y - round(height / 2))
		s.Blend("#000000", ICON_MULTIPLY)

		var/icon/ic		// part of the bubble
		var/icon/ti		// part of the text
		var/image/im

		// small bubble
		if(width == 28)
			ic=new('bubble.dmi', "")
			if(bdir & WEST) ic.Flip(WEST)
			if(bdir & SOUTH) ic.Flip(SOUTH)
			ti = icon(s,"0,0")
			if(ti) ic.Blend(ti, ICON_OVERLAY)
			im = new/image(icon = ic, loc = M)
			im.pixel_x = (bdir & EAST) ? 32 : -32
			im.pixel_y = (bdir & NORTH) ? 32 : -32
			objs += im
		// large bubble
		else
			// left side (1 of 2)
			ic = new('bubble.dmi', "left")
			ti = icon(s,"0,0")
			if(ti) ic.Blend(ti, ICON_OVERLAY)
			im = new/image(icon = ic, loc = M)
			im.pixel_x = (bdir & EAST) ? 0 : -32
			im.pixel_y = (bdir & NORTH) ? 32 : -32
			objs += im
			// right side (2 of 2)
			ic = new('bubble.dmi', "right")
			ti = icon(s,"1,0")
			if(ti) ic.Blend(ti, ICON_OVERLAY)
			im = new/image(icon = ic, loc = M)
			im.pixel_x = (bdir & EAST) ? 32 : 0
			im.pixel_y = (bdir & NORTH) ? 32 : -32
			objs += im
			// tail
			ic = new('bubble.dmi', "tail")
			if(bdir & WEST) ic.Flip(WEST)
			if(bdir & SOUTH) ic.Flip(SOUTH)
			im = new/image(icon = ic, loc = M)
			im.pixel_x = (bdir & EAST) ? 32 : -32
			im.pixel_y = (bdir & NORTH) ? 1 : -1
			objs += im
		// show image(s) to players
		for(im in objs) world << im
		// wait 3.5 seconds for more, or 5 seconds to delete bubble
		spawn(moremsg.len ? 35 : 50)
			if(moremsg && moremsg.len && M) M.bubble = new(M, moremsg)
			del(src)

	Del()
		for(var/image/I in objs) del(I)
		..()

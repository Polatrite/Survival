/**************************************
Named Colours to HTML Constants Library
             by Jeremy "Spuzzum" Gibson
***************************************

This library converts colour strings into
HTML numerical code.  It is used as follows:

var/code = colour2html("white")

This will search through its database and
return "#FFFFFF", which is the matching
colour for the string "white".

**************************************/

world/New()
	..()
	HtmlAssosciate("aliceblue","f0f8ff")
	HtmlAssosciate("antiquewhite","faebd7")
	HtmlAssosciate("aqua","00ffff")
	HtmlAssosciate("aquamarine","7fffd4")
	HtmlAssosciate("azure","f0ffff")
	HtmlAssosciate("beige","f5f5dc")
	HtmlAssosciate("bisque","ffe4c4")
	HtmlAssosciate("black","000000")
	HtmlAssosciate("blanchedalmond","ffebcd")
	HtmlAssosciate("blue","0000ff")
	HtmlAssosciate("blueviolet","8a2be2")
	HtmlAssosciate("brown","a52a2a")
	HtmlAssosciate("burlywood","deb887")
	HtmlAssosciate("cadetblue","5f9ea0")
	HtmlAssosciate("chartreuse","7fff00")
	HtmlAssosciate("chocolate","d2691e")
	HtmlAssosciate("coral","ff7f50")
	HtmlAssosciate("cornflowerblue","6495ed")
	HtmlAssosciate("cornsilk","fff8dc")
	HtmlAssosciate("crimson","dc143c")
	HtmlAssosciate("cyan","00ffff")
	HtmlAssosciate("darkblue","00008b")
	HtmlAssosciate("darkcyan","008b8b")
	HtmlAssosciate("darkgoldenrod","b8b60b")
	HtmlAssosciate("darkgrey","a9a9a9")
	HtmlAssosciate("darkgreen","006400")
	HtmlAssosciate("darkkhaki","bdb76b")
	HtmlAssosciate("darkmagenta","8b008b")
	HtmlAssosciate("darkolivegreen","556b2f")
	HtmlAssosciate("darkorange","ff8c00")
	HtmlAssosciate("darkorchid","9932cc")
	HtmlAssosciate("darkred","8b0000")
	HtmlAssosciate("darksalmon","e9967a")
	HtmlAssosciate("darkseagreen","8fbc8f")
	HtmlAssosciate("darkslateblue","483d8b")
	HtmlAssosciate("darkslategray","2f4f4f")
	HtmlAssosciate("darkturquoise","00ced1")
	HtmlAssosciate("darkviolet","9400d3")
	HtmlAssosciate("deeppink","ff1493")
	HtmlAssosciate("deepskyblue","00bfff")
	HtmlAssosciate("dimgrey","696969")
	HtmlAssosciate("dodgerblue","1e90ff")
	HtmlAssosciate("firebrick","b22222")
	HtmlAssosciate("floralwhite","fffaf0")
	HtmlAssosciate("forestgreen","228b22")
	HtmlAssosciate("fuchsia","ff00ff")
	HtmlAssosciate("gainsboro","dcdcdc")
	HtmlAssosciate("ghostwhite","f8f8ff")
	HtmlAssosciate("gold","ffd700")
	HtmlAssosciate("goldenrod","daa520")
	HtmlAssosciate("grey","808080")
	HtmlAssosciate("green","008000")
	HtmlAssosciate("greenyellow","adff2f")
	HtmlAssosciate("honeydew","f0fff0")
	HtmlAssosciate("hotpink","ff69b4")
	HtmlAssosciate("indianred","cd5c5c")
	HtmlAssosciate("indigo","4b0082")
	HtmlAssosciate("ivory","fffff0")
	HtmlAssosciate("khaki","f0e68c")
	HtmlAssosciate("lavender","e6e6fa")
	HtmlAssosciate("lavenderblush","fff0f5")
	HtmlAssosciate("lawngreen","7cfc00")
	HtmlAssosciate("lemonchiffon","fffacd")
	HtmlAssosciate("lightblue","add8e6")
	HtmlAssosciate("lightcoral","f08080")
	HtmlAssosciate("lightcyan","e0ffff")
	HtmlAssosciate("lightgoldenrodyellow","fafad2")
	HtmlAssosciate("lightgreen","90ee90")
	HtmlAssosciate("lightgrey","d3d3d3")
	HtmlAssosciate("lightpink","ffb6c1")
	HtmlAssosciate("lightsalmon","ffa07a")
	HtmlAssosciate("lightseagreen","20b2aa")
	HtmlAssosciate("lightskyblue","87cefa")
	HtmlAssosciate("lightslategrey","778899")
	HtmlAssosciate("lightsteelblue","b0c4de")
	HtmlAssosciate("lightyellow","ffffe0")
	HtmlAssosciate("lime","00ff00")
	HtmlAssosciate("limegreen","32cd32")
	HtmlAssosciate("linen","faf0e6")
	HtmlAssosciate("magenta","ff00ff")
	HtmlAssosciate("maroon","800000")
	HtmlAssosciate("mediumaquamarine","66cdaa")
	HtmlAssosciate("mediumblue","0000cd")
	HtmlAssosciate("mediumorchid","ba55d3")
	HtmlAssosciate("mediumpurple","9370db")
	HtmlAssosciate("mediumseagreen","3cb371")
	HtmlAssosciate("mediumslateblue","7b68ee")
	HtmlAssosciate("mediumspringgreen","00fa9a")
	HtmlAssosciate("mediumturquoise","48d1cc")
	HtmlAssosciate("mediumvioletred","c71585")
	HtmlAssosciate("midnightblue","191970")
	HtmlAssosciate("mintcream","f5fffa")
	HtmlAssosciate("mistyrose","ffe4e1")
	HtmlAssosciate("moccasin","ffe4b5")
	HtmlAssosciate("navajowhite","ffdead")
	HtmlAssosciate("navy","000080")
	HtmlAssosciate("oldlace","fdf5e6")
	HtmlAssosciate("olive","808000")
	HtmlAssosciate("olivedrab","6b8e23")
	HtmlAssosciate("orange","ffa500")
	HtmlAssosciate("orangered","ff4500")
	HtmlAssosciate("orchid","da70d6")
	HtmlAssosciate("palegoldenrod","eee8aa")
	HtmlAssosciate("palegreen","98fb98")
	HtmlAssosciate("paleturquoise","afeeee")
	HtmlAssosciate("palevioletred","db7093")
	HtmlAssosciate("papayawhip","ffefd5")
	HtmlAssosciate("peachpuff","ffdab9")
	HtmlAssosciate("peru","cd853f")
	HtmlAssosciate("pink","ffc0cd")
	HtmlAssosciate("plum","dda0dd")
	HtmlAssosciate("powderblue","b0e0e6")
	HtmlAssosciate("purple","800080")
	HtmlAssosciate("red","ff0000")
	HtmlAssosciate("rosybrown","bc8f8f")
	HtmlAssosciate("royalblue","4169e1")
	HtmlAssosciate("saddlebrown","8b4513")
	HtmlAssosciate("salmon","fa8072")
	HtmlAssosciate("sandybrown","f4a460")
	HtmlAssosciate("seagreen","2e8b57")
	HtmlAssosciate("seashell","fff5ee")
	HtmlAssosciate("sienna","a0522d")
	HtmlAssosciate("silver","c0c0c0")
	HtmlAssosciate("skyblue","87ceed")
	HtmlAssosciate("slateblue","6a5acd")
	HtmlAssosciate("slategray","708090")
	HtmlAssosciate("snow","fffafa")
	HtmlAssosciate("springgreen","00ff7f")
	HtmlAssosciate("steelblue","4682b4")
	HtmlAssosciate("tan","d2b48c")
	HtmlAssosciate("teal","008080")
	HtmlAssosciate("thistle","d8bfd8")
	HtmlAssosciate("tomato","ff6347")
	HtmlAssosciate("turquoise","40e0d0")
	HtmlAssosciate("violet","ee82ee")
	HtmlAssosciate("wheat","f5deb3")
	HtmlAssosciate("white","ffffff")
	HtmlAssosciate("whitesmoke","f5f5f5")
	HtmlAssosciate("yellow","ffff00")
	HtmlAssosciate("yellowgreen","a9cd32")

var/html_colours[0]

proc/HtmlAssosciate(colour, html)
	html_colours["[colour]"] = html


proc/colour2html(colour)
	var/T
	for(T in html_colours)
		if(T == colour) break
	if(!T)
		world.log << "Warning!  Could not find matching colour entry for '[colour]'."
		return "#FFFFFF"

	return ("#" + uppertext(html_colours["[colour]"]) )
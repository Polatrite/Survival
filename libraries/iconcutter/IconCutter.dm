/*
	IconCutter version 2
	by Lummox JR

	Supports various autojoin icon types:

	16-state joining:
		Only cardinal directions (east, west, north, south) are considered for
		joining. Corners don't count at all. This is a common join for roads
		or lines.

	47-state joining:
		The standard for most autojoining, this allows for inside corners or
		filled corners as needed. This is common for walls, terrain, and
		pretty much anything else.

	82-state joining:
		A very rare form of joining that combines the properties of 16-state
		and 161-state joining. There is no difference between an inside corner
		and a filled corner, just like in 16-state, but partial corners still
		count like in 161-state. This only counts corners if one and only one
		of the adjacent cardinal directions also adjoins. An example use might
		be a set of road icons in which a partial corner represents a
		crosswalk before an intersection/T.

	161-state joining:
		This hybrid between 47- and 256-state joins allows corners to be
		partially filled. Alternatively this can be seen as "incomplete edges".
		This can be used for smoother corners than standard 47-state joining,
		or unique effects like edge railings which may end on one side but
		continue on another.

	256-state joining:
		All join directions are independent of the others. This type is seldom
		used because most diagonal joins are thicker than 1 pixel and would
		require another tile to either side to complete the image.

	Foomerian 13-state joining:
		This special form of 47-state joins accepts only a solid fill, a single
		edge, a single outer corner with a solid corner opposite, or a single
		inside corner with the other corners all filled. It requires only 13
		icons, but requires a special layout in which 1) all joining tiles must
		be part of a 2x2 block, and 2) two such blocks may not join only at the
		corner (which would cause the common block to have 2 inside corners).
		The main attraction of this join type is that it allows greater
		artistic freedom because other edges/corners need not be considered.

	Neo-Foomerian 15-state joining:
		A hybrid form of 13-state joining, this form eliminates the rule that
		2x2 blocks may not join at a corner, allowing two tiles that have 2
		opposite inside corners. This is a good choice for those who would like
		the artistic freedom of 13-state joining without quite all of the
		layout restrictions.
 */

var/list/alljointypes = list(\
	"16-state: No filled corners"=16,
	"47-state: Filled corners"=47,
	"82-state: Inside corners = filled corners"=82,
	"161-state: Incomplete edges allowed"=161,
	"256-state: Independent corners allowed"=256,
	"Classic Foomerian: 13-state"=13,
	"Neo-Foomerian: 15-state"=15\
	)

var/list/suffixes=list("0"=16,"17"=16,"68"=16,"85"=16,"170"=256,"187"=161,"238"=161,"255"=47)

icon
	var/list/joined
	var/list/playicons
	var/playhash

mob
	var/icon/myicon
	var/icon/working
	var/outfile
	var/fname

mob/Login()
	DisplayStates()

mob/proc/LoadIcon()
	var/newicon=input("Choose an icon") as null|icon
	if(newicon)
		myicon=newicon
		working=null
		fname="[myicon]"
		outfile="[myicon]"
		if(findtext(outfile,".dmi")==length(outfile)-3 || findtext(outfile,".png")==length(outfile)-3 || findtext(outfile,".bmp")==length(outfile)-3)
			outfile=copytext(outfile,1,length(outfile)-3)
		outfile+="-joined"
		DisplayStates()
		return 1

mob/proc/Help()
	usr << browse('IconCutter.html',"window=help;size=500x400")

proc/NextState(i,join=47)
	++i
	var/j
	switch(join)
		if(16)
			j=i&170
			while(j)
				j^=j&(j-1)
				i+=j
				j=i&170
		if(47)
			// set corners must have at least 1 adjacent bit set
			// look for invalid corner bits and skip ahead
			do
				i|=(i>>7)	// if bit 7 set, bit 0 must be set
				j=i|(i<<8)
				j&=j>>2
				j=(~j)&(i>>1)&85
				i += j
			while(j)
		if(82)
			// weird hybrid autojoin between 16 and 161;
			// set corners must have only 1 adjacent bit set
			do
				if((i&193) == 128) i|=1		// if bit 7 set, bit 6 or 1 must be set (but not both!)
				else if((i&193) == 193) ++i	// move on if both corners set; otherwise states get skipped
				j=i|(i<<8)
				j^=j>>2
				j=(~j)&(i>>1)&85
				while(i&(j>>2)) j>>=2
				i += j
			while(j)
		if(161)
			// weird hybrid autojoin between 47 and 255;
			// set corners must have 1 or both adjacent bits set
			do
				if((i&193) == 128) i|=1		// if bit 7 set, bit 6 or 1 must be set
				j=i|(i<<8)
				j|=j>>2
				j=(~j)&(i>>1)&85
				i += j
			while(j)
		if(13,15)	// Foomerian join
			do
				i=NextState(i,47)
				if(i>=256) return i
				j=(i^(i&((i>>1)|(i<<1)|(i>>7))))&85
				j^=(j&(j-1))
				// skip 2 states disallowed by classic 13-state join
				if(join==13 && (i==119 || i==221)) j=1
			while(j)
	return i

proc/FirstState(join=47)
	if(join<16) return NextState(0,join)
	return 0

proc/DefaultState(join=47)
	if(join<16) return 255
	return 0

proc/TrueState(i,join=47)
	switch(join)
		if(16)
			i &= 85
		if(47)
			// set corners must have at least 1 adjacent bit set
			// look for invalid corner bits and skip ahead
			i &= ((i<<1) & ((i<<7)|(i>>1))) | 85
		if(82)
			// weird hybrid autojoin between 16 and 161;
			// set corners must have only 1 adjacent bit set
			i &= ((i<<1) ^ (i<<7) ^ (i>>1)) | 85
		if(161)
			// weird hybrid autojoin between 47 and 255;
			// set corners must have 1 or both adjacent bits set
			i &= (i<<1) | (i<<7) | (i>>1) | 85
		if(13,15)
			// Foomerian joining
			// only 1 outside corner, a full side, 1 inside corner, or solid
			// 15-state allows 2 opposite inside corners
			var/j = i & (((i<<1) & ((i<<7)|(i>>1))) | 85)
			if(i!=j) return DefaultState(join)
			if(join==13 && (i==119 || i==221)) return DefaultState(join)
			j=(i^(i&((i>>1)|(i<<1)|(i>>7))))&85
			if(j) return DefaultState(join)
	return i

proc/ReadStates(ic)
	var/list/states = icon_states(ic)
	var/list/L = new
	var/header,cur
	for(cur in states)
		var/i
		for(i=length(cur),i>0,--i)
			var/ch=text2ascii(cur,i)
			if(ch<48 || ch>57) break
		if(i<length(cur))
			header=copytext(cur,1,i+1)
			if(header in L) continue
			if(!("[header]0" in states)) continue
			if(!("[header]17" in states)) continue
			if(!("[header]68" in states)) continue
			if(!("[header]85" in states)) continue
			var/jointype=16
			if(("[header]255" in states))
				jointype=47
				if(("[header]187" in states) && ("[header]238" in states))
					jointype=161
					if("[header]170" in states)
						jointype=256
			else
				if(("[header]187" in states) && ("[header]238" in states))
					jointype=82
			L[header]=jointype
	return L

proc/BuildStateIcons(icon/ic,srcicon,state,jointype)
	var/i,j,k,s
	var/icon/ic2
	var/states=icon_states(srcicon)
	var/list/mainicons=new
	for(i in suffixes)
		if("[state][i]" in states)
			ic2=new(srcicon,"[state][i]")
			mainicons[i]=ic2
		else
			ic2=new(srcicon,"[state][text2num(i)&85]")
			mainicons[i]=ic2
	var/list/corners=new
	for(i=3,i<256,i<<=2)
		var/list/L=new
		corners+=null
		corners[corners.len]=L
		for(j in mainicons)
			ic2=new(mainicons[j])
			if(i&15) ic2.DrawBox(null,1,1,16,32)
			else ic2.DrawBox(null,17,1,32,32)
			if(i&195) ic2.DrawBox(null,1,1,32,16)
			else ic2.DrawBox(null,1,17,32,32)
			L[j]=ic2
	if(!ic) ic=new(mainicons["[DefaultState(jointype)]"])
	if(ic.playicons && ic.joined[state]) del(ic.playicons)
	var/list/icstates=icon_states(ic)
	for(i=FirstState(jointype),i<256,i=NextState(i,jointype))
		// use existing icons if possible
		s="[i]"
		if("[state][i]" in icstates) continue	// icon is already there
		if(s in mainicons)
			ic.Insert(mainicons[s],"[state][i]");continue
		for({j=1;k=7},j<=4,{++j;k=(k<<2)|(k>>6)})
			var/n=i&k
			if(!n) s="0"
			else if(n==(k&255)) s="255"
			else if(n%5)
				if(n&(85|(n-1)))
					if(n%3) s=(n&68)?"68":"17"
					else s=(n&68)?"238":"187"
				else s="170"
			else s="85"
			if(j==1) ic2=new(corners[1][s])
			else ic2.Blend(corners[j][s],ICON_OR)
		ic.Insert(ic2,"[state][i]")
	if(!ic.joined) ic.joined=new
	ic.joined[state]=jointype
	return ic

mob/proc/DisplayStates()
	var/html="<html><head>\n\
		<style>\n\
		body {font:80% \"Trebuchet MS\",Arial,Helvetica,sans-serif}\n\
		.title {font:bold 200% \"Trebuchet MS\",Arial,Helvetica,sans-serif}\n\
		h3 {font:bold 150% \"Trebuchet MS\",Arial,Helvetica,sans-serif}\n\
		td {font-size:80%}\n\
		.icon {width:32px; height:32px}\n\
		</style>\n\
		</head>\n\
		<body>\n\
		<div class=title>IconCutter</div>\n\
		<form method=get action=\"byond://\"><input type=hidden name=icon>\n\n\
		<a href=\"byond://?load\">Load a new icon</a> \
		[working?"| <a href=\"byond://?save\">Save the joined icon</a> ":""]\
		| <a href=\"byond://?help\">Help</a><br />\n\n"
	if(myicon)
		var/list/joinlist=ReadStates(myicon)
		html+="<h3>[myicon]</h3>\n\n"
		var/list/states=icon_states(myicon)
		var/list/groups=new
		var/state
		for(state in joinlist)
			html+="<p>[state ? "\"[state]\"" : "Default state"] \
				<i>(suited for [joinlist[state]]-state joining)</i><br />\n\
				<select name=\"join:[html_encode(state)]\">\n\
				<option value=0>No change</option>\n"
			for(var/i in alljointypes)
				html+="<option value=[alljointypes[i]][joinlist[state]==alljointypes[i]?" selected":""]>[i]</option>\n"
			html+="</select>\n\
				<input type=submit value=\"[working?"Rej":"J"]oin now\" /><br />\n"
			if(working && working.joined && working.joined[state])
				html+="<i>Joined as [working.joined[state]]-state, ready to save</i>\
					| <a href=\"byond://?play&state=[state]\">Play</a><br />\n"
			html+="<table cellspacing=16 cellpadding=0><tr>\n"
			states -= "[state]"
			for(var/i in suffixes)
				if("[state][i]" in states)
					states -= "[state][i]"
					src << browse_rsc(new/icon(myicon,"[state][i]"),"icon-[html_encode(state)][i].png")
					html+="<td align=center><img class=icon src=\"icon-[html_encode(state)][i].png\" /><br />[i]"
					if(suffixes[i]>joinlist[state])
						html+=" <i>(unused)</i>"
					html+="</td>\n"
			html+="</tr></table></p>\n"
		// now do what's left
		for(state in states)
			var/i
			for(i=length(state),i>0,--i)
				var/ch=text2ascii(state,i)
				if(ch<48 || ch>57) break
			i=copytext("[state]",1,i+1)
			if(groups[i]) groups[i]+=state
			else groups[i]=list("[state]")
		for(state in groups)
			html+="<p>[state ? "\"[state]\"" : "Default state"] \
				<i>(not suited for joining)</i><br />\n\
				<table><tr>\n"
			for(var/i in groups[state])
				src << browse_rsc(new/icon(myicon,"[i]"),"icon-[html_encode(i)].png")
				html+="<td align=center><img class=icon src=\"icon-[html_encode(i)].png\" /><br />[i]</td>\n"
			html+="</tr></table></p>\n"
	html += "\n</form></body></html>"
	src << browse(html)

client/Topic(href, href_list[], hsrc)
	if(usr.myicon && ("icon" in href_list))
		var/icon/ic
		for(var/state in href_list)
			var/jointype=href_list[state] ? text2num(href_list[state]) : 0
			if(!jointype) continue
			state=html_decode(state)
			if(findtext(state,"join:")!=1) continue
			state=html_decode(copytext(state,6))
			ic=BuildStateIcons(ic,usr.myicon,state,jointype)
		usr.working = ic
		usr.DisplayStates()
		return
	if("help" in href_list)
		return usr.Help()
	if("load" in href_list)
		return usr.LoadIcon()
	if("save" in href_list)
		if(usr.working && usr.outfile) usr << ftp(usr.working,"[usr.outfile].dmi")
		return
	if("play" in href_list)
		// replace null with a random value
		if(!href_list["play"]) href_list["play"]="[rand(0,255)]"
		return usr.PlayWindow("[href_list["state"]]",text2num(href_list["play"]))
	return ..()

mob/proc/PlayWindow(state,n)
	if(!working || !working.joined || !working.joined[state]) return
	var/jointype=working.joined[state]
	if(!n) n=0	// failsafe
	n&=255		// another failsafe
	var/html="<html>\n<head>\n\
		<title>Play</title>\n\
		<style>\n\
		body {font:80% \"Trebuchet MS\",Arial,Helvetica,sans-serif}\n\
		td {font-size:80%}\n\
		.icon {width:32px;height:32px;border:0}\n\
		table {border:1 dotted black}\n\
		</style>\n</head>\n\
		<body>\n<center><table cellpadding=0 cellspacing=0>\n"
	if(!working.playicons)
		working.playicons=new
		working.playhash="[world.timeofday]"
	var/list/dirs=list(128,1,2,64,0,4,32,16,8)
	var/i,j,k=0,i2,j2,k2,k3
	for(j=1,j<=3,++j)
		html+="<tr>\n"
		for(i=1,i<=3,++i)
			var/tn=-1
			if(!dirs[++k])
				tn=n
			else if(n&dirs[k])
				tn=0
				k2=0;k3=k-5
				for(j2=j-1,j2<=j+1,++j2)
					for(i2=i-1,i2<=i+1,++i2)
						++k2;++k3
						if(i2<1 || i2>3 || j2<1 || j2>3 || k3==5 || (n&dirs[k3])) tn|=dirs[k2]
			var/tname
			if(tn>=0)
				tn=TrueState(tn,jointype)
				tname="[working.playhash]_[state][tn]"
				if(!(tname in working.playicons))
					src << browse_rsc(new/icon(working,"[state][tn]"),"[fname]_[tname].png")
					working.playicons+=tname
			else
				tname="blank"
				if(!(tname in working.playicons))
					src << browse_rsc('blank.dmi',"[fname]_blank.png")
					working.playicons+=tname
			html+="<td width=32 height=32><a href=\"byond://?play=[n^dirs[k]];state=[url_encode("[state]")]\"><img class=icon src=\"[fname]_[tname].png\"></a></td>\n"
		html+="</tr>\n"
	html+="</table>[state ? "\"[state]\"" : "Default state"]: [jointype]-state join<br />\nflags=[n] ([state][TrueState(n,jointype)])</center></body></html>"
	src << browse(html,"name=Play&width=120&height=150&window=play")

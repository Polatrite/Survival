var/const/SAVEFILE_VERSION = 5

proc/LoadFromSavefile(savefile/f)
	if(!istype(f)) return
	var version
	f["saveVersion"] >> version
	var/mob/game/player/m
	var x, y, z
	f["mobLoc/x"] >> x
	f["mobLoc/y"] >> y
	f["mobLoc/z"] >> z
	f["mobData"] >> m
	m.version = version
	m.Transfer(locate(x, y, z))
	/*while(m.version < SAVEFILE_VERSION)
		switch(m.version)
			if(1) // Latest
				;
		m.version++*/
	return m

proc/SaveFromMob(mob/game/player/m)
	if(!istype(m)) return
	var/savefile/f = new
	f["saveVersion"] << SAVEFILE_VERSION
	f["charName"] << m.name
	f["charExp"] << m.exptotal
	f["mobLoc/x"] << m.x
	f["mobLoc/y"] << m.y
	f["mobLoc/z"] << m.z
	f["mobData"] << m // BLAERGH!!
	f.dir.Remove("mobData/.0/key")
	f.dir.Remove("mobData/.0/action")
	f.dir.Remove("mobData/.0/icon")
	f.dir.Remove("mobData/.0/icon_state")
	f.dir.Remove("mobData/.0/overlays")
	return f

var/list/charNames = list()
world/New()
	..()
	var/list/cksaves = flist("players/")
	for(var/cksave in cksaves)
		if(text2ascii(cksave, length(cksave)) != 47) continue
		var/list/ccsaves = flist("players/[cksave]")
		for(var/ccsave in ccsaves)
			if(length(ccsave) <= 4 || copytext(ccsave, length(ccsave) - 4) != ".tsav") continue
			charNames.Add(ckey(copytext(ccsave, 1, length(ccsave) - 4)))

proc/KeyExists(k)
	var/list/header = world.Export("http://members.byond.com/[ckey(k)]?format=text")
	return copytext(header["CONTENT-TYPE"], 1, 12) == "text/plain;"

mob/game/player
	proc/save()
		var/msg
		for(var/skill/S in skill_list)
			msg = dd_replacetext(S.name, " ", "_")
			vars["skill_[msg]_level"] = S.level
		var/savefile/f = SaveFromMob(src)
		fdel("players/[account.name]/[ckey(name)].tsav")
		world.log << "Saved - players/[account.name]/[ckey(name)].tsav"
		f.ExportText("/", "players/[account.name]/[ckey(name)].tsav")
		mess("Your character has been saved.")
		return f
	verb/quit()
		var/mob/login/M = new
		M.name = key
		src.client.mob = M
		del src

mob/login
	var/list/saves
	var/interacting
	var/logged_in = 0
	var/account/account

	Login()
		if(findText(key, "Guest-", 1, 7))
			AccountLogin()
			while(!logged_in)
				sleep(5)
		else
			account = RetrieveAccount("[ckey]-BYOND")
			if(!account)
				account = CreateAccount("[ckey]-BYOND", "(null)")
		if(!saves)
			saves = list()
			var/list/cfiles = flist("players/[account.name]/")
			for(var/fn in cfiles)
				var/savefile/f = new
				f.ImportText("/", file("players/[account.name]/" + fn))
				var/cName
				f["charName"] >> cName
				saves[ckey(cName)] = f
		CharSelection()
		return ..()

	Logout()
		spawn del src
		return ..()

	Topic(ref, list/params)
		if(interacting || src != usr) return
		interacting = 1
		switch(params["action"])
			if("create")
				src << browse(null, "window=browser")
				var/nName = key
				RetryName:
				var/nNameDef = nName
				var/n = 1
				while(ckey(nNameDef) in charNames) nNameDef = nName + num2text(++n)
				nName = input(src, "Enter a new character name.", "Character Creation", nNameDef)as text|null
				if(isnull(nName)) goto GiveUp

				if(ckey(nName) in charNames)
					alert(src, "That character name has already been taken.", "Character Creation")
					goto RetryName
				if(length(ckey(nName)) == 0)
					alert(src, "That character name is invalid.  You must provide at least one letter or number.", "Character Creation")
					goto RetryName
				for(var/i = 1; i <= length(nName); i++)
					var/char = text2ascii(nName, i)
					switch(char) // Screw the 'if' statement, man!
					    //     "   '   (   )   -   .   0     9   A     Z   _   a     z
						if(32, 34, 39, 40, 41, 45, 46, 48 to 57, 65 to 90, 95, 97 to 122)
						else
							alert(src, "That character name is invalid.  Only letters, numbers, and certain symbols are allowed.", "Character Creation")
							goto RetryName
				if(length(nName) > 20)
					alert(src, "That character name is too long.  Names may be no longer than 20 characters.", "Character Creation")
					goto RetryName
				if(ckey(nName) != ckey && KeyExists(nName))
					alert(src, "This name is reserved for someone with the same or similar BYOND key.", "Character Creation")
					goto RetryName

				switch(alert(src, "Are you sure you want to create this character?\n\n     \"[nName]\"", "Character Creation", "Yes", "No", "Cancel"))
					if("No") goto RetryName
					if("Cancel") goto GiveUp
				if(ckey(nName) in charNames)
					alert(src, "That character name has JUST NOW been taken!  Hah!", "Character Creation")
					goto RetryName

				charNames.Add(ckey(nName))
				if(!client.rscLoaded)
					src << browse(interface_html_header + {"<body><p style="margin-top: 100px; font-size: 3em; text-align: center">Loading resorces.<br />Please wait...</p></body></html>"}, "window=browser")
					while(client.rscLoaded) sleep(1)
				src << browse(null, "window=browser")
				var/mob/game/player/M = new(locate("startpoint"))
				M.account = account
				M.name = nName
				M.version = SAVEFILE_VERSION

				RetryGender:
				M.gender = input(src, "Is [nName] a male or female?", "Character Creation", "male") in list("male", "female")
				switch(alert(src, "[nName] is a [M.gender]?", "Character Creation", "Yes", "No", "Cancel"))
					if("No") goto RetryGender
					if("Cancel") goto GiveUp


				// Starter Pack
				var/obj/game/O
				O = new/obj/game/item/clothes/survivor_clothes(M)
				M.v_equip(O)
				//O = new/obj/game/item/boat/raft(M)
				O.amount = 1
				O = new/obj/game/item/tools/axe/wooden_axe(M)
				O = new/obj/game/item/tools/fishing/fishing_pole(M)
				M.v_equip(O)
				O = new/obj/game/item/food/cucumber(M)
				O.amount = 2
				/*O = new/obj/game/item/seeds/cucumber_seed(M)
				O.amount = 2*/

				src.client.mob = M
				M.save()
				del src
			if("load")
				var/cName = params["char"]
				var/savefile/f = saves[cName]
				if(f)
					if(!client.rscLoaded)
						src << browse(interface_html_header + {"<body><p style="margin-top: 100px; font-size: 3em; text-align: center">Loading resorces.<br />Please wait...</p></body></html>"}, "window=browser")
						while(client.rscLoaded) sleep(1)
					src << browse(null, "window=browser")
					var/mob/game/M = LoadFromSavefile(f)
					M.account = account
					if(istext(M)) alert(src, M, "Load Character")
					else if(istype(M))
						src.client.mob = M
						del src
			if("delete")
				var/cName = params["char"]
				var/savefile/f = saves[cName]
				if(f)
					src << browse(null, "window=browser")
					var/fName = f["charName"]
					var/res = input(src, "Are you sure you would like to perminantly delete the character '[fName]'?\nPlease type the character's name, otherwise type cancel.", "Character Deletion", "cancel") as text
					if(res == fName)
						fcopy("players/[account.name]/[cName].tsav", "backups/deleted/players/[account.name]/[cName].tsav")
						fdel("players/[account.name]/[cName].tsav")
						saves.Remove(cName)
						charNames.Remove(cName)
		GiveUp:
		CharSelection()
		interacting = 0
		return ..()

	proc/AccountLogin()
		if(!client)
			return
		var/html = account_login_html
		src << browse(html, "window=browser")
		winset(src, "browser", "size=600x380")
		client.center_window("browser","default")

	proc/CharSelection()
		if(!client) return
		var/html = login_html_header
		var/n = 0
		for(var/cName in saves)
			var/savefile/f = saves[cName]
			var/fName
			var/exp
			f["charName"] >> fName
			f["charExp"] >> exp
			//html += {"<a href="byond://?src=\ref[src]&action=load&char=[cName]">[fName]</a> - Exp: [exp] <a href="byond://?src=\ref[src]&action=delete&char=[cName]" style="color:red;font-size:.8em">(X)</a><br />"}
			html += {"
               <tr[++n % 2 ? " class='odd'" : ""]>
                    <td class="charName"><a href="byond://?src=\ref[src]&action=load&char=[cName]">[html_encode(fName)]</a></td>
                    <td class="charExp">[exp] Exp</td>
                    <td class="charDelete"><a href="byond://?src=\ref[src]&action=delete&char=[cName]" title="Delete Character">x</a></td>
                </tr>
"}

		html += {"
            </table>
            <button onclick="window.location='byond://?src=\ref[src]&action=create'">New Character</button>
        </div>
    </div>
</body>
</html>"}
		src << browse(html, "window=browser")
		winset(src, "browser", "size=600x330")
		client.center_window("browser","default")

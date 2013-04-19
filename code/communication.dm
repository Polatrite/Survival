var/const
	CHAN_ALL = 0
	CHAN_PUBLIC = 1
	CHAN_PRIVATE = 2
	CHAN_GUILD = 3

proc/FormatOutput(name, msg, class)
	return "\[[time2text(world.timeofday, "hh:mm:ss")]\] <span class='chan[class]'>([class]) [html_encode(name)]:</span> [html_encode(msg)]"
proc/FormatInfo(msg)
	return "\[[time2text(world.timeofday, "hh:mm:ss")]\] <span class='chanInfo'>(INFO) [msg]</span>"
proc/FormatEmote(name, msg, class)
	if(text2ascii(msg) == 39) // '
		return "\[[time2text(world.timeofday, "hh:mm:ss")]\] <span class='chan[class]'>([class]) [html_encode(name)][html_encode(msg)]</span>"
	else
		return "\[[time2text(world.timeofday, "hh:mm:ss")]\] <span class='chan[class]'>([class]) [html_encode(name)] [html_encode(msg)]</span>"

mob/game
	var/tmp
		list/openTabs = list()
		list/closedTabs = list()
		list/chatHistory = list()
		list/dirtyTabs = list() // It's not what you think!
		obj/system/flick_back/chanNotifier
		currentTab = "chatPublic"

	proc
		OutputTo(txt, chan, target, changeTab=0) // chan = 0-3, target is required for CHAN_PRIVATE and CHAN_GUILD.
			if(!chan || !txt || !client) return
			switch(chan)
				if(CHAN_ALL)
					OutputToLog(txt, "Public")
					src << output(txt, "chatPublic.output")
					for(var/i in openTabs)
						src << output(txt, "[i].output")
				if(CHAN_PUBLIC)
					OutputToLog(txt, "Public")
					src << output(txt, "chatPublic.output")
					winset(src, "chatPublic", "title='[GetTabTitle("chatPublic", 1)]'")
					if(changeTab) ChangeTabs("chatPublic")
				if(CHAN_PRIVATE)
					if(target) OutputToTab(txt, "Private", target, changeTab)
				if(CHAN_GUILD)
					if(target) OutputToTab(txt, "Guild", target, changeTab)

		OutputToTab(txt, ctype, name, changeTab=0) // ctype = "Private" or "Guild"
			var/winName = "chat[ctype]-[ckey(name)]"
			var/winTitle = "[ctype]: [name]"
			if(!(winName in openTabs))
				if(winName in closedTabs)
					closedTabs.Remove(winName)
					openTabs[winName] = winTitle
					UpdateChatTabs()
					if(changeTab) ChangeTabs(winName)
				else
					winclone(src, "chatPublic", winName)
					openTabs[winName] = winTitle
					UpdateChatTabs("[winName].title='[GetTabTitle(winName, !changeTab)]'&[winName].close.is-visible=true&[winName].close.command='.closeptab \"[winName]\"'&[winName].input.command='!.[ctype] \"[name]\" \"'")
					if(changeTab) ChangeTabs(winName)
			OutputToLog(txt, winTitle)
			src << output(txt, "[winName].output")

		OutputToLog(txt, chan) // chan = window title, like "Private: Buce"
			var/list/hist = chatHistory[chan]
			if(!hist)
				hist = list()
				chatHistory[chan] = hist
			hist.Add(txt)
			if(hist.len > 20) hist.Cut(1, 2)

		OutputToWLog(txt, chan)
			world.log << "\[[time2text(world.timeofday, "hh:mm:ss")]\] @([x],[y],[z]) [name]: ([chan]) [txt]"

		UpdateChatTabs(extra) // Optional extra winset() params.
			var/tabs = "chatPublic"
			for(var/i in openTabs) tabs += "," + i
			winset(src, null, "chatPane.chatTabs.tabs=[url_encode(tabs)]&[extra]")

		ChangeTabs(newTab)
			//if(newTab == currentTab) return
			var/oldTab = currentTab
			currentTab = newTab
			winset(src, null, "[oldTab].input.is-default=false&[newTab].input.is-default=true&chatPane.chatTabs.current-tab=[newTab]&[newTab].title='[GetTabTitle(newTab, 0)]'")
			dirtyTabs.Remove(newTab)
			if(!dirtyTabs.len) del chanNotifier

		GetTabTitle(tab, notify)
			var/title
			if(tab == "chatPublic") title = "Public"
			else title = openTabs[tab]
			if(notify && tab != currentTab)
				title = "*[title]*"
				if(tab != "chatPublic")
					ShowChanNotifier()
					if(!(tab in dirtyTabs)) dirtyTabs.Add(tab)
			return title

		ShowChanNotifier()
			if(!client) return
			del chanNotifier
			chanNotifier = new(8, "new message2")
			chanNotifier.icon = 'EffectsSet.dmi'
			chanNotifier.icon_state = "new message1"
			chanNotifier.screen_loc = "SOUTH:16,WEST:16"
			client.screen.Add(chanNotifier)

	verb
		say(msg as text)
			BubbleTalk(30)
			OutputToWLog(msg, "Area")
			for(var/mob/game/m in view(src)) if(m.client)
				m.OutputTo(FormatOutput(name, msg, "Area"), CHAN_PUBLIC)

		emote(msg as text)
			OutputToWLog(msg, "Area Emote")
			for(var/mob/game/m in view(src)) if(m.client)
				m.OutputTo(FormatEmote(name, msg, "Area"), CHAN_PUBLIC)

		shout(msg as text)
			OutputToWLog(msg, "Loud")
			BubbleExclaim(30)
			for(var/mob/game/m in view("85x65", src)) if(m.client)
				m.OutputTo(FormatOutput(name, msg, "Loud"), CHAN_PUBLIC)

		chat(msg as text)
			OutputToWLog(msg, "Chat")
			BubbleTalk(30)
			for(var/mob/game/m) if(m.client)
				m.OutputTo(FormatOutput(name, msg, "Chat"), CHAN_PUBLIC)

		wemote(msg as text)
			OutputToWLog(msg, "Chat Emote")
			for(var/mob/game/m) if(m.client)
				m.OutputTo(FormatEmote(name, msg, "Chat"), CHAN_PUBLIC)

		tell(mob/game/target in world, msg as text)
			OutputToWLog(msg, "Private to [target.name]")
			if(src != target && target.client)
				target.OutputTo(FormatOutput(name, msg, "Private"), CHAN_PRIVATE, name)
				var/tab = "chatPrivate-[ckey(name)]"
				if(target.currentTab != tab)
					winset(target, tab, "title='[target.GetTabTitle(tab, 1)]'")
			OutputTo(FormatOutput(name, msg, "Private"), CHAN_PRIVATE, target.name, 1)
			//ChangeTabs("chatPrivate-[ckey(target.name)]")


		commreview(chan in chatHistory)
			//var/chan = input(src, "Choose a channel to review.  Only 20 messages are stored.", "Comm Review")as null|anything in chatHistory
			//if(!chan) return
			var/html = {"<html><head>
<title>Recently, in "[chan]"</title>
<style>
.chanInfo { color: #F00; font-weight: bold; } .chanChat { color: #00F; font-weight: bold; } .chanArea { color: #080; font-weight: bold; } .chanLoud { color: #800; font-weight: bold; } .chanPrivate { color: #808; font-weight: bold; } .chanGuild { color: #A0A; font-weight: bold; }
</style></head><body><h3>Recently, in "[chan]"</h3>"}
			for(var/i in chatHistory[chan])
				html += "<br />" + i
			html += "</body></html>"
			src << browse(html, "window=browser")

		// Aliases
		//area(msg as text) say(msg)
		//me(msg as text) emote(msg)
		//loud(msg as text) shout(msg)
		//private(mob/game/target in world, msg as text) tell(target, msg)

		tell2(target as text, msg as text)
			set name = ".private"
			set hidden = 1
			var/t = ckey(target)
			for(var/mob/game/M)
				if(t == ckey(M.name))
					return tell(M, msg)
			var/winName = "chatPrivate-[t]"
			if(winName in openTabs)
				OutputTo("[html_encode(target)] is not currently online.", CHAN_PRIVATE, t)
			else
				OutputTo("[html_encode(target)] is not currently online.", CHAN_PUBLIC)

		guild2(target as text, msg as text)
			set name = ".guild"
			set hidden = 1
			var/t = ckey(target)
			var/winName = "chatGuild-[t]"
			if(winName in openTabs)
				OutputTo("Guild chat is not yet enabled.", CHAN_GUILD, t)
			else
				OutputTo("Guild chat is not yet enabled.", CHAN_PUBLIC)

		closeptab(tab as text)
			set name = ".closeptab"
			set hidden = 1
			if(tab in openTabs)
				closedTabs[tab] = openTabs[tab]
				openTabs.Remove(tab)
				UpdateChatTabs()

		tabnext()
			set name = ".tabnext"
			set hidden = 1
			var/list/tabs = openTabs + "chatPublic"
			var/new_tab
			var/x = tabs.Find(currentTab)
			if(x == tabs.len)
				new_tab = tabs[1]
			else
				new_tab = tabs[x+1]
			ChangeTabs(new_tab)

		tabprevious()
			set name = ".tabprevious"
			set hidden = 1
			var/list/tabs = openTabs + "chatPublic"
			var/new_tab
			var/x = tabs.Find(currentTab)
			if(x == 1)
				new_tab = tabs[tabs.len]
			else
				new_tab = tabs[x-1]
			ChangeTabs(new_tab)

		tabchanged()
			set name = ".tabchanged"
			set hidden = 1
			var/tab = winget(src, "chatPane.chatTabs", "current-tab")
			ChangeTabs(tab)

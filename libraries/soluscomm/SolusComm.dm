var

// 1 = keeps a condensed retrieve record, 2 = keeps a full retrieve record
	scomm_keep_retrieve = 2
	scomm_log_to_file = 1

	tmp
		scomm_global_chat[] = list()

proc
	scomm_release_timer()
		while(world)
			for(var/mob/M in world)
				if(M.scomm_release_say > 0)
					M.scomm_release_say -= 15
				if(M.scomm_release_emote > 0)
					M.scomm_release_emote -= 15
				if(M.scomm_release_shout > 0)
					M.scomm_release_shout -= 15
				if(M.scomm_release_chat > 0)
					M.scomm_release_chat -= 15
				if(M.scomm_release_wemote > 0)
					M.scomm_release_wemote -= 15
				if(M.scomm_release_tell > 0)
					M.scomm_release_tell -= 15
			sleep(10)

	scomm_timestamp()
		return time2text(world.timeofday, "hh:mm:ss")

	scomm_clipspam(msg)
		var/cliplen = 0
		if(length(msg) > 270)
			cliplen = 1
		msg = copytext(msg,1,271)
		msg = html_encode(msg)
		var/loca = findtext(msg,{"
"})
		if(loca)
			msg = scomm_replacetext(msg, {"
"}, "")
		if(cliplen)
			msg += " \[...\]"
		return msg

	scomm_replacetext(ret,rem = "~",rep = "")
		var/F
		var/remlen = lentext(rem)
		startloop
		F = findtext(ret,rem)
		if(F)
			var/F2 = copytext(ret,F+remlen)
			var/F3 = copytext(ret,1,F)
			ret = "[F3][rep][F2]"
			if(findtext(ret,rem))
				goto startloop
		return ret

	scomm_players()
		var/ret[]
		for(var/mob/M in world)
			if(M.client)
				ret += list(M)
		if(ret)
			return ret
		else
			return 0

world
	New()
		..()
		spawn()
			scomm_release_timer()

client
	Topic(href)
		..()
		if(href == "scomm_fulltime")
			src << "<B>The full date and time is: [time2text(world.realtime)]."
		if(href == "scomm_ignore")
			src << "<B>All puncuation and capitalization is removed from these lists, however they still function like normal. Choosing to ignore Polatrite will show polatrite, but will ignore Polatrite."

mob
	var
		scomm_channels_restricted[] = list()
		scomm_ignored_players[] = list()
		tmp
			scomm_channels_heard[] = list("say","shout","chat","tell","emote","wemote")
			scomm_release_say = 0
			scomm_release_emote = 0
			scomm_release_shout = 0
			scomm_release_chat = 0
			scomm_release_wemote = 0
			scomm_release_tell = 0
			scomm_say[] = list()
			scomm_emote[] = list()
			scomm_shout[] = list()
			scomm_chat[] = list()
			scomm_wemote[] = list()
			scomm_tell_sent[] = list()
			scomm_tell_recieved[] = list()

	verb
		who()
			var/count = 0
			for(var/mob/game/M in world)
				if(M.key)
					mess("<b>[M]</b> - [M.exptotal]")
					count++
			mess("<b>Total players: [count]</b>")

		ignore(msg as text)
			set category = "Comm."
			msg = ckey(msg)
			if(msg == "polatrite" || msg == "polatritehub" || msg == ckey(src.name))
				src << "<B>You cannot ignore this person."
				return 0
			scomm_ignored_players += msg
			src << "<B>You are now ignoring <a href=?scomm_ignore>[msg]</a>."

		unignore(M in scomm_ignored_players)
			set category = "Comm."
			if(!M)
				src << "<B>There is nobody on your list to ignore."
			scomm_ignored_players -= M
			src << "<B>You begin paying attention to <a href=?scomm_ignore>[M]</a> again."

		commstatus()
			set category = "Comm."
			if(scomm_channels_heard.len)
				src << "<B>Channels you can hear:"
				for(var/L in scomm_channels_heard)
					src << L
			if(scomm_channels_restricted.len)
				src << "<B>Channels you cannot use:"
				for(var/L in scomm_channels_restricted)
					src << L
			if(scomm_ignored_players.len)
				src << "<B>Players on your ignore list:"
				for(var/L in scomm_ignored_players)
					src << L

		commreview(msg in list("say","emote","shout","chat","wemote","tells sent","tells recieved","global chat"))
			set category = "Comm."
			switch(msg)
				if("say")
					if(scomm_say.len)
						src << "<B>Say:"
						for(var/L in scomm_say)
							src << L
					else
						src << "There is nothing to review."
				if("emote")
					if(scomm_emote.len)
						src << "<B>Emote:"
						for(var/L in scomm_emote)
							src << L
					else
						src << "There is nothing to review."
				if("shout")
					if(scomm_shout.len)
						src << "<B>Shout:"
						for(var/L in scomm_shout)
							src << L
					else
						src << "There is nothing to review."
				if("chat")
					if(scomm_chat.len)
						src << "<B>Chat:"
						for(var/L in scomm_chat)
							src << L
					else
						src << "There is nothing to review."
				if("wemote")
					if(scomm_wemote.len)
						src << "<B>WEmote:"
						for(var/L in scomm_wemote)
							src << L
					else
						src << "There is nothing to review."
				if("tells sent")
					if(scomm_tell_sent.len)
						src << "<B>Tells sent:"
						for(var/L in scomm_tell_sent)
							src << L
					else
						src << "There is nothing to review."
				if("tells recieved")
					if(scomm_tell_recieved.len)
						src << "<B>Tells recieved:"
						for(var/L in scomm_tell_recieved)
							src << L
					else
						src << "There is nothing to review."
				if("global chat")
					if(scomm_global_chat.len)
						src << "<B>Global chat:"
						for(var/L in scomm_global_chat)
							src << L
					else
						src << "There is nothing to review."

		say(msg as text)
			set category = "Comm."
			if(!msg)
				if(scomm_channels_heard.Find("say"))
					scomm_channels_heard -= list("say")
					src << "<B>You can no longer hear say."
					return
				else
					scomm_channels_heard += list("say")
					src << "<B>You can hear say again."
					return
			if(scomm_channels_restricted.Find("say"))
				src << "<B>You are not allowed to use this channel!"
				return
			scomm_release_say += 20
			if(scomm_release_say > 60)
				if(scomm_release_say > 1200)
					scomm_channels_restricted += "say"
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
					src << "<B>You have been automatically muted for excessive spamming."
					return 0
				sleep(50)
				src << "<B>You have been muted for spam from this channel for [scomm_release_say/10] seconds."
				return 0
			if(!scomm_channels_heard.Find("say"))
				scomm_channels_heard += list("say")
				src << "<B>You can hear say again."
			msg = scomm_clipspam(msg)
			var/txt
			world.log << "[slog_lenstring(src)]: (say) [msg]"
			if(scomm_keep_retrieve == 1)
				txt = "<B>[scomm_timestamp()] [src]:</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#008000\">(Area) [src]:</B> [msg]"
			if(txt)
				scomm_say.Insert(1, txt)
				if(scomm_say.len > 20)
					scomm_say.Cut(20, scomm_say.len + 1)
			txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#008000\">(Area) [src]:</B> [msg]"
			BubbleTalk(30)
			for(var/mob/M in range(src))
				if(M.client)
					if(!M.scomm_ignored_players.Find(src.ckey))
						if(M.scomm_channels_heard.Find("say"))
							M << txt

		emote(msg as text)
			set category = "Comm."
			if(!msg)
				if(scomm_channels_heard.Find("emote"))
					scomm_channels_heard -= list("emote")
					src << "<B>You can no longer see emotes."
					return
				else
					scomm_channels_heard += list("emote")
					src << "<B>You can see emotes again."
					return
			if(scomm_channels_restricted.Find("emote"))
				src << "<B>You are not allowed to use this channel!"
				return
			scomm_release_emote += 20
			if(scomm_release_emote > 60)
				if(scomm_release_emote > 1200)
					scomm_channels_restricted += "emote"
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
					src << "<B>You have been automatically muted for excessive spamming."
					return 0
				sleep(50)
				src << "<B>You have been muted for spam from this channel for [scomm_release_emote/10] seconds."
				return 0
			if(!scomm_channels_heard.Find("emote"))
				scomm_channels_heard += list("emote")
				src << "<B>You can see emotes again."
			msg = scomm_clipspam(msg)
			var/txt
			world.log << "[slog_lenstring(src)]: (emote) [msg]"
			if(scomm_keep_retrieve == 1)
				txt = "<B>[scomm_timestamp()] *[src]</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#008000\">(Area) *[src]</B> [msg]"
			if(txt)
				scomm_emote.Insert(1, txt)
				if(scomm_emote.len > 20)
					scomm_emote.Cut(20, scomm_emote.len + 1)
			txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#008000\">(Area) *[src]</B> [msg]"
			for(var/mob/M in range(src))
				if(M.client)
					if(!M.scomm_ignored_players.Find(src.ckey))
						if(M.scomm_channels_heard.Find("emote"))
							M << txt

		shout(msg as text)
			set category = "Comm."
			if(!msg)
				if(scomm_channels_heard.Find("shout"))
					scomm_channels_heard -= list("shout")
					src << "<B>You can no longer hear shout."
					return
				else
					scomm_channels_heard += list("shout")
					src << "<B>You can hear shout again."
					return
			if(scomm_channels_restricted.Find("shout"))
				src << "<B>You are not allowed to use this channel!"
				return
			scomm_release_shout += 20
			if(scomm_release_shout > 60)
				if(scomm_release_shout > 1200)
					scomm_channels_restricted += "shout"
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
					src << "<B>You have been automatically muted for excessive spamming."
					return 0
				src << "<B>You have been muted for spam from this channel for [scomm_release_shout/10] seconds."
				return 0
			if(!scomm_channels_heard.Find("shout"))
				scomm_channels_heard += list("shout")
				src << "<B>You can hear shout again."
			msg = scomm_clipspam(msg)
			var/txt
			world.log << "[slog_lenstring(src)]: (shout) [msg]"
			if(scomm_keep_retrieve == 1)
				txt = "<B>[scomm_timestamp()] [src]:</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"red\">(Loud) [src]:</B> [msg]"
			if(txt)
				scomm_shout.Insert(1, txt)
				if(scomm_shout.len > 20)
					scomm_shout.Cut(20, scomm_shout.len + 1)
			txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"red\">(Loud) [src]:</B> [msg]"
			BubbleTalk(30)
			for(var/mob/M in range(src, world.view*2))
				if(M.client)
					if(!M.scomm_ignored_players.Find(src.ckey))
						if(M.scomm_channels_heard.Find("shout"))
							M << txt

		chat(msg as text)
			set category = "Comm."
			if(!msg)
				if(scomm_channels_heard.Find("chat"))
					scomm_channels_heard -= list("chat")
					src << "<B>You can no longer hear chat."
					return
				else
					scomm_channels_heard += list("chat")
					src << "<B>You can hear chat again."
					return
			if(scomm_channels_restricted.Find("chat"))
				src << "<B>You are not allowed to use this channel!"
				return
			scomm_release_chat += 20
			if(scomm_release_chat > 60)
				if(scomm_release_chat > 1200)
					scomm_channels_restricted += "chat"
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
					src << "<B>You have been automatically muted for excessive spamming."
					return 0
				sleep(50)
				src << "<B>You have been muted for spam from this channel for [scomm_release_chat/10] seconds."
				return 0
			if(!scomm_channels_heard.Find("chat"))
				scomm_channels_heard += list("chat")
				src << "<B>You can hear chat again."
			msg = scomm_clipspam(msg)
			var/txt
			world.log << "[slog_lenstring(src)]: (chat) [msg]"
			if(scomm_keep_retrieve == 1)
				txt = "<B>[scomm_timestamp()] [src]:</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#000080\">(Chat) [src]:</B> [msg]"
			if(txt)
				scomm_chat.Insert(1, txt)
				if(scomm_chat.len > 20)
					scomm_chat.Cut(20, scomm_chat.len + 1)
				scomm_global_chat.Insert(1, txt)
				if(scomm_global_chat.len > 40)
					scomm_global_chat.Cut(40, scomm_global_chat.len + 1)
			txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#000080\">(Chat) [src]:</B> [msg]"
			BubbleTalk(30)
			for(var/mob/M in world)
				if(M.client)
					if(!M.scomm_ignored_players.Find(src.ckey))
						if(M.scomm_channels_heard.Find("chat"))
							M << txt

		wemote(msg as text)
			set category = "Comm."
			if(!msg)
				if(scomm_channels_heard.Find("wemote"))
					scomm_channels_heard -= list("wemote")
					src << "<B>You can no longer see wemotes."
					return
				else
					scomm_channels_heard += list("wemote")
					src << "<B>You can see wemotes again."
					return
			if(scomm_channels_restricted.Find("wemote"))
				src << "<B>You are not allowed to use this channel!"
				return
			scomm_release_wemote += 20
			if(scomm_release_wemote > 60)
				if(scomm_release_wemote > 1200)
					scomm_channels_restricted += "wemote"
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
					src << "<B>You have been automatically muted for excessive spamming."
					return 0
				src << "<B>You have been muted for spam from this channel for [scomm_release_wemote/10] seconds."
				return 0
			if(!scomm_channels_heard.Find("wemote"))
				scomm_channels_heard += list("wemote")
				src << "<B>You can see wemotes again."
			msg = scomm_clipspam(msg)
			var/txt
			world.log << "[slog_lenstring(src)]: (wemote) [msg]"
			if(scomm_keep_retrieve == 1)
				txt = "<B>[scomm_timestamp()] *[src]</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#000080\">(Chat) *[src]</B> [msg]"
			if(txt)
				scomm_wemote.Insert(1, txt)
				if(scomm_wemote.len > 20)
					scomm_wemote.Cut(20, scomm_wemote.len + 1)
			txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#000080\">(Chat) *[src]</B> [msg]"
			for(var/mob/M in world)
				if(M.client)
					if(!M.scomm_ignored_players.Find(src.ckey))
						if(M.scomm_channels_heard.Find("wemote"))
							M << txt

		tell(mob/M as mob in scomm_players(), msg as text)
			set category = "Comm."
			if(!msg)
				if(scomm_channels_heard.Find("tell"))
					scomm_channels_heard -= list("tell")
					src << "<B>You can no longer hear tell."
					return
				else
					scomm_channels_heard += list("tell")
					src << "<B>You can hear tell again."
					return
			if(scomm_channels_restricted.Find("tell"))
				src << "<B>You are not allowed to use this channel!"
				return
			if(M.scomm_ignored_players.Find(src.ckey))
				src << "<B>They are ignoring you!"
				return
			scomm_release_tell += 20
			if(scomm_release_tell > 60)
				if(scomm_release_tell > 1200)
					scomm_channels_restricted += "tell"
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
					src << "<B>You have been automatically muted for excessive spamming."
					return 0
					src << "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
				sleep(50)
				src << "<B>You have been muted for spam from this channel for [scomm_release_tell/10] seconds."
				return 0
			if(!scomm_channels_heard.Find("tell"))
				scomm_channels_heard += list("tell")
				src << "<B>You can hear tell again."
			msg = scomm_clipspam(msg)
			var/txt
			world.log << "[slog_lenstring(src)]: (tell to [M]) [msg]"
			if(scomm_keep_retrieve == 1)
				txt = "<B>[scomm_timestamp()] To [M]:</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#9400d3\">(Private) To [M]:</B> [msg]"
			if(txt)
				scomm_tell_sent.Insert(1, txt)
				if(scomm_tell_sent.len > 20)
					scomm_tell_sent.Cut(20, scomm_tell_sent.len + 1)
			txt = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#9400d3\">(Private) To [M]:</B> [msg]"
			var/txt2
			if(scomm_keep_retrieve == 1)
				txt2 = "<B>[scomm_timestamp()] From [src]:</B> [msg]"
			if(scomm_keep_retrieve == 2)
				txt2 = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#9400d3\">(Private) From [src]:</B> [msg]"
			if(txt2)
				M.scomm_tell_recieved.Insert(1, txt2)
				if(M.scomm_tell_recieved.len > 20)
					M.scomm_tell_recieved.Cut(20, M.scomm_tell_recieved.len + 1)
			txt2 = "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a> <font color = \"#9400d3\">(Private) From [src]:</B> [msg]"
			if(src.scomm_ignored_players.Find(M.ckey))
				src.scomm_ignored_players -= list(M.ckey)
				src << "<B>You begin paying attention to <a href=?scomm_ignore>[M]</a> again."
			if(M != src)
				if(M.scomm_channels_heard.Find("tell"))
					M << txt2
				else
					src << "<B>They cannot hear tells."
					return
			src << txt

	proc
		scomm_addmute(msg, mob/M)
			if(!M)
				M = input("Which player would you like to modify the mute status of?") in scomm_players()
			if(!msg)
				msg = input("Which channel would you like to add to the mute list?") in list("say","shout","chat","tell","emote","wemote")
			if(!M.scomm_channels_restricted.Find(msg))
				world.log << "[slog_lenstring(src)]: muted [M] from [msg]"
				M.scomm_channels_restricted += list(msg)
				world << "<B>[M] has lost \his [msg] channel privilages!"
			else
				src << "<B>[M] is already muted from that channel!"

		scomm_viewmute(mob/M)
			if(!M)
				M = input("Which player would you like to view the mute status of?") in scomm_players()
			src << "<B>[M] is muted from the following channels:"
			for(var/L in M.scomm_channels_restricted)
				src << L

		scomm_viewmute_full()
			for(var/mob/M in world)
				if(M.key)
					if(M.scomm_channels_restricted.len)
						src << "<B>[M] is muted from the following channels:"
						for(var/L in M.scomm_channels_restricted)
							src << L
					else
						src << "<B>[M] has full channel access."

		scomm_viewchannels(mob/M)
			if(!M)
				M = input("Which player would you like to view the channel status of?") in scomm_players()
			if(M.scomm_channels_heard.len < 6)
				src << "<B>[M] cannot hear the following channels:"
				if(!M.scomm_channels_heard.Find("say"))
					src << "say"
				if(!M.scomm_channels_heard.Find("emote"))
					src << "emote"
				if(!M.scomm_channels_heard.Find("shout"))
					src << "shout"
				if(!M.scomm_channels_heard.Find("chat"))
					src << "chat"
				if(!M.scomm_channels_heard.Find("wemote"))
					src << "wemote"
				if(!M.scomm_channels_heard.Find("tell"))
					src << "tell"
			else
				src << "<B>[M] can hear all channels."

		scomm_viewchannels_full()
			for(var/mob/M in world)
				if(M.key)
					if(M.scomm_channels_heard.len < 6)
						src << "<B>[M] cannot hear the following channels:"
						if(!M.scomm_channels_heard.Find("say"))
							src << "say"
						if(!M.scomm_channels_heard.Find("emote"))
							src << "emote"
						if(!M.scomm_channels_heard.Find("shout"))
							src << "shout"
						if(!M.scomm_channels_heard.Find("chat"))
							src << "chat"
						if(!M.scomm_channels_heard.Find("wemote"))
							src << "wemote"
						if(!M.scomm_channels_heard.Find("tell"))
							src << "tell"
					else
						src << "<B>[M] can hear all channels."

		scomm_delmute(msg, mob/M)
			if(!M)
				M = input("Which player would you like to modify the mute status of?") in scomm_players()
			if(!msg)
				msg = input("Which channel would you like to remove from the mute list?") in M.scomm_channels_restricted
			M.scomm_channels_restricted -= msg
			world.log << "[slog_lenstring(src)]: unmuted [M] from [msg]"
			world << "<B>[M] has regained \his [msg] channel privilages."


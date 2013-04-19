guild
	var
		name = "(null)"
		desc

		leaders[] = list()
		members[] = list()
		ranks[] = list("Leader", "Member")

		invited[] = list()

		level = 1

		exp = 0
		exptnl = 55

		exptax = 0

	New(nam, des)
		..()
		name = nam
		desc = des

	proc
		Who(mob/game/M)

		Chat(mob/game/M, msg)
			if(istext(M))
				for(var/mob/game/V in members);
					//V << "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a><font color = \"#A000A0\">(Guild - [M])</B> [msg]"
			else
				for(var/mob/game/V in members);
					//V << "<B> <a href=?scomm_fulltime>[scomm_timestamp()]</a><font color = \"#A000A0\">(Guild) [M]:</B> [msg]"

		InviteMember(mob/game/M, mob/game/V)
			if(leaders.Find(M))
				invited += V
				Chat("Members", "[V] has received a guild invitation.")
			else
				M.mess("You are not a guild leader.")

		AddMember(mob/game/V)
			if(invited.Find(V))
				members += V
				invited -= V
				Chat("Members", "[V] has joined the guild!")

		KickMember(mob/game/M, mob/game/V)
			if(invited.Find(V))
				invited -= V
				Chat("Members", "[V]'s guild invitation has been revoked.")
			else if(members.Find(V))
				members -= V
				if(leaders.Find(V))
					leaders -= V
				Chat("Members", "[V] has left the guild.")

		SetRank(mob/game/M, mob/game/V)

		Tax(mob/game/M, val)
			val = val * exptax / 100
			exp += val
			debug("[M] donated [val] exp based on [exptax]")
			while(exp >= exptnl)
				level++
				exp -= exptnl
				exptnl = 1.1 ** (level - 1) * 55
				exptnl = round(exptnl)


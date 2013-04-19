account
	var
		name
		password
		email
		characters[] = list()



proc
	CreateAccount(name, password, email)
		var/filename = "acct-[name]"
		if(fexists("players/[filename]"))
			return 0

		var/account/A = new
		A.name = name
		A.password = password
		A.email = email

		var/savefile/F = new
		F["accountData"] << A
		F.ExportText("/", "players/[filename]")
		//alert("Account '[filename]' created.")
		alert("Account '[name]' created.")
		return A


	RetrieveAccount(name)
		name = "acct-[name]"
		//alert(usr, "Hit Retrieval for '[name]'")
		if(!fexists("players/[name]"))
			alert(usr, "Account doesn't exist.")
			return 0

		var/account/A = new
		var/savefile/F = new
		F.ImportText("/", file("players/[name]"))

		F["accountData"] >> A

		//alert(usr, "Returning [A] with [A.name] and [A.password]")
		return A

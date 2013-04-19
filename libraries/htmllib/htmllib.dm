/*
HTML Library
Version: 1.8   (2003-01-29)
Version: 1.7   (2002-03-12)
Version: 1.6   (2002-02-05)
Version: 1.5   (2001-11-02)
Version: 1.4   (2001-03-24)
Version: 1.3   (2001-01-30)
Version: 1.2   (2001-01-18)
Version: 1.1   (2000-10-11)
Version: 1.0   (2000-09-16)

To create a new type of form, you derive one from the base Form object.  The
variables you define are automatically written to and read from the form.
To define how the form looks, you override HtmlLayout().  See htmllib.html
for the details.

*/

Form
	var
		submit = "Submit"
		reset  = "Reset"
	var/tmp
		form_url               //where to send form for processing
		form_sub_path          //extra path info after the name of this .dmb
		form_title
		form_window            //browse() parameters to use for forms in DreamSeeker
		form_reusable          //user may submit this form multiple times
		form_cgi_mode          //true if form submission is handled by client.CGI (which creates a new instance of the form to process the results)
		form_method = "get"    //web browser submission method (must be "get" in BYOND mode)
		form_extra             //extra html code to insert into the form tag
	proc
		DisplayForm(mob/U=usr)       //call this to send form to user
		SubmitForm(href,mob/U=usr)   //call this to submit a filled out form (CGI library uses this)
		GetSelfUrl(params,mob/U=usr) //return URL containing all form variables or specified parameters

		//You define these (I call them)
		Initialize()           //called in DisplayForm()
		ProcessForm()          //called when the form is complete
		HtmlLayout()           //returns html text


//internal stuff (no peeking)
Form
	var/tmp
		FormVar/form_vars[0]  //list of user-defined form variables
		mob/form_usr
		form_waiting          //doubles as a self-reference to prevent auto-deletion by garbage collector
		form_wait_count       //number of incomplete operations
		form_enctype          //uses application/x-www-form-urlencoded by default (file uploads will switch it to multipart/form-data)
		form_byond_mode = 1   //false for web clients
		form_default_size
		form_default_maxlen
		form_var_prefix       //prefix to use for html form variables
		form_is_sub           //true if this is a sub-form
		form_hidden           //hides the entire form (used by GetHiddenHtml())
	proc
		GetHtml(parent_form)  //sets up variables and calls HtmlLayout()
		GetHiddenHtml(parent_form) //sets form_hidden and calls GetHtml()
		GetHtmlDoc()          //returns form as a stand-alone document
		GetHtmlHead()
		GetSubmitUrl(sub_path)
		GetButtonScript(name)
		MakeFormVarList(parent_form)
		StartWaiting()
		StopWaiting()
		PreDisplayForm(mob/U=usr) //do everything except display the form
		SetVarPrefix(var_prefix)

Form/var/const
	AUTO = null

	//input types
	TEXT_ITYPE  = 1
	NUM_ITYPE   = 2
	ICON_ITYPE  = 3
	SOUND_ITYPE = 4
	FILE_ITYPE  = 5

	//interface elements
	TEXT     = 1
	PASSWORD = 2
	SELECT   = 3
	MULTI_SELECT = 4
	CHECKBOX = 5
	RADIO    = 6     //variable that holds value of selected RADIO_OPTION
	RADIO_OPTION = 7 //enumerated control variables _1, _2, _3, etc.
	TEXTAREA = 8     //input size is "[cols]x[rows]" or just rows
	HIDDEN   = 9
	SUBMIT   = 10
	RESET    = 11
	BUTTON   = 12
	PROMPT   = 13
	PROMPT_FOR_ICON  = 14 //converts to PROMPT interface with ICON_ITYPE
	PROMPT_FOR_SOUND = 15 //converts to PROMPT interface with SOUND_ITYPE
	PROMPT_FOR_FILE  = 16 //converts to PROMPT interface with FILE_ITYPE
	SUB_FORM  = 17        //form object or list of them
	CHECKLIST = 18        //list of checkboxes (produces a list of items and their associated html at display time)
	RADIO_LIST = 19
	HIDDEN_LIST = 20


Form/var/const
	SUBMIT_CLICK = 1
	BUTTON_CLICK = 2

Form/var/const
	NO_WRAP = "off"
	HARD_WRAP = "hard"
	SOFT_WRAP = "soft"

FormVar
	var
		name
		value
		html_value
		label
		checked
		radio_name
		input_type
		interface
		hidden
		maxlength
		size
		wrap
		extra
		values[]
		validate = 1
		clickproc
		click_script
		Form/FORM
	proc
		MakeInputTag(parent_form,var_prefix)

Form/New()
	MakeFormVarList()
	return ..()

//Examines user-defined variables and creates list of form interface elements.
Form/MakeFormVarList()
	var
		V
		myvars[] = vars.Copy()  //vars list is slow, so save a copy of it
		control_tags = list("values"=1,"validate"=1,"maxlen"=1,"size"=1,"wrap"=1,"extra"=1,"label"=1,"hidden"=1,"interface"=1)

	for(V in myvars)
		var/control = findText(V,"_")
		var/next_control
		while(control)
			next_control = findText(V,"_",control+1)
			if(!next_control) break
			control = next_control

		if(control)
			control = copytext(V,control+1)
			if(control in control_tags) continue
			if("[text2num(control)]" == control) continue

		if(issaved(vars[V]) && V != "tag")
			var/FormVar/fv = new()
			fv.name = V

			if(istext(vars[V])) fv.input_type = TEXT_ITYPE
			else if(isnum(vars[V])) fv.input_type = NUM_ITYPE

			fv.size = form_default_size
			fv.maxlength = form_default_maxlen

			if(V == "submit") fv.interface = SUBMIT
			else if(V == "reset") fv.interface = RESET

			var/var_values = "[V]_values"
			if(var_values in myvars)
				fv.values = vars[var_values]

			var/var_validate = "[V]_validate"
			if(var_validate in myvars)
				fv.validate = vars[var_validate]

			var/var_maxlen = "[V]_maxlen"
			if(var_maxlen in myvars)
				fv.maxlength = vars[var_maxlen]

			var/var_size = "[V]_size"
			if(var_size in myvars)
				fv.size = vars[var_size]

			var/var_wrap = "[V]_wrap"
			if(var_wrap in myvars)
				fv.wrap = vars[var_wrap]

			var/var_extra = "[V]_extra"
			if(var_extra in myvars)
				fv.extra = vars[var_extra]

			var/var_label = "[V]_label"
			if(var_label in myvars)
				fv.label = vars[var_label]

			var/var_hidden = "[V]_hidden"
			if(var_hidden in myvars)
				fv.hidden = vars[var_hidden]

			var/n
			for(n=1,,n++)
				var/var_n = "[V]_[n]"
				if(var_n in myvars)
					fv.interface = RADIO

					var/FormVar/rv = new()
					rv.interface = RADIO_OPTION
					rv.name = var_n
					rv.radio_name = fv.name
					rv.value = (vars[var_n] || n)
					form_vars += rv

					var/var_n_label = "[var_n]_label"
					if(var_n_label in myvars)
						rv.label = vars[var_n_label]

					if(!fv.values) fv.values = list(rv.value)
					else fv.values += rv.value
					if(isnum(rv.value))
						if(fv.input_type == AUTO) fv.input_type = NUM_ITYPE
					else if(fv.input_type == NUM_ITYPE) fv.input_type = TEXT_ITYPE
				else break

			var/var_interface = "[V]_interface"
			if(var_interface in myvars)
				fv.interface = vars[var_interface]

			if(fv.interface == AUTO || fv.interface == SUB_FORM)
				var/Form/sf = vars[fv.name]
				if(istype(sf))
					//TODO: make sure prefix plus sub-form variables do not conflict with any others on this form
					sf.SetVarPrefix("[form_var_prefix][fv.name]_")
					fv.interface = SUB_FORM
				else if(fv.interface == SUB_FORM)
					world.log << "Error: [type]/var/[fv.name] must be a form object."

			if(fv.interface == AUTO || fv.interface == BUTTON || fv.interface == PROMPT)
				var/clickproc = "[fv.name]Click"
				if(hascall(src,clickproc)) fv.clickproc = clickproc
				else
					clickproc = Capitalize(clickproc)
					if(hascall(src,clickproc)) fv.clickproc = clickproc

			if(fv.clickproc && fv.interface == AUTO)
				fv.interface = BUTTON

			if(fv.interface == PROMPT_FOR_ICON)
				fv.interface = PROMPT
				fv.input_type = ICON_ITYPE
			else if(fv.interface == PROMPT_FOR_SOUND)
				fv.interface = PROMPT
				fv.input_type = SOUND_ITYPE
			else if(fv.interface == PROMPT_FOR_FILE)
				fv.interface = PROMPT
				fv.input_type = FILE_ITYPE
			else if(fv.interface == PROMPT && !fv.clickproc)
				world.log << "Error: [type]/var/[fv.name] needs a Click() proc or an input type."
			else if(fv.interface == BUTTON && !fv.clickproc)
				world.log << "Error: [type]/var/[fv.name] needs a Click() proc."

			form_vars += fv

Form/SetVarPrefix(var_prefix)
	var/FormVar/fv
	form_var_prefix = var_prefix
	for(fv in form_vars)
		if(fv.interface == SUB_FORM)
			var/Form/sf = vars[fv.name]
			sf.SetVarPrefix("[form_var_prefix][fv.name]_")

Form/GetHiddenHtml(parent_form)
	form_hidden++
	return GetHtml(parent_form)
	form_hidden--

//Set up variables and call user-defined HtmlLayout().
Form/GetHtml(Form/parent_form)
	var/html
	var/body
	var/FormVar/fv
	var/submit_only = 1

	form_is_sub = (parent_form && parent_form != src) ? 1 : 0

	//generate html code for each input variable
	for(fv in form_vars)
		fv.value = vars[fv.name]
		switch(fv.interface)
			if(RADIO_OPTION) fv.checked = (vars[fv.radio_name] == fv.value)
			if(BUTTON,PROMPT)
				if(form_byond_mode)
					fv.click_script = GetButtonScript(fv.name,parent_form)
				else //assume this is an upload field
					form_method = "post"
					form_enctype = "multipart/form-data"
			if(SELECT,MULTI_SELECT,CHECKLIST,RADIO_LIST,HIDDEN_LIST)
				var/var_values = "[fv.name]_values"
				if(var_values in vars)
					fv.values = vars[var_values]

		fv.html_value = html_encode(fv.value)
		vars[fv.name] = fv.MakeInputTag(src,form_var_prefix)

	if(!form_hidden)
		body = HtmlLayout()  //user generates html by inserting form variables

	//restore variables and tag on hidden ones
	for(fv in form_vars)
		if(fv.hidden || form_hidden) body += vars[fv.name]
		vars[fv.name] = fv.value

		switch(fv.interface)
			if(SUBMIT,RESET,CHECKBOX)
			else
				submit_only = 0

	if(!form_is_sub)
		//add the <form> wrapper
		var/encoding
		var/method = form_method
		if(form_enctype) encoding = " enctype=[form_enctype]"
		if(form_byond_mode) method = "get" //post does not work in Dream Seeker
		html = "<form method=[method][encoding] action='[GetSubmitUrl(form_sub_path)]' [form_extra]>\n"
		if(form_cgi_mode) html += "<input type=hidden name=type value=[type]>\n"
		else html += "<input type=hidden name=src value='[html_encode("\ref[src]")]'>\n"
		if(submit_only) html += "<input type=hidden name=submit value=1>\n" //prevent solitary submit button from submitting an empty set of params (so form will be processed)
		html += "[body]\n</form>"
	else
		html = body

	return html

Form/GetSubmitUrl(sub_path)
	if(form_url) return form_url
	var/url
	if(form_cgi_mode)
		url = world.url
		if(!url || findtext(url,"byond://") == 1)
			url = "byond://" //presumably we are in BYOND mode
	else url = "byond://"
	if(sub_path) url = "[url]/[sub_path]"
	return url

Form/GetSelfUrl(params,mob/U=usr,passive)
	var/FormVar/fv
	var/plist[0]
	usr = U
	if(ismob(params) && !U)
		//shuffle args around for backwards compatibility
		U = params
		params = null

	if(params || params == "")
		if(istext(params)) plist = params2list(params)
		else plist = params
	else
		for(fv in form_vars)
			switch(fv.interface)
				if(RADIO_OPTION,BUTTON,PROMPT,SUBMIT,RESET) continue
			plist[fv.name] = vars[fv.name]

	if(form_cgi_mode)
		plist["type"] = type
	else
		plist["src"] = src
		if(!passive)
			StartWaiting()

	return html_encode("[GetSubmitUrl(form_sub_path)]?[list2params(plist)]")

Form/GetButtonScript(name,Form/parent_form)
	if(form_is_sub && form_cgi_mode)
		return parent_form.GetButtonScript(name)
	else
		return {"document.location.href="[GetSelfUrl(form_var_prefix + name,form_usr,passive=1)]""}

Form/GetHtmlHead()
	if(form_title) return "<title>[form_title]</title>"

Form/GetHtmlDoc()
	var/head = GetHtmlHead()
	var/body = GetHtml()
	return {"\
<html>
<head>
[head]
</head>
<body>
[body]
</body>
</html>
"}

//generate the html for an input variable
FormVar/MakeInputTag(var/Form/form,var_prefix)
	var/html
	var/html_name = var_prefix + name

	if(input_type == FORM.AUTO)
		if(istext(value)) input_type = FORM.TEXT_ITYPE
		else if(isnum(value)) input_type = FORM.NUM_ITYPE
		else if(isicon(value)) input_type = FORM.ICON_ITYPE

	if(interface == FORM.AUTO)
		if(values)
			interface = FORM.SELECT
			if(istype(value,/list)) interface = FORM.MULTI_SELECT
		else if(input_type == FORM.ICON_ITYPE)  interface = FORM.PROMPT_FOR_ICON
		else if(input_type == FORM.SOUND_ITYPE) interface = FORM.PROMPT_FOR_SOUND
		else if(input_type == FORM.FILE_ITYPE)  interface = FORM.PROMPT_FOR_FILE
		else if(findtext(size,"x"))  interface = FORM.TEXTAREA
		else if(istype(value,/Form)) interface = FORM.SUB_FORM
		else interface = FORM.TEXT

	//some hidden elements are handled specially
	if(hidden || form.form_hidden)
		switch(interface)
			if(FORM.HIDDEN_LIST,FORM.RADIO_OPTION,FORM.SUB_FORM)
			if(FORM.CHECKBOX)
				//this optimization also preserves boolean value at display time
				if(value) interface = FORM.HIDDEN
				else return
			if(FORM.MULTI_SELECT,FORM.CHECKLIST) interface = FORM.HIDDEN_LIST
			else interface = FORM.HIDDEN

	switch(interface)
		if(FORM.SELECT,FORM.MULTI_SELECT)
			html = "<select name=[html_name]"
			if(interface == FORM.MULTI_SELECT) html += " multiple"
			html += ">"
			var/V
			for(V in values)
				var/optval = html_encode(V)
				html += "<option"
				if(V == value || (V in value)) html += " selected"
				html += " value='[optval]'>[optval]\n"
			html += "</select>"

		if(FORM.TEXTAREA)
			var/row_col
			var/wrap_html
			if(size)
				var/xpos = istext(size) ? findtext(size,"x") : 0
				if(!xpos) row_col = " rows='[size]'"
				else
					row_col = " cols='[copytext(size,1,xpos)]' rows='[copytext(size,xpos+1)]'"
			if(wrap)
				wrap_html = " wrap='[wrap]'"
			html += "<textarea name=[html_name] [row_col][wrap_html]>[html_value]</textarea>"

		if(FORM.TEXT,FORM.PASSWORD)
			html = "<input name=[html_name]"
			if(interface == FORM.PASSWORD) html += " type=password"
			else html += " type=text"
			if(value) html += " value='[html_value]'"
			if(size) html += " size='[size]'"
			if(maxlength) html += " maxlength='[maxlength]'"
			html += " [extra]>"

		if(FORM.CHECKBOX)
			html = "<input name=[html_name] type=checkbox value=1"
			if(value) html += " checked"
			html += " [extra]>"

		if(FORM.RADIO_OPTION)
			html = "<input name='[radio_name]' type=radio value='[html_value]'"
			if(checked) html += " checked"
			html += " [extra]>"

		if(FORM.RADIO)
			return //not an interface element

		if(FORM.RESET)
			if(value && !form.form_is_sub) html = "<input type=reset value='[html_value]' [extra]>"
		if(FORM.SUBMIT)
			if(value && !form.form_is_sub) html = "<input type=submit value='[html_value]' [extra]>"
		if(FORM.BUTTON)
			if(click_script)
				html = "<input type=button value='[label || html_value || name]' onClick='[click_script]' [extra]>"
			else
				world.log << "htmllib.dm: ([name]) buttons do not work in web mode"
		if(FORM.PROMPT)
			if(click_script)
				html = "<input type=button value='...' onClick='[click_script]' [extra]>"
			else if(input_type == FORM.ICON_ITYPE || input_type == FORM.SOUND_ITYPE || input_type == FORM.FILE_ITYPE)
				html = "<input name=[html_name] type=file [extra]>"
			else
				world.log << "htmllib.dm: ([name]) buttons do not work in web mode"

		if(FORM.HIDDEN)
			html = "<input name=[html_name] type=hidden value='[html_value]' [extra]>"

		if(FORM.SUB_FORM)
			var/Form/sf = value
			if(hidden || form.form_hidden) html = sf.GetHiddenHtml(form)
			else html = sf.GetHtml(form)

		if(FORM.HIDDEN_LIST)
			for(var/V in value)
				html += "<input name=[html_name] value='[html_encode(V)]' type=hidden [extra]>\n"

		if(FORM.CHECKLIST)
			html = list()
			for(var/V in values)
				html[V] = "<input name=[html_name] value='[html_encode(V)]' type=checkbox[(V in value) ? " checked" : ""] [extra]>"

		if(FORM.RADIO_LIST)
			html = list()
			for(var/V in values)
				html[V] = "<input name=[html_name] value='[html_encode(V)]' type=radio[(V == value) ? " checked" : ""] [extra]>"

	return html

Form/PreDisplayForm(mob/U=usr)
	if(form_waiting)
		world.log << "Error: DisplayForm([U]) called before previous submission finished."
		form_waiting = null
		form_wait_count = 0

	usr = U
	if(!usr.client) return  //no sense in creating form for NPC
	Initialize()

	for(var/FormVar/fv in form_vars)
		if(fv.interface == SUB_FORM)
			var/Form/sf = vars[fv.name]
			//TODO: could call sf.PreDisplayForm() here but code currently assumes lack of StartWaiting() call on sub-forms
			sf.Initialize()

	StartWaiting()

Form/DisplayForm(mob/U=usr)
	usr = U
	PreDisplayForm()
	usr << browse(GetHtmlDoc(),form_window)

//This is primarily used by CGI scripts on the web
//optional params list contains the pre-parsed contents of href
Form/SubmitForm(href,mob/U=usr,params)
	usr = U
	if(!form_wait_count) StartWaiting()
	return Topic(href,params)

Form/Topic(href,params[])
	if(usr != form_usr)
		world.log << "Illegal form call by ([usr],[type])."
		return //do not do normal wrapup

	if(!form_sub_path)
		if(form_byond_mode)
			if(findtext(href,"/",1,2))
				var/qry = findtext(href,"?")
				form_sub_path = copytext(href,2,qry)

	var/FormVar/fv
	for(fv in form_vars)
		var/html_name = form_var_prefix + fv.name

		if(html_name in params)
			var/val = params[html_name]
			if(fv.interface == MULTI_SELECT || fv.interface == CHECKLIST || fv.interface == HIDDEN_LIST)
				if(!istype(val,/list)) val = list(val)
				var/lst[] = val
				if(fv.input_type == NUM_ITYPE)
					for(var/i=1,i<=lst.len,i++)
						lst[i] = text2num(lst[i])
				for(var/i=1,i<=lst.len,i++)
					if(!(lst[i] in fv.values))
						if(fv.input_type != NUM_ITYPE && (text2num(lst[i]) in fv.values))
							lst[i] = text2num(lst[i])
						else if(fv.validate)
							world.log << "Illegal value for [fv.name] from ([usr]): ([href])."
							goto wrapup
			else
				if(fv.input_type == NUM_ITYPE)
					val = text2num(val)
				if(fv.values && !(val in fv.values))
					if(fv.input_type != NUM_ITYPE && (text2num(val) in fv.values))
						//only some values are numeric, and this is one of them
						val = text2num(val)
					else if(fv.validate)
						world.log << "Illegal value for [fv.name] from ([usr]): ([href])."
						goto wrapup
			switch(fv.interface)
				if(SUBMIT)
					//ignore -- bogus submit value is used to force processing of empty forms
				if(RADIO_OPTION,RESET) //these should never get set
					world.log << "Illegal form input from ([usr]): ([href])."
					goto wrapup
				if(BUTTON) //only happens when button is clicked--not when form is submitted
					StartWaiting()
					call(src,fv.clickproc)()
					StopWaiting()
					return BUTTON_CLICK
				if(PROMPT)
					if(form_byond_mode)
						StartWaiting()
						switch(fv.input_type)
							if(ICON_ITYPE)
								var/pval = (input(usr,fv.label || fv.name) as icon|null)
								if(!pval && vars[fv.name] && alert("Retain previous setting?",,"Yes","No") == "Yes")
									pval = vars[fv.name]
								vars[fv.name] = pval
							if(SOUND_ITYPE)
								var/pval = (input(usr,fv.label || fv.name) as sound|null)
								if(!pval && vars[fv.name] && alert("Retain previous setting?",,"Yes","No") == "Yes")
									pval = vars[fv.name]
								vars[fv.name] = pval
							if(FILE_ITYPE)
								var/pval = (input(usr,fv.label || fv.name) as file|null)
								if(!pval && vars[fv.name] && alert("Retain previous setting?",,"Yes","No") == "Yes")
									pval = vars[fv.name]
								vars[fv.name] = pval
							else
								vars[fv.name] = call(src,fv.clickproc)()
						StopWaiting()
						return BUTTON_CLICK

			if(fv.input_type == ICON_ITYPE || fv.input_type == SOUND_ITYPE || fv.input_type == FILE_ITYPE)
				if(findtext(val,"\[") == 1)
					val = locate(val)
				//TODO: check file type

			vars[fv.name] = val

		else //no value submitted
			switch(fv.interface)
				if(CHECKBOX)
					vars[fv.name] = null

	//do sub-forms
	for(fv in form_vars)
		if(fv.interface == SUB_FORM)
			var/Form/sf = vars[fv.name]
			var/ret = sf.SubmitForm(href,usr,params)
			if(ret == BUTTON_CLICK) return ret

	wrapup:
	StopWaiting()
	return SUBMIT_CLICK

Form/StartWaiting()
	form_usr = usr
	if(form_cgi_mode)
		form_waiting = 1   //allow garbage collector to delete us, because CGI creates a new instance of form for processing
	else
		form_waiting = src //avoid garbage collector
	form_wait_count += 1

Form/StopWaiting()
	if(form_wait_count)
		form_wait_count -= 1

	if(!form_wait_count)
		if(form_reusable) form_wait_count = 1 //reset wait counter
		else
			form_usr = null
			form_waiting = null
		ProcessForm()


Form/proc/Capitalize(txt)
	return uppertext(copytext(txt,1,2)) + copytext(txt,2)

//The default HtmlLayout() is almost always overridden by the user.  It makes
//a very simple (and probably ugly) form interface for the given variables.
//It does make rapid form development a breeze, though.
Form/HtmlLayout()
	var/FormVar/fv
	var/html

	for(fv in form_vars)
		if(fv.hidden || form_hidden)
			continue //hidden variables are automatically inserted
		if(fv.interface == SUBMIT || fv.interface == RESET || fv.interface == RADIO) continue
		if(fv.interface != RADIO_OPTION && fv.interface != BUTTON && fv.interface != HIDDEN && fv.interface != HIDDEN_LIST && !fv.hidden)
			html += fv.label || Capitalize(fv.name)
		var/value = vars[fv.name]
		if(istype(value,/list))
			for(var/V in value)
				html += "<br>\n"
				html += value[V]
				html += V
		else
			html += value
		if(fv.interface == RADIO_OPTION)
			html += fv.label || fv.html_value
		html += "<br>\n"

	//Put the submit button at the bottom
	for(fv in form_vars)
		if(fv.interface != SUBMIT && fv.interface != RESET) continue
		html += vars[fv.name]

	return html

//delete forms waiting on players who log out
client/Del()
	var/Form/F
	for(F)
		if(F.form_usr == mob) del F
	return ..()

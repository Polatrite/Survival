obj
	system
		close_inventory
			icon = 'obj3.dmi'
			icon_state = "inventory icon"
			Click()
				winset(usr.client, "mainPane.inventory", "is-visible=false")
				//winset(usr.client, "default.menu_browser", "is-visible=true")



mob/game
	proc
/*
		output_stat_html()
			var/html = interface_html_header
			// Moved this stuff to /mob/game/UpdateStats
//			var/hp_percent = hp / maxhp
//			var/stamina_percent = stamina / maxstamina
//			hp_percent *= 100
//			stamina_percent *= 100
//			winset(src, "default.hp_bar", "value=[hp_percent]")
//			winset(src, "default.stamina_bar", "value=[stamina_percent]")
			html += {"
  <script type="text/javascript" src="sActions.js"></script> <!-- JavaScript Commands -->
    <body onload="killFocus()" onmouseup="killFocus()">
    </body>
"}
/*
      <div class="spacer" style="height:4px; font-size:4px"></div>
      <div class="spacer" style="height:4px; font-size:4px"></div>
      <div class="spacer" style="height:4px; font-size:4px"></div>


      Health:
      [hp]/[maxhp]<br>
      <div class="rect" id="rectangle" style="width:[207 * hp_percent]; height:13; background-color:#A00; border:2 solid #5A4334;"> </div>
      <div class="spacer" style="height:4px; font-size:4px"></div>
      Stamina:
      [stamina]/[maxstamina]<br>
      <div class="rect" id="rectangle" style="width:[207 * stamina_percent]; height:13; background-color:#00A; border:2 solid #5A4334;"> </div>


      Weight:<br/>
      [weight_held]/[weight_max]<br/>
*/
			html += interface_html_footer

			return html */






/* old tabs


		<!-- Wood Panel (Woodworking) -->
		<div class="actions" id="woodPanel">
			<button class="imgBtn" onmouseover="showDesc('<b>Lumberjack</b><br/>Chop down a nearby tree with an axe.', this)" onclick="sendMessage('action=lumberjack')" onmouseout="clearDesc(this)"><img src="sWoodLumberjack.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Chop</b><br/>Chop a nearby log into lumber with an axe.', this)" onclick="sendMessage('action=chop')" onmouseout="clearDesc(this)"><img src="sWoodChop.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Uproot</b><br/>Uproot a nearby stump with a shovel.', this)" onclick="sendMessage('action=uproot')" onmouseout="clearDesc(this)"><img src="sWoodUproot.png"/></button>
			<br>
			<button class="imgBtn" onmouseover="showDesc('<b>Craft</b><br/>Create wooden tools and items from logs and lumber.', this)" onclick="sendMessage('action=craft')" onmouseout="clearDesc(this)"><img src="sWoodCraft.png"/></button>
		</div>


		<!-- Stone Panel (Stoneworking) -->
		<div class="actions" id="stonePanel">
			<button class="imgBtn" onmouseover="showDesc('<b>Sculpt</b><br/>Create stone tools and items from boulders and stone.', this)" onclick="sendMessage('action=sculpt')" onmouseout="clearDesc(this)"><img src="sStoneSculpt.png"/></button>
		</div>


		<!-- Brick Panel (Brickworking) -->
		<div class="actions" id="brickPanel">
			<button class="imgBtn" onmouseover="showDesc('<b>Fill</b><br/>Fill brickracks with clay.', this)" onclick="sendMessage('action=fill')" onmouseout="clearDesc(this)"><img src="sBrickFill.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Remove</b><br/>Remove bricks from brickracks.', this)" onclick="sendMessage('action=remove')" onmouseout="clearDesc(this)"><img src="sBrickRemove.png"/></button>
			<br>
			<button class="imgBtn" onmouseover="showDesc('<b>Build</b><br/>Build constructions with bricks.', this)" onclick="sendMessage('action=brickbuild')" onmouseout="clearDesc(this)"><img src="sBrickBuild.png"/></button>
		</div>


		<!-- Metal Panel (Metalworking) -->
		<div class="actions" id="metalPanel">
			<button class="imgBtn" onmouseover="showDesc('<b>Mine</b><br/>Mine ore and other minerals from rock.', this)" onclick="sendMessage('action=mine')" onmouseout="clearDesc(this)"><img src="sMetalMine.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Refine</b><br/>Refine ores and other minerals into more usable forms.', this)" onclick="sendMessage('action=refine')" onmouseout="clearDesc(this)"><img src="sMetalRefine.png"/></button>
			<br>
			<button class="imgBtn" onmouseover="showDesc('<b>Forge</b><br/>Create metal equipment and items from ore and metal bars.', this)" onclick="sendMessage('action=forge')" onmouseout="clearDesc(this)"><img src="sMetalForge.png"/></button>
		</div>





			<button class="imgBtn" onmouseover="showDesc('<b>Pick Up</b><br/>Picks up a nearby item.', this)" onclick="sendMessage('action=get')" onmouseout="clearDesc(this)"><img src="sPersonPickup.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Drop</b><br/>Drops an item from your inventory.', this)" onclick="sendMessage('action=drop')" onmouseout="clearDesc(this)"><img src="sPersonDrop.png"/></button>
			<br>
			<button class="imgBtn" onmouseover="showDesc('<b>Equipment</b><br/>Displays the weapons and armor you posess.', this)" onclick="sendMessage('action=equipment')" onmouseout="clearDesc(this)"><img src="sPersonEquipment.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Skills</b><br/>Displays your skill points.', this)" onclick="sendMessage('action=skills')" onmouseout="clearDesc(this)"><img src="sPersonSkills.png"/></button>






<a class="tab" onmouseover="showDesc('<big><b>Woodworking</b></big>')" onmouseout="clearDesc()" href="javascript:showPanel('wood', 0, 'Woodworking')" onclick="this.blur()" id="woodTab"><img src="sTabWood.png" border="0"/></a><a class="tab" onmouseover="showDesc('<big><b>Stoneworking</b></big>')" onmouseout="clearDesc()" href="javascript:showPanel('stone', 0, 'Masonry')" onclick="this.blur()" id="stoneTab"><img src="sTabStone.png" border="0"/></a><a class="tab" onmouseover="showDesc('<big><b>Brickworking</b></big>')" onmouseout="clearDesc()" href="javascript:showPanel('brick', 0, 'Brickworking')" onclick="this.blur()" id="brickTab"><img src="sTabBrick.png" border="0"/></a><a class="tab" onmouseover="showDesc('<big><b>Metalworking</b></big>')" onmouseout="clearDesc()" href="javascript:showPanel('metal', 1, 'Metalworking')" onclick="this.blur()" id="metalTab"><img src="sTabMetal.png" border="0"/></a><img class="tab" src="sTabEnd.png" id="endTab"/>

*/


		output_menu_html()
			var/html = interface_html_header
			html += {"
  <body onload="initPanel('[client.current_tab]')" onmouseup="killFocus()">
      <div class="container">

<a class="tab" onmouseover="showDesc('<big><b>Personal</b></big>')" onmouseout="clearDesc()" href="javascript:showPanel('person', 0, 'Personal')" onclick="this.blur()" id="personTab"><img src="sTabPerson.png" border="0"/></a>

      <div class="folder">
        &nbsp; <b id="tabTitle">Category</b>

        <!-- Neutral Panel -->
        <div class="actions" id="Panel" style="display: block">
        </div>


		<!-- Person Panel (Personal) -->
		<div class="actions" id="personPanel">
			<button class="imgBtn" onmouseover="showDesc('<b>Inventory</b><br/>Displays the items you are posessing.', this)" onclick="sendMessage('action=inventory')" onmouseout="clearDesc(this)"><img src="sPersonInventory.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Survival</b><br/>Shows the basic survival crafts menu.', this)" onclick="sendMessage('action=survival')" onmouseout="clearDesc(this)"><img src="sWoodCraft.png"/></button>
			<button class="imgBtn" onmouseover="showDesc('<b>Settings</b><br/>Modify your game settings.', this)" onclick="sendMessage('action=settings')" onmouseout="clearDesc(this)"><img src="sPersonSkills.png"/></button>
			<table cellpadding=0 cellspacing=0 class="skills">
"}

			var/increase_file = "icon_plus.png"
			var/locked_file = "icon_lock.png"
			var/decrease_file = "icon_minus.png"
			var/alt = FALSE
			for(var/skill/S in skill_list)
				increase_file = "icon_plus.png"
				locked_file = "icon_lock.png"
				decrease_file = "icon_minus.png"
				switch(S.status)
					if(INCREASE)
						increase_file = "icon_plus_selected.png"
					if(LOCKED)
						locked_file = "icon_lock_selected.png"
					if(DECREASE)
						decrease_file = "icon_minus_selected.png"
				alt = !alt
				html += {"<tr [alt ? "class=\"odd\"" : ""]><td>[S.print_name]</td><td>[S.level]</td><td>[S.focus]%</td><td><img class="lockBtn" onmouseover="showDesc('Increase Focus</b><br/>Allows skill focus to increase.<br/>Requires another skill to be decreasing.', this)" onclick="sendMessage('action=skillset&type=increase&skill=[S.name]')" onmouseout="clearDesc(this)" src="[increase_file]"/><img class="lockBtn" onmouseover="showDesc('<b>Lock Focus</b><br/>Locks skill focus, preventing any change.', this)" onclick="sendMessage('action=skillset&type=lock&skill=[S.name]')" onmouseout="clearDesc(this)" src="[locked_file]"/><img class="lockBtn" onmouseover="showDesc('<b>Decrease Focus</b><br/>Allows skill focus to decrease.<br/>Allows another skill to increase.', this)" onclick="sendMessage('action=skillset&type=decrease&skill=[S.name]')" onmouseout="clearDesc(this)" src="[decrease_file]"/></td>"}

			html += {"
			</table>
		</div>


        <div class="desc" id="descPanel"></div>

      </div>
"}

			html += interface_html_footer

			return html





var
	interface_html_header = {"<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>Survival Command Panel</title>
    <style type="text/css">
      <!--

      BODY {
      	background-color: #080;
      	background-image: url("sLeaves.png");
      	font-family: tahoma;
      	color: #FE6;
      }

      .imgBtn {
      	border: 2 outset #FEA;
      	background-color: #FEA;
      	height: 36px;
      	width: 36px;
      	margin: 2px 3px 2px 3px;
      }

      .lockBtn {
      	border: 1 outset #FEA;
      	background-color: #FEA;
      	height: 16px;
      	width: 16px;
      	margin: 2px 2px 2px 3px;
      	padding: 0px 0px 0px 0px;
      }

      .container {
      	width:207;
      	height:407;
      	position:absolute;
      	border:0 solid #000;
      }

      .folder {
      	border: 2 solid #5A4334;
      	background-color: #FEA;
      	background-image: url("sPaper.png");
      	padding: 3px 3px 3px 3px;
      	color: #040;
      }

      .folder .actions, .folder .desc {
      	border: 1 inset #FEA;
      	background-color: rgb(108,135,107);
      	padding: 5px 5px 5px 5px;
      	text-align: center;
      	font-size: 10px;
      }

      .folder .skills {
      	table-layout: automatic;
      	text-align: left;
      	padding: 2px 2px 2px 2px;
      	margin: 0px 0px 0px 0px;
      	font-size: 10px;
      }

      .odd {
      	background-color: rgb(92,115,92);
      }

      .folder .actions {
        height: 200px;
        display: none;
      }

      .folder .desc {
      	height: 6em;
      	color: #FFF;
      	margin-left: 10px;
      	margin-right: 10px;
      	padding: 0px 5px 0px 5px;
      	font-size: 10px;
      }

      .tab {
      	position: relative;
      	top: 3;
        left: 9;
        padding: 0px !important;
        margin: 0px !important;
      	cursor: default;
      }
      -->
    </style>
    <script type="text/javascript" src="sActions.js"></script> <!-- JavaScript Commands -->
  </head>
"}

	interface_html_footer = {"
    </div>
  </body>
</html>
"}


	login_html_header = {"
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Survival Command Panel</title>
    <style type="text/css">
        BODY
        {
            background-color: #080;
            background-image: url("sLeaves.png");
            font-family: tahoma;
            color: #FE6;
        }
        .lockBtn
        {
            border: 1 outset #FEA;
            background-color: #FEA;
            height: 16px;
            width: 16px;
            margin: 2px 2px 2px 3px;
            padding: 0px 0px 0px 0px;
        }
        .folder
        {
            border: 2 solid #5A4334;
            background-color: #FEA;
            background-image: url("sPaper.png");
            padding: 3px 3px 3px 3px;
            color: #040;
            z-index: 1;
        }
        .folder .actions
        {
            border: 1 inset #FEA;
            background-color: rgb(108,135,107);
            padding: 5px 5px 5px 5px;
            text-align: center;
            font-size: 10px;
            color: #FE6;
        }
        A
        {
            text-decoration: none;
            color: #FE6;
        }
        BUTTON
        {
            border: 2px outset #FEA;
            background-color: #FEA;
            color: #040;
            padding: 2px 3px 2px 3px;
            font-weight: bold;
        }
        .bgimage
        {
            position: absolute;
            left: 30px;
            z-index: -1;
        }
        .odd
        {
            background-color: rgb(92,115,92);
        }
        .chars
        {
            margin: 10px;
        }
        .chars TD
        {
            padding: 3px 8px 3px 8px;
        }
        .charName
        {
            font-weight: bold;
        }
        .charExp
        {
            text-align: right;
        }
        .charDelete
        {
            width: 8px;
        }
        .charDelete A
        {
            color: Red;
        }
    </style>

    <!-- JavaScript Commands -->
</head>
<body>
    <div class="folder">
        &nbsp; <b id="B1">Introduction</b>
        <div class="actions">
<br/>
Welcome to the game of Survival.  It is you and an array of various
men and women all lost at sea on a group of uncharted islands.
The game is to sustain yourself, shelter yourself, and establish
your new and seemingly simple life.  There is no government, no laws,
and the value of honor varies greatly from one individual to the
next.  You must go to whatever lengths you deem necessary to get
ahead in this shambles of a civilization.  Stake your ground,
hoard the resources, and follow your most basic survival instincts.
<br/>
<br/>
Wake up and smell the sweat, because you aren't in Kansas any more.
<br/>
<br/>
<a href="byond://?src=0&page=version"></a>
        </div>
        &nbsp; <b id="B2">Your Characters</b>
        <div class="actions">
            <table class="chars" cellspacing="0" width="70%">
				"}

/*

            margin-top: 60px;

    <div class="bgimage"><img src="sLogoLeaves.png" alt="" /></div>
*/

	craft_html_header = {"<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Survival Command Panel</title>
    <style type="text/css">
        BODY
        {
            background-color: #080;
            background-image: url("sLeaves.png");
            font-family: tahoma;
            color: #FE6;
        }
        .header
        {
            text-align: center;
            font-size: 150%;
        }
        .header IMG
        {
            border: 2px outset #FEA;
            background-color: #FEA;
            height: 36px;
            width: 36px;
            margin: 2px 3px 2px 3px;
            vertical-align: middle;
        }
        .lockBtn
        {
            border: 1 outset #FEA;
            background-color: #FEA;
            height: 16px;
            width: 16px;
            margin: 2px 2px 2px 3px;
            padding: 0px 0px 0px 0px;
        }
        .container
        {
            border: none;
        }
        .folder
        {
            border: 2 solid #5A4334;
            background-color: #FEA;
            background-image: url("sPaper.png");
            padding: 3px 3px 3px 3px;
            color: #040;
        }
        .folder .actions
        {
            border: 1 inset #FEA;
            background-color: rgb(108,135,107);
            padding: 5px 5px 5px 5px;
            text-align: center;
            font-size: 10px;
        }
        .actions table
        {
            width: 80% !important;
        }
        .projects
        {
            font-size: 120%;
            padding: 0px 5px 0px 5px;
        }
        .projects TH
        {
            padding-bottom: 3px;
        }
        .projectName
        {
            font-weight: bold;
        }
        .odd
        {
            background-color: rgb(92,115,92);
        }
        .odd dark
        {
            background-color: rgb(92,115,92);
        }
        .desc
        {
            font-size: 80%;
            padding-bottom: 5px;
            font-weight: normal;
        }
        .resources
        {
            background-repeat: no-repeat;
            background-position: left center;
            height: 32px;
            width: 32px;
            font-size: 110%;
            padding-top: 18px;
            font-weight: bold;
            text-align: right;
            vertical-align: baseline;
            color: #0ff;
        }
        A
        {
            color: #FE6;
            text-decoration: none;
        }
    </style>

    <script type="text/javascript" src="sActions.js"></script>

    <!-- JavaScript Commands -->
</head>
<body>
	"}



	account_login_html = {"
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Survival Command Panel</title>
    <style type="text/css">
        BODY
        {
            background-color: #080;
            background-image: url("sLeaves.png");
            font-family: tahoma;
            color: #FE6;
        }
        .lockBtn
        {
            border: 1 outset #FEA;
            background-color: #FEA;
            height: 16px;
            width: 16px;
            margin: 2px 2px 2px 3px;
            padding: 0px 0px 0px 0px;
        }
        .folder
        {
            border: 2 solid #5A4334;
            background-color: #FEA;
            background-image: url("sPaper.png");
            padding: 3px 3px 3px 3px;
            color: #040;
            z-index: 1;
        }
        .folder .actions
        {
            border: 1 inset #FEA;
            background-color: rgb(108,135,107);
            padding: 5px 5px 5px 5px;
            text-align: center;
            font-size: 10px;
            color: #FE6;
        }
        A
        {
            text-decoration: none;
            color: #FE6;
        }
        BUTTON
        {
            border: 2px outset #FEA;
            background-color: #FEA;
            color: #040;
            padding: 2px 3px 2px 3px;
            font-weight: bold;
        }
        .bgimage
        {
            position: absolute;
            left: 30px;
            z-index: -1;
        }
        .odd
        {
            background-color: rgb(92,115,92);
        }
        .chars
        {
            margin: 10px;
        }
        .chars TD
        {
            padding: 3px 8px 3px 8px;
        }
        .charName
        {
            font-weight: bold;
        }
        .charExp
        {
            text-align: right;
        }
        .charDelete
        {
            width: 8px;
        }
        .charDelete A
        {
            color: Red;
        }
    </style>

    <!-- JavaScript Commands -->
</head>
<body>
    <div class="folder">
        &nbsp; <b id="B1">Introduction</b>
        <div class="actions">
			<br/>
			Welcome to the game of Survival.  It is you and an array of various
			men and women all lost at sea on a group of uncharted islands.
			The game is to sustain yourself, shelter yourself, and establish
			your new and seemingly simple life.  There is no government, no laws,
			and the value of honor varies greatly from one individual to the
			next.  You must go to whatever lengths you deem necessary to get
			ahead in this shambles of a civilization.  Stake your ground,
			hoard the resources, and follow your most basic survival instincts.
			<br/>
			<br/>
			Wake up and smell the sweat, because you aren't in Kansas any more.
			<br/>
			<br/>
			<a href="byond://?src=0&page=version"></a>
        </div>
        &nbsp; <b id="B2">Account Login</b>
        <div class="actions">
        	Users with a BYOND account can skip this process, <a href="https://secure.byond.com/?page=Join">sign up today</a> - it's free and quick!
            <form name="accountlogin" action="byond://" method="get">
            	<input type="hidden" name="action" value="login" />
	            <table class="chars" cellspacing="0" width="70%">
	            	<tr><td>Account Name:</td><td><input type="text" name="accountname" /></td></tr>
	            	<tr><td>Password:</td><td><input type="password" name="password" /></td></tr>
	            	<tr><td><B><a href="byond://?action=create" title="Create Account">\[Create Account\]</a></B></td><td><input type="submit" value="Login" /></td></tr>
	            </table>
           	</form>
        </div>
    </div>
</body>"}

	account_create_html = {"
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Survival Command Panel</title>
    <style type="text/css">
        BODY
        {
            background-color: #080;
            background-image: url("sLeaves.png");
            font-family: tahoma;
            color: #FE6;
        }
        .lockBtn
        {
            border: 1 outset #FEA;
            background-color: #FEA;
            height: 16px;
            width: 16px;
            margin: 2px 2px 2px 3px;
            padding: 0px 0px 0px 0px;
        }
        .folder
        {
            border: 2 solid #5A4334;
            background-color: #FEA;
            background-image: url("sPaper.png");
            padding: 3px 3px 3px 3px;
            color: #040;
            z-index: 1;
        }
        .folder .actions
        {
            border: 1 inset #FEA;
            background-color: rgb(108,135,107);
            padding: 5px 5px 5px 5px;
            text-align: center;
            font-size: 10px;
            color: #FE6;
        }
        A
        {
            text-decoration: none;
            color: #FE6;
        }
        BUTTON
        {
            border: 2px outset #FEA;
            background-color: #FEA;
            color: #040;
            padding: 2px 3px 2px 3px;
            font-weight: bold;
        }
        .bgimage
        {
            position: absolute;
            left: 30px;
            z-index: -1;
        }
        .odd
        {
            background-color: rgb(92,115,92);
        }
        .chars
        {
            margin: 10px;
        }
        .chars TD
        {
            padding: 3px 8px 3px 8px;
        }
        .charName
        {
            font-weight: bold;
        }
        .charExp
        {
            text-align: right;
        }
        .charDelete
        {
            width: 8px;
        }
        .charDelete A
        {
            color: Red;
        }
    </style>

    <!-- JavaScript Commands -->
</head>
<body>
    <div class="folder">
        &nbsp; <b id="B1">Introduction</b>
        <div class="actions">
			<br/>
			Welcome to the game of Survival.  It is you and an array of various
			men and women all lost at sea on a group of uncharted islands.
			The game is to sustain yourself, shelter yourself, and establish
			your new and seemingly simple life.  There is no government, no laws,
			and the value of honor varies greatly from one individual to the
			next.  You must go to whatever lengths you deem necessary to get
			ahead in this shambles of a civilization.  Stake your ground,
			hoard the resources, and follow your most basic survival instincts.
			<br/>
			<br/>
			Wake up and smell the sweat, because you aren't in Kansas any more.
			<br/>
			<br/>
			<a href="byond://?src=0&page=version"></a>
        </div>
        &nbsp; <b id="B2">Account Creation</b>
        <div class="actions">
        	Users with a BYOND account can skip this process, <a href="https://secure.byond.com/?page=Join">sign up today</a> - it's free and quick!
            <form name="accountcreate" action="byond://" method="get">
            	<input type="hidden" name="action" value="createaccount" />
	            <table class="chars" cellspacing="0" width="70%">
	            	<tr><td>Account Name:</td><td><input type="text" name="accountname" /></td></tr>
	            	<tr><td>Password:</td><td><input type="password" name="password" /></td></tr>
	            	<tr><td>Confirm Password:</td><td><input type="password" name="confirmpassword" /></td></tr>
	            	<tr><td></td><td><input type="submit" value="Create" /></td></tr>
	            </table>
           	</form>
        </div>
    </div>
</body>"}




	version_history_html = {"
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Survival Command Panel</title>
    <style type="text/css">
        BODY
        {
            background-color: #080;
            background-image: url("sLeaves.png");
            font-family: tahoma;
            color: #FE6;
        }
        .lockBtn
        {
            border: 1 outset #FEA;
            background-color: #FEA;
            height: 16px;
            width: 16px;
            margin: 2px 2px 2px 3px;
            padding: 0px 0px 0px 0px;
        }
        .folder
        {
            border: 2 solid #5A4334;
            background-color: #FEA;
            background-image: url("sPaper.png");
            padding: 3px 3px 3px 3px;
            color: #040;
            z-index: 1;
        }
        .folder .actions
        {
            border: 1 inset #FEA;
            background-color: rgb(108,135,107);
            padding: 5px 5px 5px 5px;
            text-align: left;
            font-size: 10px;
            color: #FE6;
        }
        A
        {
            text-decoration: none;
            color: #FE6;
        }
        BUTTON
        {
            border: 2px outset #FEA;
            background-color: #FEA;
            color: #040;
            padding: 2px 3px 2px 3px;
            font-weight: bold;
        }
        .bgimage
        {
            position: absolute;
            left: 30px;
            z-index: -1;
        }
        .odd
        {
            background-color: rgb(92,115,92);
        }
        .chars
        {
            margin: 10px;
        }
        .chars TD
        {
            padding: 3px 8px 3px 8px;
        }
        .charName
        {
            font-weight: bold;
        }
        .charExp
        {
            text-align: right;
        }
        .charDelete
        {
            width: 8px;
        }
        .charDelete A
        {
            color: Red;
        }
    </style>

    <!-- JavaScript Commands -->
</head>
<body>
    <div class="folder">
        &nbsp; <b id="B1">Version History</b>
        <div class="actions">
<h3>Beta 01</h3>
<p>
	Initial release!
</p>

"}

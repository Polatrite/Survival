var tabs = new Array("person","wood","stone","brick","metal");


function commafy(inStr)
{
	var outStr = new String();
	var tmpStr = new String();

	var len = inStr.length;
	if(len <= 3)
		return inStr;

	var index = len % 3;

	outStr = inStr.substring(0, index);

	while(1)
	{
		tmpStr = inStr.substring(index, index+3);
		if(outStr.length > 0)
			outStr = outStr + "," + tmpStr;
		else
			outStr = tmpStr;

		index += 3;

		if(index >= len)
			break;
	}

	return outStr;
}


function killFocus() {
  window.location = "byond://?killfocus"
}

function sendMessage(msg) {
  window.location = "byond://?" + msg + "&tab=" + activeTabName
}

function clearDesc(btn) {
  window.descPanel.innerText = "";
  if(btn) {btn.style.borderColor = "#FE8";}
}

function showDesc(msg, btn) {
  window.descPanel.innerHTML = msg;
  if(btn) {btn.style.borderColor = "#880";}
}

var activeTabName = ""
var activeEnd = 0

function showPanel(tab, end, title) {
  var activeTab = document.getElementById(activeTabName + "Tab");
  var activePanel = document.getElementById(activeTabName + "Panel");
  if(activeTab) {activeTab.style.top = 3;}
  if(activeEnd) {endTab.style.top = 3;}
  if(activePanel) {activePanel.style.display = "none";}
  activeTabName = tab;
  activeEnd = end;
  activeTab = document.getElementById(activeTabName + "Tab");
  activePanel = document.getElementById(activeTabName + "Panel");
  if(activeTab) {activeTab.style.top = 5;}
  if(activeEnd) {endTab.style.top = 5;}
  if(activePanel) {activePanel.style.display = "block";}
  tabTitle.innerHTML = title;
}

function initPanel(tab) {
  if(tab == "metal")
  {
      showPanel(tab, 1, returnTitle(tab));
  }
  else
  {
      showPanel(tab, 0, returnTitle(tab));
  }
  killFocus();
}

function returnTitle(tab) {
    switch(tab)
    {
        case "person":
            return "Personal";
            break;
        case "wood":
            return "Woodworking";
            break;
        case "stone":
            return "Masonry";
            break;
        case "brick":
            return "Brickworking";
            break;
        case "metal":
            return "Metalworking";
            break;
        default:
            break;
    }
}

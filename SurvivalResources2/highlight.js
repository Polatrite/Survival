var arrayOfRolloverClasses = new Array();
var arrayOfClickClasses = new Array();
var activeRow = false;
var activeRowClickArray = new Array();

function highlightTableRow()
{
	var tableObj = this.parentNode;
	if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

	if(this!=activeRow){
		this.setAttribute('origCl',this.className);
		this.origCl = this.className;
	}
	this.className = arrayOfRolloverClasses[tableObj.id];

	activeRow = this;

}

function clickOnTableRow()
{
	var tableObj = this.parentNode;
	if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;		

	if(activeRowClickArray[tableObj.id] && this!=activeRowClickArray[tableObj.id]){
		activeRowClickArray[tableObj.id].className='';
	}
	this.className = arrayOfClickClasses[tableObj.id];

	activeRowClickArray[tableObj.id] = this;

}

function resetRowStyle()
{
	var tableObj = this.parentNode;
	if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

	if(activeRowClickArray[tableObj.id] && this==activeRowClickArray[tableObj.id]){
		this.className = arrayOfClickClasses[tableObj.id];
		return;	
	}

	var origCl = this.getAttribute('origCl');
	if(!origCl)origCl = this.origCl;
	this.className=origCl;

}

function addTableRolloverEffect(tableId,whichClass,whichClassOnClick)
{
	arrayOfRolloverClasses[tableId] = whichClass;
	arrayOfClickClasses[tableId] = whichClassOnClick;

	var tableObj = document.getElementById(tableId);
	var tBody = tableObj.getElementsByTagName('TBODY');
	if(tBody){
		var rows = tBody[0].getElementsByTagName('TR');
	}else{
		var rows = tableObj.getElementsByTagName('TR');
	}
	for(var no=0;no<rows.length;no++){
		rows[no].onmouseover = highlightTableRow;
		rows[no].onmouseout = resetRowStyle;

		if(whichClassOnClick){
			rows[no].onclick = clickOnTableRow;	
		}
	}

}

function autoEnable() {
	var dropdownlist = document.getElementById("manufacturer");
	var selectedValue = dropdownlist.options[dropdownlist.selectedIndex].value;
	if (selectedValue == "All") {
  	  	disable()
  	} else {
   		enable();
    }
}

function disable() {
    // document.getElementById('type').value = "All";
    document.getElementById("type").disabled=true;
}
function enable() {
    document.getElementById("type").disabled=false;
}

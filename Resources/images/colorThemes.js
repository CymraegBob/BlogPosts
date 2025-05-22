function switchColorCSS(sheet){
	document.getElementById('colors').setAttribute('href',sheet);
	localStorage.setItem("color", sheet);
}


function updateColor(){
	var newSheet = document.getElementById("pageColor").value;
	switchColorCSS(newSheet)
}

function updateColorWithCookieCheck()
{
	var cookieColor = localStorage.getItem("color");
	document.getElementById("pageColor").value = cookieColor;
	updateColor();
}

window.onload = () => {
var transition = document.body.style.getPropertyValue("transition");
document.body.style.setProperty("transition", "none");
updateColorWithCookieCheck();
setTimeout((transition)=>{document.body.style.setProperty("transition", transition);}, 1000);
};

function posting(){
	var content = document.getElementById("editable").innerHTML;
	var textFile = null,
	makeTextFile = function(text){
		var file = new File([text], {type: 'text/plain'});
		var data = new FormData();
		data.append("upfile", file);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "upload_media.jsp");
		xhr.onload = function () {
    	console.log(this.status);
   	 	console.log(this.response);
 	 };
		xhr.send(data);
	}
	var file = makeTextFile(content);
		console.log(file);
}
function openFILE_INSERT_Modal() {
console.log("클릭됨");
  includeHTML(document.querySelector('.modal-section'), '/include/FILE_INSERT_MODAL');
}
function closeModal() {
  var modal = document.getElementById("myModal");
  modal.remove();
}

function includeHTML(divContainer, urlHTML) {
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) { divContainer.innerHTML = xhttp.responseText; }
            if (this.status == 404) { divContainer.innerHTML = "Page not found."; }
        }
    }
    console.log(urlHTML);	
    xhttp.open("GET", urlHTML, true);
    xhttp.send();
}
function insertLink(){
	var url = document.getElementById("url");
	var content = document.getElementById("editable");
	content.innerHTML += "<div><img draggable='false' src='" + url.value + "'><div>"
}
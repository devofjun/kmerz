function posting(){
	var content = document.getElementById("editable").innerHTML;
	var textFile = null,
  makeTextFile = function (content) {
    var data = new File([content], "1.txt",{type: "text/plain", lastModified: Date.now()});
	return data;
  };
      upload(makeTextFile(content));
}
function upload(file){
		var data = new FormData();
		data.append("file", file);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "media/upload_media");
		xhr.onload = function () {
 	 };
		xhr.send(data);
}
function openFILE_INSERT_Modal() {
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
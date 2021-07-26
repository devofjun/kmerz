function posting(){
	var content = document.getElementById("editable").innerHTML;
	var community_id = 'star';
	var category_no = 100;
	var post_title = document.getElementById("post_title").value;
	var textFile = null,
  makeTextFile = function (content) {
    var data = new File([content], "1.txt",{type: "text/plain", lastModified: Date.now()});
	return data;
  };
      upload(makeTextFile(content), community_id, category_no, post_title);
}
function upload(file, community_id, category_no, post_title){
		var data = new FormData();
		data.append("file", file);
		data.append("community_id", community_id);
		data.append("category_no", category_no);
		data.append("post_title", post_title);
		console.log(data);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "media/upload_media");
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
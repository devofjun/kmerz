/**
 * 
 */
function addComment(post_no){
	console.log("댓글쓰기");
	console.log(post_no);
	var commentContent = document.getElementById("comment_content").value;
	console.log(commentContent);
	var data = new FormData();
	data.append("commentContent", commentContent);
	data.append("post_no", post_no);
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "comment/addComment");
	xhr.send(data);
}
 function replytoggle(i){
	var commentNo = document.getElementById(i);
	var replyBtn = commentNo.querySelector("#reply-toggleBtn");
	var comment = commentNo.querySelector(".replyContent");
	replyBtn.click();
	if(replyBtn.checked){
	console.log("체크됨");
	includeHTML(commentNo.querySelector('.reply-section'), '/include/reply_input');
	}
	else{
	var replyInput = comment.querySelector(".reply-content");
  	replyInput.remove();
	}
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
function openModal(i) {
  document.body.style.overflow = "hidden";
  includeHTML(document.querySelector('.modal-section'), '/include/modal?post_no=' + i);
}
function closeModal() {
  var modal = document.getElementById("myModal");
  modal.remove();
  document.body.style.removeProperty("overflow");
}
window.onclick = function(event) {
	var modal = document.getElementById("myModal");
	  if (event.target == modal) {
	    modal.remove();
	    document.body.style.removeProperty("overflow");
	  }
}
					
function posttoggle(i) {
	var postNo = document.getElementById(i);
	var PostToggleBtn = postNo.querySelector("#post-toggleBtn");
	var post = postNo.querySelector(".post");
	var toggleImg = post.querySelector(".rightbar > .postDown");
	var toggleNavBar = post.querySelectorAll(".leftbar > .BottmNavBar > .toggleNav");
	if(PostToggleBtn.checked){
		post.style.height = "180px";
		post.style.minHeight = "180px";
		toggleImg.style.transform = "rotateX(0deg)";
		for(var j = 0; j < toggleNavBar.length; j++){
		toggleNavBar[j].style.visibility = "hidden";
		toggleNavBar[j].style.opacity = "0%";
		toggleNavBar[j].style.height = "0%";
		toggleNavBar[j].style.transition = "all ease .2s";
		}
	}else{
		post.style.minHeight = "300px";
		post.style.height = "auto";
		toggleImg.style.transform = "rotateX(180deg)";
		for(var j = 0; j < toggleNavBar.length; j++){
		toggleNavBar[j].style.visibility = "visible";
		toggleNavBar[j].style.opacity = "100%";
		toggleNavBar[j].style.height = "100%";
		toggleNavBar[j].style.transition = "all ease 4s";
		}	
	}
	PostToggleBtn.click();
}
	
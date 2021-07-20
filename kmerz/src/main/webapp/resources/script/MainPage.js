/**
 * 
 */
 function replytoggle(i){
	var commentNo = document.getElementById(i);
	var replyBtn = commentNo.querySelector("#reply-toggleBtn");
	var comment = commentNo.querySelector(".replyContent");
	includeHTML(commentNo.querySelector('.reply-section'), '/include/reply_input');
	replyBtn.click();
}

function setModal(i){
	var title = document.getElementById('modal-postTitle');
	var content = document.getElementById('modal-post-content');
	var commName = document.getElementsByClassName('community-name');
	var title_text = document.createTextNode('<%=postList.get(i).getPost_title()%>');	
	content.innerText = '<%=postList.get(i).getPost_content()%>';
	commName.innerText = '<%for(int j = 0; j < commList.size(); j++){if(postList.get(i).getCommunity_id().equals(commList.get(j).getCommunity_id())){%><%=commList.get(j).getCommunity_name()%><%}}%>';
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
console.log("클릭됨" + i);
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
		toggleImg.style.transform = "rotateX(0deg)";
		for(var j = 0; j < toggleNavBar.length; j++){
		toggleNavBar[j].style.visibility = "hidden";
		toggleNavBar[j].style.opacity = "0%";
		toggleNavBar[j].style.height = "0%";
		toggleNavBar[j].style.transition = "all ease .2s";
		}
	}else{
		post.style.height = "300px";
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
	
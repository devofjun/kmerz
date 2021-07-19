/**
 * 
 */
 function replytoggle(){
	var replyBtn = document.getElementById("reply-toggleBtn");
	replyBtn.click();
	console.log(replyBtn.checked);
}
function openModal() {
console.log("클릭됨");
  document.body.style.overflow = "hidden";
  const newModal = document.createElement('p');
  newModal.innerHTML = '<div id="myModal" class="modal"><div class="modal-content"><div class="modal-topbar"><span class="modal-close" onclick="closeModal()"><ion-icon size="large" name="close-sharp"></ion-icon></span></div><div class="modal-postContent"><div class="modal-content-left"><div class="modal-background border">	<div class="modal-postTitle">홍진호 만난 썰 푼다</div><div class="modal-body"><img src="/resources/images/squirrel.png"><p>람쥐썬더</p></div></div><div class="replySection"><div class="replyNav border"><span>sort by</span> <select><option>best</option></select><div class="totalReply">	<span>reply : 2개</span></div></div></div><jsp:include page="../include/reply.jsp" /></div><div class="modal-content-right margin-8"><jsp:include page="../include/modal_right.jsp" /></div></div></div></div>';
  document.body.appendChild(newModal);
}
function closeModal() {
  var modal = document.getElementById("myModal");
  modal.parentElement.remove();
  document.body.style.removeProperty("overflow");
}
window.onclick = function(event) {
	var modal = document.getElementById("myModal");
	  if (event.target == modal) {
	    modal.parentElement.remove();
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
	
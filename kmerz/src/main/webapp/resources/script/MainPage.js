/**
 * 
 */
 
function openModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "block";
}
function closeModal() {
  var modal = document.getElementById("myModal");
  modal.style.display = "none";
}
window.onclick = function(event) {
	var modal = document.getElementById("myModal");
	  if (event.target == modal) {
	    modal.style.display = "none";
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
	
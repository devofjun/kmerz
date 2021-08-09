/**
 * 
 */
 var init_post = 10; 
 var count;
 var end_check = true;
 function editSubmit(post_no){
	  	var content = document.getElementById("editable").innerHTML;
		var community_id = document.getElementById("community-input").value;
		console.log(community_id);
		var categoryinput = document.getElementById("category-input-val");
		console.log(categoryinput);
		var category_no = categoryinput.value;
		console.log(category_no);
		var post_title = document.getElementById("post_title").value;
		var textFile = null,
		makeTextFile = function (content) {
		    var data = new File([content], "1.txt",{type: "text/plain", lastModified: Date.now()});
		return data;
	  };
	      edits(makeTextFile(content), community_id, category_no, post_title, post_no);
	 }
	 function edits(file, community_id, category_no, post_title, post_no){
	 var data = new FormData();
			data.append("file", file);
			data.append("community_id", community_id);
			data.append("category_no", category_no);
			data.append("post_title", post_title);
			data.append("post_no", post_no);
			console.log(data);
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "editPost", false);
			xhr.send(data);
			var page = document.querySelector('.modal-section');
			page.innerHTML = xhr.responseText;
	 }
 function editPost(post_no){
 	console.log("글수정");
 	var modalBody = document.querySelector(".modal-body");
 	var postTitle = document.querySelector(".modal-postTitle");
 	modalBody.innerHTML = '';
 	includeHTML(modalBody, '/include/editPost?post_no=' + post_no);
 }
 function deletePost(post_no){
 	var xhr = new XMLHttpRequest();
 	var data = new FormData();
 	data.append("post_no", post_no);
 	xhr.open("POST", "/deletePost");
 	xhr.send(data);
 	  document.body.style.removeProperty("overflow");
 	closeModal();
 	init_posts();
 }  
window.addEventListener('scroll', () => {  
  if (document.documentElement.offsetHeight + document.documentElement.scrollTop >= document.documentElement.scrollHeight) {  
    console.log('scrolled to bottom');
    if(end_check==true){
    	appendPosts();
    }  
  }  
});
window.addEventListener('load',function (){
	init_posts();
}, false);
function init_posts(){
	console.log("init");
	init_post = 10; 
	var communityPost_container = document.getElementById("communityPost_container");
	if(communityPost_container.hasChildNodes()){
		communityPost_container.innerHTML = '';
	}
 	appendPosts();
}
function countReturn(callback){
	var xhr = new XMLHttpRequest();
 	xhr.open("POST", "/count");
 	 xhr.onreadystatechange = function(){
 	 	callback(xhr.responseText);
 	 };
 	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
 	xhr.send();
 	return xhr.responseText;
}

countReturn(function(data){
	count = data;
});
function getPosts() {
	var init_post = 10;
	var page = 3;
	/*var community_id = community_id;*/
	for(var i = init_post-9; i < init_post+1; i++){
		var newDiv = document.createElement("div");
		var communityPost_container = document.getElementById("communityPost_container");
		includeHTML(newDiv, '/include/commPost?init_post=' + i + "&community_id=" + community_id);
		communityPost_container.appendChild(newDiv);
		console.log(newDiv);
		}
		init_post+=10;
}
function appendPosts(){
	console.log("게시글 불러오기");
 	console.log("count = " + count);
 	/*var community_id = community_id;*/
 	var page = count/init_post;
 	var left = count%10;
 	console.log(page);
 	console.log(init_post);
 	if(page > 1){
 		console.log("1");
		for(var i = init_post-9; i < init_post+1; i++){
		var newDiv = document.createElement("div");
		var communityPost_container = document.getElementById("communityPost_container");
		includeHTML(newDiv, '/include/commPost?init_post=' + i + "&community_id=" + community_id);
		communityPost_container.appendChild(newDiv);
		console.log(newDiv);
		}
		init_post+=10;
	}
	else if(page <= 1){
	    console.log("2");
		for(var i = init_post-9; i <= count; i++){
		var newDiv = document.createElement("div");
		var communityPost_container = document.getElementById("communityPost_container");
		includeHTML(newDiv, '/include/commPost?init_post=' + i + "&community_id=" + community_id);
		communityPost_container.appendChild(newDiv);
		console.log(newDiv);
		end_check=false;	
		}
		return;
	}
}
function appendCommentInput(comment_no, comment_retag, post_no){
	var replySection = document.getElementById("reply-section-"+comment_no);
	if(replySection.hasChildNodes()){
		replySection.innerHTML = null;
		console.log("댓글인풋삭제");
	}else{
		includeHTML(replySection, '/include/reply_input?comment_retag=' + comment_retag + "&post_no=" + post_no);
		console.log("댓글인풋열기");
	}
}
function addComment(post_no,comment_retag){
	console.log("댓글쓰기");
	console.log(post_no);
	var commentContent;
	var data = new FormData();
	if(comment_retag != null){
		console.log("널아님");
		commentContent = document.getElementById("comment_content_" + comment_retag).value;
		data.append("comment_retag", comment_retag);
	}else{
		console.log("널임");
		commentContent = document.getElementById("comment_content_").value;
	}
	console.log(comment_retag);
	console.log(commentContent);
	data.append("commentContent", commentContent);
	data.append("post_no", post_no);
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "comment/addComment");
	xhr.send(data);
	commentReload(post_no);
}
function commentReload(post_no){
	var replyPanel = document.querySelector(".reply-panel");
replyPanel.innerHTML = "";
includeHTML(replyPanel, '/comment/commReload?post_no=' + post_no);
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
            if (this.status == 404) { return;; }
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
	  document.body.style.removeProperty("overflow");
  var modal = document.getElementById("myModal");
  modal.remove();
}
window.onclick = function(event) {
	var modal = document.getElementById("myModal");
	  if (event.target == modal) {
	    modal.remove();
	    document.body.style.removeProperty("overflow");
	  }
}
	
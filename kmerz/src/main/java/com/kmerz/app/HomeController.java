package com.kmerz.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommentService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.DeclaredService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.util.AttachmentProcessing;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.DeclaredVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;



@Controller
@RequestMapping(value = "/")
public class HomeController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	PostService postService;
	
	@Inject
	MemberService memService;
	
	@Inject
	CategoryService cateService;
	
	@Inject
	CommentService commentService;
	
	@Inject
	DeclaredService declaredService;
	
	@RequestMapping
	public String home(Model model, HttpSession session) {
		List<CommunityVo> commList = commService.getCommunityList();
		List<PostsVo> postList = postService.selectAllowPosts();
		//System.out.println("홈: "+postList);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int userPostCount = 0;
		int userCommentCount = 0;
		int user_point = 0;
		// 로그인이 되어 있을때
		if(memberVo != null) {
			// 유저의 게시글 갯수 구하기
			int user_no = memberVo.getUser_no();
			userPostCount = postService.getUserPostCount(user_no);
			//유저의 댓글 갯수 구하기
			userCommentCount = commentService.getUserCommentCount(user_no);
			// 유저 포인트 
			user_point = memberVo.getUser_point();
		}
		
		System.out.println("메인페이지 시작");
		model.addAttribute("commList", commList);
		model.addAttribute("postList", postList);
		model.addAttribute("userPostCount", userPostCount);
		model.addAttribute("userCommentCount", userCommentCount);
		model.addAttribute("user_point", user_point);
		return "MainPage";
	}
	@RequestMapping(value="/count")
	public void count(HttpServletResponse res) throws Exception {
		int post_count = postService.countPosts();
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println("카운트 "+post_count);
		out.print("" + post_count);
		out.close();
	}
	@RequestMapping(value="posting")
	public String posting(Model model, HttpSession session) {
		List<CommunityVo> commList = commService.getCommunityList();
		model.addAttribute("commList", commList);
		return "PostingPage";
	}
	
	@ResponseBody
	@RequestMapping(value="postDeclaring")
	public String postDeclaring(DeclaredVo declaredVo) {
		declaredService.addPostDeclared(declaredVo);
		return "success";
	@RequestMapping(value="/deletePost", method=RequestMethod.POST)
	public String deletePost(@RequestParam int post_no) {
		postService.updateStatus(post_no, -1);
		System.out.println("delete");
		return "redirect:/";
	}
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
	public String uploadFile(@RequestParam MultipartFile[] files,Model model) {
		int seqPostNo = postService.selectCurrentSeq() + 1;
		model.addAttribute("index", files.length);
		for(int i = 0; i < files.length; i++) {
			System.out.println(files[i].getOriginalFilename());
			String path = AttachmentProcessing.MediaFileNameProcessing(seqPostNo);
			AttachmentProcessing.EncodingWebm(files[i],path);
			model.addAttribute("path_" + i,path);
		}
		return "include/video";
	}
	@RequestMapping(value="/editPost", method=RequestMethod.POST)
	public String editPost(@RequestParam int post_no, @RequestParam String community_id,
									@RequestParam int category_no, @RequestParam String post_title,
									@RequestParam String post_content_file) {
		PostsVo postVo = new PostsVo();
		postVo.setPost_no(post_no);
		postVo.setCategory_no(category_no);
		postVo.setCommunity_id(community_id);
		postVo.setPost_title(post_title);
		postVo.setPost_content_file(post_content_file);
		postService.updatePost(postVo);
		return "";
	}
}

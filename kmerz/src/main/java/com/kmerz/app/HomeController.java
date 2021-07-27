package com.kmerz.app;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommentService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.CommunityVo;
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
	
	@RequestMapping
	public String home(Model model, HttpSession session) {
		List<CommunityVo> commList = commService.getCommunityList();
		List<PostsVo> postList = postService.selectAllPosts();
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int userPostCount = 0;
		int userCommentCount = 0;
		// 로그인이 되어 있을때
		if(memberVo != null) {
			// 유저의 게시글 갯수 구하기
			int user_no = memberVo.getUser_no();
			userPostCount = postService.getUserPostCount(user_no);
			
			//유저의 댓글 갯수 구하기
			userCommentCount = commentService.getUserCommentCount(user_no);
		}
		
		model.addAttribute("commList", commList);
		model.addAttribute("postList", postList);
		model.addAttribute("userPostCount", userPostCount);
		model.addAttribute("userCommentCount", userCommentCount);
		return "MainPage";
	}
	@RequestMapping(value="posting")
	public String posting(Model model, HttpSession session) {
		List<CommunityVo> commList = commService.getCommunityList();
		model.addAttribute("commList", commList);
		return "PostingPage";
	}
}

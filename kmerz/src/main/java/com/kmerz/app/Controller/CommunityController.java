package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommentService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/c")
public class CommunityController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	CategoryService categoryService;
	
	@Inject
	PostService postService;
	
	@Inject
	CommentService commentService;
	
	// 커뮤니티 생성 신청 화면
	@RequestMapping(value = "/createForm", method = RequestMethod.GET)
	public String createCommunityForm() {
		return "community/createCommunityForm";
	}
	
	// 커뮤니티 생성
	@RequestMapping(value = "/createRun", method=RequestMethod.POST)
	public String createCommunityRun(CommunityVo communityVo) {
		commService.createCommunity(communityVo);
		return "redirect:/";
	}
	
	// 커뮤니티 페이지 이동
	@RequestMapping(value="/{community_id}", method=RequestMethod.GET)
	public String testCommunityForm(@PathVariable("community_id") String community_id, String community_name,
			Model model, HttpSession session) {
		/*System.out.println("community_id: " + community_id);*/
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id);
		List<PostsVo> postList = postService.getCommunityPostList(community_id);
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
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("postList", postList);
		model.addAttribute("userPostCount", userPostCount);
		model.addAttribute("userCommentCount", userCommentCount);
		model.addAttribute("community_id", community_id);
		return "community/CommunityPage";
	}
	/*@RequestMapping(value="posting")
	public String posting(Model model, HttpSession session, String community_id) {
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id);
		model.addAttribute("categoryList", categoryList);
		return "PostingPage";
	}*/
}

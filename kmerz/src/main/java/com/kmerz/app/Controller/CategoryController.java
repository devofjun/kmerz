package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommentService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/c")
public class CategoryController {
	
	@Inject
	CategoryService categoryService;
	
	@Inject
	PostService postService;
	
	@Inject
	CommentService commentService;
	
	// 카테고리 생성 페이지로 이동
	@RequestMapping(value="/{community_id}/createCategoryForm", method = RequestMethod.GET)
	public String createCategoryForm(@PathVariable("community_id") String community_id,
			Model model) {
		model.addAttribute("community_id", community_id);
		return "category/createCategoryForm";
	}
	
	// 카테고리 생성
	@RequestMapping(value = "/createCategoryRun", method=RequestMethod.POST)
	public String createCategoryRun(CategoryVo categoryVo) {
		System.out.println("categoryVo: " + categoryVo);
		categoryService.createCategory(categoryVo);
		String community_id = categoryVo.getCommunity_id();
		String page = "redirect:/c/" + community_id;
		// categoryVo 에서 커뮤니티아이디 가져와서 리다이렉트하기
		return page;
	}
	
	// 카테고리 페이지 이동
	@RequestMapping(value = "/{community_id}/{category_no}", method=RequestMethod.GET)
	public String categoryPage(@PathVariable("community_id") String community_id,
			@PathVariable("category_no") int category_no, String community_name,
			Model model, HttpSession session) {
		/*System.out.println("community_id: " + community_id);
		System.out.println("category_no: " + category_no);*/
		String category_status = null; // 서비스 임플에서 넣어주는 값
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id);
		model.addAttribute("categoryList", categoryList);
		// System.out.println("categoryList: " + categoryList);
		
		// 카테고리 이동시 고것에 맞는 포스트만 리스트 가져오기
		List<PostsVo> postList = postService.getCategoryPostList(community_id, category_no);
		// System.out.println("postList: " + postList);
		model.addAttribute("postList", postList);
		
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
		model.addAttribute("userPostCount", userPostCount);
		model.addAttribute("userCommentCount", userCommentCount);
		model.addAttribute("user_point", user_point);
		return "category/CategoryPage";
	}
}

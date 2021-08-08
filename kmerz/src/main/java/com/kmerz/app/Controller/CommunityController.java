package com.kmerz.app.Controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kmerz.app.dto.CommunityPagingDto;
import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommentService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.DeclaredService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.util.AttachmentProcessing;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.DeclaredVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/c")
public class CommunityController {
	
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
	
	// 커뮤니티 생성 신청 화면
	@RequestMapping(value = "/createForm", method = RequestMethod.GET)
	public String createCommunityForm() {
		return "community/createCommunityForm";
	}
	
	// 커뮤니티 생성
	@RequestMapping(value = "/createRun", method=RequestMethod.POST)
	public String createCommunityRun(CommunityVo communityVo, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int user_no = memberVo.getUser_no();
		communityVo.setUser_no(user_no);
		commService.createCommunity(communityVo);
		return "redirect:/";
	}
	
	// 커뮤니티 목록 페이지 이동
	@RequestMapping(value = "/communityList", method = RequestMethod.GET)
	public String communityList(Model model, CommunityPagingDto communitypagingDto) throws Exception {
		int count = commService.getCommunityCount(communitypagingDto);
		communitypagingDto.setCount(count);
		System.out.println("communitypagingDto: " + communitypagingDto);
		List<CommunityVo> list = commService.getSearchCommunityList(communitypagingDto);
		model.addAttribute("CommunityList", list);
		model.addAttribute("pagingDto", communitypagingDto);
		return "community/CommunityListPage";
	}
	
	// 커뮤니티 페이지 이동
	@RequestMapping(value="/{community_id}", method=RequestMethod.GET)
	public String testCommunityForm(@PathVariable("community_id") String community_id, String community_name,
			Model model, HttpSession session) {
		/*System.out.println("community_id: " + community_id);*/
		List<CategoryVo> categoryList = cateService.getCategoryList(community_id);
		List<PostsVo> postList = postService.getCommunityPostList(community_id);
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
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("postList", postList);
		model.addAttribute("userPostCount", userPostCount);
		model.addAttribute("userCommentCount", userCommentCount);
		model.addAttribute("community_id", community_id);
		model.addAttribute("user_point", user_point);
		return "community/CommunityPage";
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
	
	// 게시글 신고하기
	@ResponseBody
	@RequestMapping(value="postDeclaring")
	public String postDeclaring(DeclaredVo declaredVo) {
		System.out.println("게시글 신고하기: "+declaredVo);
		declaredService.addPostDeclared(declaredVo);
		return "success";
	}
	
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
		Map<Integer, String> mType = new HashMap<Integer, String>();
		for(int i = 0; i < files.length; i++) {
			System.out.println(files[i].getOriginalFilename());
			String type = files[i].getContentType();
			System.out.println(type);
			String filetype = type.substring(0, type.indexOf("/"));
			String file_ext = type.substring(type.indexOf("/"), type.length());
			if(file_ext.equals("/gif")) {
				filetype = "video";
			}
			System.out.println(file_ext);
			mType.put(i, filetype);
			String path = AttachmentProcessing.MediaFileNameProcessing(seqPostNo);
			if(filetype.equals("video")) {
				AttachmentProcessing.TranscodingMP4(files[i],path);			
				model.addAttribute("path_" + i,path);
			}
			if(filetype.equals("image")) {
				AttachmentProcessing.TranscodingJpg(files[i],path);
				model.addAttribute("path_" + i,path);
			}
		}
		model.addAttribute("mediaType",mType);
		return "include/media";
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


	@RequestMapping(value="/loadBanner")
	public String loadBanner(Model model) {
		
		return "";
	}
}

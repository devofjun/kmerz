package com.kmerz.app.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.dto.PostPagingDto;
import com.kmerz.app.service.AdminService;
import com.kmerz.app.service.BannerService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.service.SteamAppService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.vo.AdminVo;
import com.kmerz.app.vo.BannerVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;
import com.kmerz.app.vo.SteamAppVo;

@Controller
@RequestMapping(value = "/admin")
public class ManagementController {

	@Inject
	AdminService adminService;
	@Inject
	BannerService bannerService;
	@Inject
	SteamAppService steamAppService;
	@Inject
	PostService postService;
	@Inject
	MemberService memberService;

	// uri 간편화 admin 입력하면 로그인 페이지나 대시보드 페이지로 넘어감
	@RequestMapping
	public String admin(HttpSession session) throws Exception {
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
		if (loginAdminVo == null) {
			return "management/AdminLoginPage";
		} else {
			return "management/DashBoardPage";
		}
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String adminLoginForm(HttpSession session) throws Exception {
		if (session.getAttribute("loginAdminVo") != null) {
			return "redirect:/admin/dashBoard";
		}
		return "management/AdminLoginPage";
	}

	// 로그인 실행
	@ResponseBody
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public void adminLoginRun(String admin_id, String admin_pw, HttpSession session) throws Exception {
		// System.out.println("관리자 컨트롤러 로그인런"+admin_id+ admin_pw);
		AdminVo loginAdminVo = adminService.loginAdmin(admin_id, admin_pw);
		String result = "fail";
		if (loginAdminVo != null) {
			session.setAttribute("loginAdminVo", loginAdminVo);
			System.out.println("로그인 세션발행:" + (AdminVo) session.getAttribute("loginAdminVo"));
			result = "success";
		}
		session.setAttribute("resultLogin", result);
	}

	// 로그아웃 실행
	@RequestMapping(value = "/logoutRun", method = RequestMethod.GET)
	public String adminLogoutRun(HttpSession session) throws Exception {
		session.removeAttribute("loginAdminVo");
		return "redirect:/admin/loginForm";
	}

	// 대시보드 페이지
	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String dashBoard(HttpSession session) throws Exception {
		// 로그인 시도 세션 삭제
		session.removeAttribute("resultLogin");

		return "management/DashBoardPage";
	}

	// 고객 관리 페이지
	@RequestMapping(value = "/customers")
	public String customers(Model model) throws Exception {
		List<MemberVo> memberList = memberService.getAllMembers();
		model.addAttribute("memberList", memberList);
		return "management/CustomersPage";
	}
	
	// 사용자 차단
	@ResponseBody
	@RequestMapping(value="/customers/deny", method=RequestMethod.PATCH)
	public String customerDeny(int user_no) throws Exception {
		memberService.setStatusDeny(user_no);
		return "success";
	}
	
	// 사용자 승인
	@ResponseBody
	@RequestMapping(value="/customers/allow", method=RequestMethod.PATCH)
	public String customerAllow(int user_no) throws Exception {
		memberService.setStatusAllow(user_no);
		return "success";
	}
	
	// 사용자 글쓰기 차단
	@ResponseBody
	@RequestMapping(value="/customers/writeLock", method=RequestMethod.PATCH)
	public String customersWriteLock(int user_no) throws Exception {
		memberService.setStatusWriteLock(user_no);
		return "success";
	}
	
	
	
	
	
	// 배너/사이드바 관리 페이지
	@RequestMapping(value = "/contents/bsSettingPage", method = RequestMethod.GET)
	public String bsSetting(Model model) throws Exception {
		List<SteamAppVo> bannerList = bannerService.getBannerList();
		
		model.addAttribute("bannerAppList", bannerList);
		
		return "management/ContentsBSPage";
	}
	// 배너 적용하기
	@ResponseBody
	@RequestMapping(value = "/contents/setBanner",  method = RequestMethod.POST)
	public String setBanner(@RequestBody List<BannerVo> bannerList) throws Exception {
		//System.out.println("setBanner :" + bannerList);
		bannerService.initBanner(bannerList);
		return "success";
	}
	
	// 게시물 관리 페이지
	@RequestMapping(value = "/contents/postSettingPage", method = RequestMethod.GET)
	public String postSetting(PostPagingDto postPagingDto, Model model) throws Exception {
		// 페이지
		int count = postService.getCountPosts(postPagingDto);
		postPagingDto.setCount(count);
		List<PostsVo> postsVo = postService.selectAllPosts(postPagingDto);
		model.addAttribute("postList", postsVo);
		return "management/ContentsPostPage";
	}
	
	// 게시물 페이징, 검색
	@ResponseBody
	@RequestMapping(value = "/contents/postPaging", method = RequestMethod.GET)
	public Map<String, Object> postPaging(PostPagingDto postPagingDto, Model model) throws Exception {
		int count = postService.getCountPosts(postPagingDto);
		postPagingDto.setCount(count);
		//System.out.println("IN: " + postPagingDto);
		List<PostsVo> postList = postService.selectAllPosts(postPagingDto);
		
		model.addAttribute("postPagingDto", postPagingDto);
		//System.out.println("OUT: " + postPagingDto);
		Map<String, Object> map = new HashMap<>();
		map.put("postList", postList);
		map.put("postPagingDto", postPagingDto);
		return map;
	}
	
	// 게시물 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/contents/getPostInfo", method = RequestMethod.GET)
	public PostsVo getPostInfo(int post_no) throws Exception {
		return postService.selectPost(post_no);
	}
	
	// 게시물 내용 가져오기
	@ResponseBody
	@RequestMapping(value = "/contents/getPostContent", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String getPostContent(String post_content_file) throws Exception {
		//System.out.println("게시물 내용 가져오기: "+post_content_file);
		String result = ContentReadAndWrite.ReadContent(post_content_file);
		//System.out.println(result);
		return result;
	}
	
	// 게시물 잠금
	@ResponseBody
	@RequestMapping(value = "/contents/setPostDeny", method=RequestMethod.GET)
	public String setPostDeny(int post_no) throws Exception {
		postService.lockPost(post_no);
		return "success";
	}
	
	// 게시물 잠금 해제
	@ResponseBody
	@RequestMapping(value = "/contents/setPostAdmit", method=RequestMethod.GET)
	public String setPostAdmit(int post_no) throws Exception {
		postService.unlockPost(post_no);
		return "success";
	}
	
	
	// 고객 주문 관리 페이지
	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String oders() throws Exception {
		return "management/OrdersPage";
	}

	// 상품 관리 페이지
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String products() throws Exception {
		return "management/ProductsPage";
	}
	
	// 리포트 페이지
	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String reports() throws Exception {
		return "management/ReportsPage";
	}
}

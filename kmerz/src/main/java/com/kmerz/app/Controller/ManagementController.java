package com.kmerz.app.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.dto.MemberInfoCardDto;
import com.kmerz.app.dto.MemberPagingDto;
import com.kmerz.app.dto.PostPagingDto;
import com.kmerz.app.service.AdminService;
import com.kmerz.app.service.BannerService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.DeclaredService;
import com.kmerz.app.service.MemberLogService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PointLogService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.service.SteamAppService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.vo.AdminVo;
import com.kmerz.app.vo.BannerVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.DeclaredVo;
import com.kmerz.app.vo.MemberLogVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PointLogVo;
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
	@Inject
	PointLogService pointLogService;
	@Inject
	DeclaredService declaredService;
	@Inject
	CommunityService communityService;
	@Inject
	MemberLogService memberLogService;
	
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

	// 대시보드 데이터 요청
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/dashBoardData", method = RequestMethod.GET)
	public Map<String, Object> dashBoardCard() throws Exception {
		// 오늘 로그인
		List<MemberLogVo> loginList = memberLogService.dailyLoginList();
		// 오늘 만들어진 게시글
		List<PostsVo> postList = postService.selectDailyPost();
		// 오늘 만들어진 커뮤니티
		List<CommunityVo> commList = communityService.selectDailyComm();
		// 오늘 회원가입
		List<MemberLogVo> signupList = memberLogService.dailySignUpList();
		Map<String, Object> map = new HashMap<>();
		map.put("loginList", loginList);
		map.put("postList", postList);
		map.put("commList", commList);
		map.put("signupList", signupList);
		return map;
	}
	
	
	
	
	// 고객 관리 페이지
	@RequestMapping(value = "/customers")
	public String customers(MemberPagingDto memberPagingDto, Model model) throws Exception {
		// 페이지
		memberPagingDto.setCount(memberService.getAllCount(memberPagingDto));
		// 회원 리스트
		List<MemberVo> memberList = memberService.getAllMembers(memberPagingDto);
		model.addAttribute("memberList", memberList);
		System.out.println(memberList);
		return "management/CustomersPage";
	}
	
	// 유저 페이징, 검색
	@ResponseBody
	@RequestMapping(value="/customers/list", method=RequestMethod.GET)
	public Map<String, Object> customerPaging(MemberPagingDto memberPagingDto, Model model) throws Exception{
		int count = memberService.getAllCount(memberPagingDto);
		memberPagingDto.setCount(count);
		List<MemberVo> memberList = memberService.getAllMembers(memberPagingDto);
		
		model.addAttribute("memberPagingDto", memberPagingDto);
		Map<String, Object> map = new HashMap<>();
		map.put("memberList", memberList);
		map.put("memberPagingDto", memberPagingDto);
		return map;
	}
	
	// 유저 정보
	@Transactional
	@ResponseBody
	@RequestMapping(value="/customers/userInfo", method=RequestMethod.GET)
	public Map<String, Object> getCustomerInfo(int user_no) throws Exception{
		Map<String, Object> map = new HashMap<>();
		// 카드 정보
		MemberVo memberVo = memberService.selectNO(user_no);
		MemberInfoCardDto cardDto = new MemberInfoCardDto();
		if(memberVo != null) {
			String profileImgPath = memberVo.getUser_profileImage(); 
			if(profileImgPath != null) {
				int index = profileImgPath.indexOf("/sm_");
				if(index > -1) {
					String a = profileImgPath.substring(0, index+1);
					String b = profileImgPath.substring(index+4);
					cardDto.setUser_profileimage(a+b);
				} else {
					cardDto.setUser_profileimage(profileImgPath);					
				}
			}
			cardDto.setUser_no(memberVo.getUser_no());
			cardDto.setUser_name(memberVo.getUser_name());
			cardDto.setUser_id(memberVo.getUser_id());
			cardDto.setUser_point(memberVo.getUser_point());
			cardDto.setUser_status(memberVo.getStr_user_status());
			cardDto.setUser_post_count(postService.getUserPostCount(memberVo.getUser_no()));
		}
		map.put("cardDto", cardDto);
		
		// 현재 포인트 모달 정보
		List<PointLogVo> pointList = pointLogService.getPointLogList(user_no);
		map.put("pointList", pointList);
		// 유저 게시글 모달 정보
		List<PostsVo> postList = postService.getUserPostList(user_no);
		map.put("postList", postList);
		// 유저생성 커뮤니티 모달 정보
		List<CommunityVo> communityList = communityService.getUserCommunityList(user_no);
		map.put("communityList", communityList);
		// 신고 리스트 모달 정보
		List<DeclaredVo> declaredList = declaredService.getTargetUserNOList(user_no);
		map.put("declaredList", declaredList);
		
		return map;
	}
	
	
	// 사용자 상태 변경
	@ResponseBody
	@RequestMapping(value="/customers/userStatus", method=RequestMethod.POST)
	public String userStatus(String str_user_no, String str_user_status) throws Exception {
		System.out.println(str_user_no + " " + str_user_status);
		int user_no = Integer.parseInt(str_user_no);
		int user_status = Integer.parseInt(str_user_status);
		System.out.println(user_no + " " + user_status);
		switch(user_status) {
		case -2:
			memberService.setStatusDeny(user_no);
			break;
		case 0:
			memberService.setStatusAllow(user_no);
			break;
		case 1:
			memberService.setStatusWriteLock(user_no);
			break;
		}
		
		return "success";
	}
	
	// 메일 보내기
	
	
	// 사용자 포인트 변경
	@ResponseBody
	@RequestMapping(value="/customers/userPoint", method=RequestMethod.POST)
	public String userPoint(@RequestBody PointLogVo pointLogVo) throws Exception {
		pointLogService.addPointLog(pointLogVo);
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
		bannerService.initBanner(bannerList);
		return "success";
	}
	
	// 게시물 관리 페이지
	@RequestMapping(value = "/contents/postSettingPage", method = RequestMethod.GET)
	public String postSetting(PostPagingDto postPagingDto, Model model) throws Exception {
		// 페이지
		int count = postService.getCountAllPosts(postPagingDto);
		postPagingDto.setCount(count);
		List<PostsVo> postsVo = postService.selectAllPosts(postPagingDto);
		model.addAttribute("postList", postsVo);
		return "management/ContentsPostPage";
	}
	
	// 게시물 페이징, 검색
	@ResponseBody
	@RequestMapping(value = "/contents/postPaging", method = RequestMethod.GET)
	public Map<String, Object> postPaging(PostPagingDto postPagingDto) throws Exception {
		int count = postService.getCountAllPosts(postPagingDto);
		postPagingDto.setCount(count);
		//System.out.println("IN: " + postPagingDto);
		List<PostsVo> postList = postService.selectAllPosts(postPagingDto);
		
		//model.addAttribute("postPagingDto", postPagingDto);
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
	@RequestMapping(value = "/contents/setPostLock", method=RequestMethod.GET)
	public String setPostLock(int post_no) throws Exception {
		postService.lockPost(post_no);
		return "success";
	}
	
	// 게시물 잠금 해제
	@ResponseBody
	@RequestMapping(value = "/contents/setPostUnlock", method=RequestMethod.GET)
	public String setPostUnlock(int post_no) throws Exception {
		postService.unlockPost(post_no);
		return "success";
	}
	
	// 게시물 여러개 잠금
	@ResponseBody
	@RequestMapping(value = "/contents/setPostsLock", method=RequestMethod.POST)
	public List<PostsVo> setPostsLock(@RequestBody List<String> post_no) throws Exception {
		List<Integer> postnoList = new ArrayList<>();
		for(int i=0; i<post_no.size(); i++) {
			postnoList.add(Integer.parseInt(post_no.get(i)));
		}
		System.out.println(postnoList);
		List<PostsVo> list = postService.lockPostList(postnoList);
		return list;
	}
	
	// 게시물 여러개 잠금 풀기
	@ResponseBody
	@RequestMapping(value = "/contents/setPostsUnlock")
	public List<PostsVo> setPostsUnlock(@RequestBody List<String> post_no) throws Exception {
		List<Integer> postnoList = new ArrayList<>();
		for(int i=0; i<post_no.size(); i++) {
			postnoList.add(Integer.parseInt(post_no.get(i)));
		}
		System.out.println(postnoList);
		List<PostsVo> list = postService.unlockPostList(postnoList);
		return list;
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

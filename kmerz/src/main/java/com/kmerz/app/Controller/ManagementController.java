package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.AdminService;
import com.kmerz.app.service.BannerService;
import com.kmerz.app.service.SteamAppService;
import com.kmerz.app.vo.AdminVo;
import com.kmerz.app.vo.BannerVo;
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

	// 고객 주문 페이지
	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	public String customers() throws Exception {
		return "management/CustomersPage";
	}
	
	// 배너/사이드바 관리 페이지
	@RequestMapping(value = "/bsSetting.do", method = RequestMethod.GET)
	public String bsSetting(Model model) throws Exception {
		List<SteamAppVo> bannerList = bannerService.getBannerList();
		
		model.addAttribute("bannerAppList", bannerList);
		
		return "management/ContentsBSPage";
	}
	// 배너 적용하기
	@ResponseBody
	@RequestMapping(value = "/contents/setBanner",  method = RequestMethod.POST)
	public String setBanner(@RequestBody List<BannerVo> bannerList) throws Exception {
		System.out.println("setBanner :" + bannerList);
		bannerService.initBanner(bannerList);
		return "success";
	}
	
	// 게시물 관리 페이지
	@RequestMapping(value = "/postSetting.do", method = RequestMethod.GET)
	public String postSetting() throws Exception {
		
		return "management/ContentsPostPage";
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

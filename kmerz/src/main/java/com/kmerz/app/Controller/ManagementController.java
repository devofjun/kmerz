package com.kmerz.app.Controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmerz.app.service.AdminService;
import com.kmerz.app.vo.AdminVo;

@Controller
@RequestMapping(value="/admin")
public class ManagementController {
	
	@Inject
	AdminService adminService;
	
	// uri 간편화
	@RequestMapping
	public String admin(HttpSession session) throws Exception{
		AdminVo loginAdminVo = (AdminVo)session.getAttribute("loginAdminVo");
		if(loginAdminVo == null) {
			return "management/AdminLoginPage";			
		} else {
			return "management/AdminDashBoard";
		}
	}
	
	// 로그인 페이지
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String adminLoginForm() throws Exception{
		return "management/AdminLoginPage";
	}
	
	// 로그인 실행
	@ResponseBody
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public void adminLoginRun(String admin_id, String admin_pw, HttpSession session) throws Exception{
		System.out.println("관리자 컨트롤러 로그인런"+admin_id+ admin_pw);
		AdminVo loginAdminVo = adminService.loginAdmin(admin_id, admin_pw);
		String result = "fail";
		if(loginAdminVo != null) {
			session.setAttribute("loginAdminVo", loginAdminVo);
			System.out.println("세션발행"+(AdminVo)session.getAttribute("loginAdminVo"));
			result = "success";
		}
		session.setAttribute("resultLogin", result);
	}
	
	// 로그아웃 실행
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String adminLogoutRun(HttpSession session) throws Exception{
		session.removeAttribute("loginAdminVo");
		return "redirect:/admin/loginForm";
	}
	
	// 대시보드
	@RequestMapping(value="/dashBoard", method=RequestMethod.GET)
	public String adminDashBoard() throws Exception{
		return "management/AdminDashBoard";
	}
}

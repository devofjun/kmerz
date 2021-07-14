package com.kmerz.app.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/mng")
public class ManagementController {
	
	
	@RequestMapping(value="/login")
	public String adminLoginForm() {
		return "management/AdminLoginPage";
	}
	
	@RequestMapping(value="/loginRun")
	public String adminLoginRun() {
		String page = null;
		return page;
	}
	
	@RequestMapping(value="/dashBoard")
	public String adminDashBoard() {
		return "management/AdminDashBoard";
	}
}

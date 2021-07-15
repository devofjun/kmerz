package com.kmerz.app.testController;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.CommunityService;

@Controller
public class TestController {
	
	@Inject
	CommunityService commService;
	
	@RequestMapping(value="/c")
	public String headerTest() {
		return "community/CommunityPage";
	}
	
	@RequestMapping(value="/f")
	public String findPassword() {
		return "member/findPasswordForm";
	}
}

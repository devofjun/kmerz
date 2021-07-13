package com.kmerz.app.testController;

import javax.inject.Inject;

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
		return "community/createCommunityForm";
	}
	
	@RequestMapping(value="/f")
	public String findPassword() {
		return "member/findPasswordForm";
	}

}

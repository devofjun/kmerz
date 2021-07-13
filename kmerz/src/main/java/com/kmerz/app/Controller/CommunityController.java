package com.kmerz.app.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/c")
public class CommunityController {

	// 커뮤니티 생성 신청 화면 요청
	@RequestMapping(value = "/createCommunityForm", method = RequestMethod.GET)
	public String createCommunityForm() {
		return "community/createCommunityForm";
	}
}

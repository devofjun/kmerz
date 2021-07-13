package com.kmerz.app.Controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmerz.app.service.CommunityService;
import com.kmerz.app.vo.CommunityVo;

@Controller
@RequestMapping(value = "/c")
public class CommunityController {
	
	@Inject
	CommunityService commService;
	
	// 커뮤니티 생성 신청 화면
	@RequestMapping(value = "/createForm", method = RequestMethod.GET)
	public String createCommunityForm() {
		return "community/createCommunityForm";
	}
	
	// 커뮤니티 생성
	@RequestMapping(value = "/createRun", method=RequestMethod.POST)
	public String createCommunityRun(CommunityVo communityVo) {
		commService.createCommunity(communityVo);
		return "redirect:/";
	}
}

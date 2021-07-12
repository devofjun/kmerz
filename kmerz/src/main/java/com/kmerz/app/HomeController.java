package com.kmerz.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		

		return "MainPage";
	}
	
	// 로그인 화면 요청
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	// 회원가입 화면 요청
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	// 커뮤니티 생성 신청 화면 요청
	@RequestMapping(value="/createCommunityForm", method=RequestMethod.GET)
	public String createCommunityForm() {
		return "community/createCommunityForm";
	}
}

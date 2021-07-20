package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmerz.app.service.MemberService;
import com.kmerz.app.vo.MemberVo;

@Controller
@RequestMapping(value = "/m")
public class MemberController {
	@Inject
	private MemberService memberService;

	// 로그인 화면
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 로그인
	@RequestMapping(value="/loginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, RedirectAttributes rttr,
			HttpSession session) {
		MemberVo memberVo = memberService.login(user_id, user_pw);
		String resultLogin = null;
		String page = null;
		// 로그인 성공
		if(memberVo != null) {
			resultLogin = "success";
			page = "redirect:/";
			session.setAttribute("loginVo", memberVo);
			String requestPath = 
	 				(String)session.getAttribute("requestPath");
	 		session.removeAttribute("requestPath");
	 		if (requestPath.equals("/c/createForm")) {
	 			page = "community/createCommunityForm";
	 		}
	 	// 로그인 실패
		} else {
			resultLogin = "fail";
			page = "redirect:/m/loginForm";
		}
		rttr.addFlashAttribute("resultLogin", resultLogin);
		return page;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logoutRun", method = RequestMethod.GET)
	public String adminLogoutRun(HttpSession session) throws Exception {
		session.removeAttribute("loginVo");
		return "redirect:/";
	}

	// 회원가입 화면
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}
	
	// 회원가입
	@RequestMapping(value = "/joinRun", method = RequestMethod.POST)
	public String joinMember(MemberVo memberVo, RedirectAttributes rttr) {
		memberService.joinMember(memberVo);
		System.out.println("회원가입 성공");
		rttr.addFlashAttribute("resultJoin", "success");
		return "redirect:/";
	}

	// 모든 회원 정보
	@ResponseBody
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public List<MemberVo> getAllMember() {
		List<MemberVo> list = memberService.getAllMembers();
		return list;
	}
	
	@RequestMapping(value = "/findPasswordForm", method = RequestMethod.GET)
	public String findPasswordForm() {
		return "member/findPasswordForm";
	}
}

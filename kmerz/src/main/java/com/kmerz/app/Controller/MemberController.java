package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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
	
	// 리퀘스트가 있는 로그인 화면
	@RequestMapping(value="/requestLoginForm", method=RequestMethod.GET)
	public String reqLoginForm() {
		return "member/loginForm";
	}
	
	// 로그인
	@RequestMapping(value="/loginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, RedirectAttributes rttr,
			HttpSession session) {
		MemberVo memberVo = memberService.login(user_id, user_pw);
		String resultLogin = null;
		String page = "member/loginForm";
		// 로그인 성공
		if(memberVo != null) {
			resultLogin = "success";
			page = "redirect:/";
			session.setAttribute("loginVo", memberVo);
			String requestPath = (String)session.getAttribute("requestPath");
	 		session.removeAttribute("requestPath");
	 		if(requestPath != null) {
	 			//System.out.println(requestPath);
		 		if (requestPath.equals("/c/createForm")) {
		 			page = "community/createCommunityForm";
		 		}
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
	
	// 회원정보 보기 페이지
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String getUserInfo(HttpSession session) {
		return "member/userInfo";
	}
	
	// 회원비밀번호 변경 페이지
	@RequestMapping(value = "/userPasswordChangeForm", method = RequestMethod.GET)
	public String userPasswordChangeForm() {
		return "member/userPasswordChangeForm";
	}
	
	// 회원 프로필 사진 변경 페이지
	@RequestMapping(value = "/userProfileImagesChangeForm", method = RequestMethod.GET)
	public String userProfileImagesChangeForm() {
		return "member/userProfileImagesChangeForm";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping(value = "/findPasswordForm", method = RequestMethod.GET)
	public String findPasswordForm() {
		return "member/findPasswordForm";
	}
	
	// 회원 탈퇴 페이지
	@RequestMapping(value = "/userSecessionForm", method = RequestMethod.GET)
	public String userSecessionForm() {
		return "member/userSecessionForm";
	}
	
	// 유저 닉네임 변경 가능 여부 체크(사용가능 여부)
	@RequestMapping(value = "/userNameCheck", method = RequestMethod.GET)
	@ResponseBody
	public String userNameCheck(String user_name) {
		// System.out.println("user_name: " + user_name);
		int count = memberService.getUserNameCheckResult(user_name);
		String userNameCheckResult = "";
		if(count == 0) {
			userNameCheckResult = "Available";
		} else if(count == 1) {
			userNameCheckResult = "unAvailable";
		}
		return userNameCheckResult;
	}
	
	@RequestMapping(value = "/changeUserName", method = RequestMethod.GET)
	public String changeUserName(String user_name, HttpSession session) {
		// System.out.println("user_name :" + user_name);
		MemberVo getMemberVo = (MemberVo)session.getAttribute("loginVo");
		int user_no = getMemberVo.getUser_no();
		String user_id = getMemberVo.getUser_id();
		String user_pw = getMemberVo.getUser_pw();
		memberService.changeUserName(user_no, user_name);
		session.removeAttribute("loginVo");
		MemberVo membervo = memberService.login(user_id, user_pw);
		session.setAttribute("loginVo", membervo);
		return "redirect:/m/userInfo";
	}
}

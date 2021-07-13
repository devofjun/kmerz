package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.MemberService;
import com.kmerz.app.vo.MemberVo;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinMember(MemberVo memberVo) {
		memberService.joinMember(memberVo);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void getAllMember(Model model) {
		List<MemberVo> list = memberService.getAllMembers();
		model.addAttribute("list", list);
	}
}

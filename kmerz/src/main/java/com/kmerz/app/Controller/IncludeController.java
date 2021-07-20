package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kmerz.app.service.CommentService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.CommentVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/include")
public class IncludeController {
	
	@Inject
	MemberService memService;
	
	@Inject
	PostService pService;
	
	@Inject
	CommunityService cService;
	
	@Inject
	CommentService mentService;
	
	@RequestMapping(value="/modal", method = RequestMethod.GET)
	public String openModal(Model model,@RequestParam(value="post_no") int post_no) {
		PostsVo postVo = pService.selectPost(post_no);
		CommunityVo commVo = cService.getOneCommunity(postVo.getCommunity_id());
		List<CommentVo> mentList = mentService.selectCommentOnPost(post_no);
		List<MemberVo> memList = memService.getAllMembers();
		model.addAttribute("postVo", postVo);
		model.addAttribute("commVo", commVo);
		model.addAttribute("mentList", mentList);
		model.addAttribute("memList", memList);
		return "/include/modal";
	}
	@RequestMapping(value="/reply_input", method=RequestMethod.GET)
	public String openReplyInput() {
		return "/include/reply_input";
	}
}

package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kmerz.app.service.CommentService;
import com.kmerz.app.vo.CommentVo;
import com.kmerz.app.vo.MemberVo;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	@Inject
	CommentService commentService;
	@RequestMapping(value="/addComment", method=RequestMethod.POST)
	public String addComment(HttpSession session, 
										@RequestParam String commentContent,
										@RequestParam int post_no,
										@RequestParam(required = false, value = "comment_retag") Integer comment_retag,
										Model model) {
		CommentVo commentVo = new CommentVo();
		MemberVo memVo = (MemberVo) session.getAttribute("loginVo");
		System.out.println(comment_retag + "retag");
		System.out.println("포스트"+post_no);
		commentVo.setUser_no(memVo.getUser_no());
		commentVo.setPost_no(post_no);
		commentVo.setComment_content(commentContent);
		commentVo.setComment_retag(comment_retag);
		System.out.println(commentVo);
		commentService.insertComment(commentVo);
		model.addAttribute("post_no", post_no);
		return null;
	}
	@RequestMapping(value="/commReload", method=RequestMethod.POST)
	public String commReload(@RequestParam int post_no, Model model) {
		System.out.println("로드 포스트"+post_no);
		List<CommentVo> mentList = commentService.selectCommentOnPost(post_no);
		model.addAttribute("mentList", mentList);
		return "/include/reply";
	}
}

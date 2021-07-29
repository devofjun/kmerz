package com.kmerz.app.Controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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
	public void addComment(HttpSession session, 
										@RequestParam String commentContent,
										@RequestParam int post_no,
										@RequestParam int comment_retag) {
		CommentVo commentVo = new CommentVo();
		MemberVo memVo = (MemberVo) session.getAttribute("loginVo");
		commentVo.setUser_no(memVo.getUser_no());
		commentVo.setPost_no(post_no);
		commentVo.setComment_content(commentContent);
		commentVo.setComment_retag(comment_retag);
		commentService.insertComment(commentVo);
	}
}

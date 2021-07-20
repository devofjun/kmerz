package com.kmerz.app.Controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/include")
public class IncludeController {
	
	@Inject
	PostService pService;
	
	@RequestMapping(value="/modal", method = RequestMethod.GET)
	public String createCategoryForm(Model model,@RequestParam(value="post_no") int post_no) {
		PostsVo postVo = pService.selectPost(post_no);
		model.addAttribute("postVo", postVo);
		return "/include/modal";
	}
}

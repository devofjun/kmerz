package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.CategoryVo;

@Controller
@RequestMapping(value="/include")
public class PostController {
	@Inject
	PostService pService;
	@Inject
	CategoryService cateService;
	
	@RequestMapping(value="/posting", method=RequestMethod.POST)
	public String posting() {
		return "";
	}
}

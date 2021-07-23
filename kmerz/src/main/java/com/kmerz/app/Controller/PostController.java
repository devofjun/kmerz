package com.kmerz.app.Controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmerz.app.service.PostService;

@Controller
@RequestMapping(value="/p")
public class PostController {
	@Inject
	PostService pService;
	
	@RequestMapping(value="/posting", method=RequestMethod.POST)
	public String posting() {
		return "";
	}
}

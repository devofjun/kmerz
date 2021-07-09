package com.kmerz.community.testController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping(value="header")
	public String headerTest() {
		return "include/header";
	}
}

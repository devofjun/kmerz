package com.kmerz.app.testController;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.vo.CategoryVo;

@Controller
public class TestController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	CategoryService categoryService;
	
	@ResponseBody
	@RequestMapping(value="/file", produces = "text/html; charset=utf-8")
	public String fileContent(String filepath) {
		String file = null;
		try {
			 file = ContentReadAndWrite.ReadContent(filepath);
			 System.out.println(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		file="한글";
		return file;
	}
	
	// 게시물 내용 가져오기
	@ResponseBody
	@RequestMapping(value = "/g", method = RequestMethod.GET)
	public String getPostContent(String post_content_file) throws Exception {
		return ContentReadAndWrite.ReadContent(post_content_file);
	}
	
}

package com.kmerz.app.testController;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value="/c")
	public String headerTest(Model model, CategoryVo categoryVo) {
		String community_id = "star";
		String category_status = null;
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id, category_status);
		System.out.println("categoryList: " + categoryList);
		model.addAttribute("categoryList", categoryList);
		return "community/CommunityPage";
	}
	
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
}

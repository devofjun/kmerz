package com.kmerz.app.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.util.SteamUtil;

@Controller
@RequestMapping(value="/media")
public class MediaController {
	
	
	// 스팀전체 앱 JSON 파일 다운로드
	@ResponseBody
	@RequestMapping(value="/downloadSteamApps")
	public void downloadSteamApps() {
		SteamUtil.getSteamApps();
	}
	
	// 스팀앱 상세보기 JSON 파일 다운로드
	public String searchSteamApp() {
		
		return null;
	}
	
	// 글 업로드
	
	// 이미지 파일 업로드
	
	// 동영상 파일 업로드
	
	
}

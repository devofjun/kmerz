package com.kmerz.app.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.util.MyFileUploadUtil;
import com.kmerz.app.util.SteamUtil;

@Controller
@RequestMapping(value="/media")
public class MediaController {
	
	
	// 스팀전체 앱 JSON 파일 다운로드
	@ResponseBody
	@RequestMapping(value="/downloadSteamApps")
	public void downloadSteamApps() {
		SteamUtil.getAppdetails();
	}
	
	// 스팀앱 상세보기 JSON 파일 다운로드
	public String searchSteamApp() {
		
		return null;
	}
	
	// post 업로드
	
	// post 이미지 파일 업로드
	@RequestMapping(value="/uploadPostImage", method=RequestMethod.POST)
	public void uploadPostImage() {
		
	}
	// post 동영상 파일 업로드
	
	
	// profile 이미지 파일 업로드
	@RequestMapping(value="uploadProfileImage", method=RequestMethod.POST)
	public void uploadProfileImage() {
		//String media_id = "profileimg_"+loginVo.getUser_no 
		//String path = "/D:/upload/profileimage/" + loginVo.getUser_no() + "/" ;
		//int user_no = ;
		//파일이름
		//MyFileUploadUtil.uploadFile(uploadPath, originalFilename, fileData);
		// /D:/upload/profileimage/1000/파일이름+랜덤이름.jpg
	}
	
	
}

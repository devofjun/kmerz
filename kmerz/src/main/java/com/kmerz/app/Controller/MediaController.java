package com.kmerz.app.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.SteamAppService;
import com.kmerz.app.util.SteamUtil;
import com.kmerz.app.vo.SteamAppVo;


@Controller
@RequestMapping(value = "/media")
public class MediaController {
	
	@Inject
	private SteamAppService steamAppService;

	@ResponseBody
	@RequestMapping(value="/steam/searchApp", method=RequestMethod.POST)
	public List<SteamAppVo> searchApp(String searchType,String searchWord) {
		// 앱 검색하기
		// steam api로 요청하여 응답받은 JSON에서 앱 이름으로  검색하여 있다면 id를 저장한다.
		// id로 App Detail 정보를 JSON으로 받아내서 파싱하여 DB에 저장한다.
		
		List<String> appidList = new ArrayList<String>();
		// test data 응답
		/*if(searchWord.equals("test")) {
			return testData();
		} else if(searchWord.equals("testinsert")) {
			steamAppService.addSteamAppInfo(testData());
			return null;
		}*/
		if(searchType.equals("searchName")) {
			// 검색 => id
			appidList = SteamUtil.appSearch(searchWord);
		} else if(searchType.equals("searchId")) {
			try {
				Integer.parseInt(searchWord);
				appidList.add(searchWord);
			} catch(Exception e) {
				return null;
			}
		}
		
		List<SteamAppVo> appList = new ArrayList<>();
		for(String appid : appidList) {
			System.out.println("앱아이디 "+appid+"를 탐색합니다.");
			SteamAppVo appVo = steamAppService.getSteamAppID(Integer.parseInt(appid));
			if(appVo == null) {
				System.out.println("DB에 없는 앱 입니다.");
				appVo = SteamUtil.getAppdetail(appid);
				steamAppService.addSteamAppInfo(appVo);
			}
			if(appVo != null && appVo.getApp_type().equals("game")) {
				appList.add(appVo);
			}
		}
		System.out.println(appList);
		return appList;
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

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
	
	private List<SteamAppVo> testData() {
		List<SteamAppVo> appList = new ArrayList<SteamAppVo>();
		appList.add(new SteamAppVo(
				219740, 
				"Don't Starve", 
				"Don’t Starve is an uncompromising wilderness survival game full of science and magic. Enter a strange and unexplored world full of strange creatures, dangers, and surprises. Gather resources to craft items and structures that match your survival style.", 
				"https://cdn.akamai.steamstatic.com/steam/apps/219740/header.jpg?t=1602117150", 
				"₩ 10,500", 
				"http://cdn.akamai.steamstatic.com/steam/apps/2028889/movie480.webm?t=1447358243",
				"https://cdn.akamai.steamstatic.com/steam/apps/219740/page_bg_generated_v6b.jpg?t=1602117150"));
		appList.add(new SteamAppVo(
				322330, 
				"Don't Starve Together", 
				"Don't Starve Together는 혹독한 생존 게임인 Don't Starve의 독립형 멀티플레이어 익스팬션입니다.", 
				"https://cdn.akamai.steamstatic.com/steam/apps/322330/header_alt_assets_23.jpg?t=1624553984", 
				"₩ 15,500", 
				"http://cdn.akamai.steamstatic.com/steam/apps/256840376/movie480_vp9.webm?t=1624553869",
				"https://cdn.akamai.steamstatic.com/steam/apps/322330/page_bg_generated_v6b.jpg?t=1624553984"));
		appList.add(new SteamAppVo(
				1097150, 
				"Fall Guys: Ultimate Knockout", 
				"Fall Guys는 한 명의 승자가 남을 때까지 계속되는 혼란스러운 60인 난투극 멀티플레이 파티 게임입니다!", 
				"https://cdn.akamai.steamstatic.com/steam/apps/1097150/header.jpg?t=1626868819", 
				"₩ 20,500", 
				"http://cdn.akamai.steamstatic.com/steam/apps/256843619/movie480_vp9.webm?t=1626803194",
				"https://cdn.akamai.steamstatic.com/steam/apps/1097150/page_bg_generated_v6b.jpg?t=1626868819"));
		appList.add(new SteamAppVo(
				578080, 
				"PUBG: BATTLEGROUNDS", 
				"PLAYERUNKNOWN’S BATTLEGROUNDS는 배틀로얄 게임으로, 외딴 섬에서 총 100명의 플레이어가 다양한 무기와 전략을 이용하여 마지막 1명이 살아남는 순간까지 전투를 하게 됩니다.", 
				"https://cdn.akamai.steamstatic.com/steam/apps/578080/header.jpg?t=1626232783", 
				"₩ 32,000", 
				"http://cdn.akamai.steamstatic.com/steam/apps/256814351/movie480_vp9.webm?t=1626232779",
				"https://cdn.akamai.steamstatic.com/steam/apps/578080/page_bg_generated_v6b.jpg?t=1626232783"));
		appList.add(new SteamAppVo(
				1049590, 
				"이터널 리턴", 
				"이터널 리턴은 전략, 컨트롤, 그리고 멋진 캐릭터들을 경험하실 수 있는 쿼터뷰 스타일의 독특한 배틀로얄 게임입니다. 지속적으로 추가되는 캐릭터들과 함께 루미아섬에서 다른 17명의 플레이어들과 경쟁을 즐겨보세요. 솔로플레이와 듀오/스쿼드의 팀플레이 모두 가능합니다.", 
				"https://cdn.akamai.steamstatic.com/steam/apps/1049590/header.jpg?t=1626949132", 
				null, 
				"http://cdn.akamai.steamstatic.com/steam/apps/256805055/movie480_vp9.webm?t=1602985982",
				"https://cdn.akamai.steamstatic.com/steam/apps/1049590/page_bg_generated_v6b.jpg?t=1626949132"));
		return appList;
	}
	
	@ResponseBody
	@RequestMapping(value="/steam/searchApp", method=RequestMethod.POST)
	public List<SteamAppVo> searchApp(String searchType,String searchWord) {
		
		List<String> list = new ArrayList<String>();
		// test data 응답
		if(searchWord.equals("test")) {
			return testData();
		} else if(searchWord.equals("testinsert")) {
			steamAppService.addSteamAppInfo(testData());
			return null;
		}
		
		if(searchType.equals("searchName")) {
			list = SteamUtil.appSearch(searchWord);
		} else if(searchType.equals("searchId")) {
			try {
				Integer.parseInt(searchWord);
				list.add(searchWord);
			} catch(Exception e) {
				return null;
			}
		}
		List<SteamAppVo> appList = SteamUtil.getAppdetails(list);
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

package com.kmerz.app.Controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kmerz.app.service.PostService;
import com.kmerz.app.service.SteamAppService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.util.SteamUtil;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;
import com.kmerz.app.vo.SteamAppVo;

@Controller
@RequestMapping(value = "/media")
public class MediaController {
	
	@Inject
	PostService pService;
	
	@RequestMapping(value = "/modal", method = RequestMethod.GET)
	public String modal() {
		return "modal";
	}
	
	@RequestMapping(value = "/upload_media", method = RequestMethod.POST)
	public String upload_media(@RequestParam("file") MultipartFile file,
							   @RequestParam("community_id") String community_id,
							   @RequestParam("category_no")  int category_no,
							   @RequestParam("post_title")   String post_title,	
							   HttpSession session,
							   Model model
							   ) throws IOException {
		int seqPostNo = pService.getNewPostSeq();
		
		String fileName = ContentReadAndWrite.WriteContent(file, seqPostNo);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int user_no = memberVo.getUser_no();
		PostsVo vo = new PostsVo();
		vo.setPost_no(seqPostNo);
		vo.setCategory_no(category_no);
		vo.setCommunity_id(community_id);
		vo.setPost_title(post_title);
		vo.setUser_no(user_no);
		vo.setPost_content_file(fileName);
		vo.setPost_lastupdate(new Timestamp(System.currentTimeMillis()));
		vo.setPost_status("accept");
		System.out.println(vo);
		pService.posting(vo);
		model.addAttribute("post_no", seqPostNo);
		return "redirect:/include/modal";
		}	
	
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

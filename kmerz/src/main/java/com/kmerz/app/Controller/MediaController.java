package com.kmerz.app.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.MemberService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.service.SteamAppService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.util.MyFileUploadUtil;
import com.kmerz.app.util.SteamUtil;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;
import com.kmerz.app.vo.SteamAppVo;

@Controller
@RequestMapping(value = "/media")
public class MediaController {

	@Inject
	PostService pService;
	@Inject
	CommunityService commService;
	@Inject
	MemberService memberService;

	// 게시글 내용 저장
	@RequestMapping(value = "/upload_media", method = RequestMethod.POST)
	public String upload_media(@RequestParam("file") MultipartFile file,
			@RequestParam("community_id") String community_id, @RequestParam("category_no") int category_no,
			@RequestParam("post_title") String post_title, HttpSession session, Model model) throws IOException {
		int seqPostNo = pService.getNewPostSeq();
		
		// 게시글 내용 파일 저장
		String fileName = ContentReadAndWrite.WriteContent(file, seqPostNo);
		// 게시글 vo 객체 생성
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		int user_no = memberVo.getUser_no();
		PostsVo vo = new PostsVo();
		vo.setPost_no(seqPostNo);
		vo.setCategory_no(category_no);
		vo.setCommunity_id(community_id);
		vo.setPost_title(post_title);
		vo.setUser_no(user_no);
		vo.setPost_content_file(fileName);
		vo.setCommunity_name(commService.getOneCommunity(community_id).getCommunity_name());
		// 게시글vo DB insert
		pService.posting(vo);
		return "redirect:/include/modal?post_no=" + vo.getPost_no();
	}

	@Inject
	private SteamAppService steamAppService;

	@ResponseBody
	@RequestMapping(value = "/steam/searchApp", method = RequestMethod.POST)
	public List<SteamAppVo> searchApp(String searchType, String searchWord) {
		// 앱 검색하기
		// steam api로 요청하여 응답받은 JSON에서 앱 이름으로 검색하여 있다면 id를 저장한다.
		// id로 App Detail 정보를 JSON으로 받아내서 파싱하여 DB에 저장한다.

		List<String> appidList = new ArrayList<String>();
		// test data 응답
		/*
		 * if(searchWord.equals("test")) { return testData(); } else
		 * if(searchWord.equals("testinsert")) {
		 * steamAppService.addSteamAppInfo(testData()); return null; }
		 */
		if (searchType.equals("searchName")) {
			// 검색 => id
			appidList = SteamUtil.appSearch(searchWord);
		} else if (searchType.equals("searchId")) {
			try {
				Integer.parseInt(searchWord);
				appidList.add(searchWord);
			} catch (Exception e) {
				return null;
			}
		}

		List<SteamAppVo> appList = new ArrayList<>();
		for (String appid : appidList) {
			System.out.println("앱아이디 " + appid + "를 탐색합니다.");
			SteamAppVo appVo = steamAppService.getSteamAppID(Integer.parseInt(appid));
			if (appVo == null) {
				System.out.println("DB에 없는 앱 입니다.");
				appVo = SteamUtil.getAppdetail(appid);
				steamAppService.addSteamAppInfo(appVo);
			}
			if (appVo != null && appVo.getApp_type().equals("game")) {
				appList.add(appVo);
			}
		}
		System.out.println(appList);
		return appList;
	}

	// post 업로드

	// post 이미지 파일 업로드
	@RequestMapping(value = "/loadImage")
	public void uploadPostImage(@RequestParam String path, HttpServletResponse response) throws IOException {
		int fileSize = (int) new File(path).length();
		response.setContentLength(fileSize);
		response.setContentType("image");
		FileInputStream inputStream = new FileInputStream(path);
		ServletOutputStream outputStream = response.getOutputStream();
		int value = IOUtils.copy(inputStream, outputStream);
		System.out.println("File Size :: " + fileSize);
		System.out.println("Copied Bytes :: " + value);
		IOUtils.closeQuietly(inputStream);
		IOUtils.closeQuietly(outputStream);
		response.setStatus(HttpServletResponse.SC_OK);
	}

	// post 동영상 로드
	@RequestMapping("/loadVideo")
	public void loadVideo(@RequestParam String path, HttpServletResponse response)
			throws Exception {
		int fileSize = (int) new File(path).length();
		response.setContentLength(fileSize); // 응답 데이터 크기 설정
		response.setContentType("video"); // 응답 데이터 타입 설정
		FileInputStream inputStream = new FileInputStream(path); // 파일 읽기 스트림
		ServletOutputStream outputStream = response.getOutputStream(); // 응답 스트림을 쓰기 스트림으로씀
		int value = IOUtils.copy(inputStream, outputStream); // 읽기 스트림으로부터 읽은 데이터를 쓰기 스트림으로 복사함
		System.out.println("File Size :: " + fileSize);
		System.out.println("Copied Bytes :: " + value);
		IOUtils.closeQuietly(inputStream); // 스트림 닫기
		IOUtils.closeQuietly(outputStream); // 스트림 닫기
		response.setStatus(HttpServletResponse.SC_OK); // 파일 읽어오고 응답데이터에 담기 성공했으니 그대로 응답데이터 정상데이터로 보내기
	}

	// profile 이미지 파일 업로드
	@RequestMapping(value = "/uploadProfileImage", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	public String uploadAjax(MultipartFile file, HttpSession session) throws Exception {
		MemberVo getMemberVo = (MemberVo) session.getAttribute("loginVo");
		int user_no = getMemberVo.getUser_no();
		String user_id = getMemberVo.getUser_id();
		String user_pw = getMemberVo.getUser_pw();
		String strUser_no = String.valueOf(user_no);
		String uploadPath = "D:/kmerz/repository/profile/" + strUser_no;
		// System.out.println("uploadPath:" + uploadPath);
		// System.out.println("file:" + file);
		String originalFilename = file.getOriginalFilename();
		// System.out.println("originalFilename:" + originalFilename);
		String filePath = MyFileUploadUtil.uploadFile(uploadPath, originalFilename, file.getBytes());
		// System.out.println("filePath: " + filePath);

		// memberService 사용해서 파일 경로를 tbl_member 업데이트 까지 하기
		memberService.changeProfileImage(user_no, filePath);

		session.removeAttribute("loginVo");
		MemberVo memberVo = memberService.login(user_id, user_pw);
		session.setAttribute("loginVo", memberVo);
		return "redirect:/m/userProfileImagesChangeForm";
	}

	// 썸네일 이미지 요청
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public static byte[] displayImage(String fileName) throws Exception {
		FileInputStream fis = new FileInputStream(fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
}

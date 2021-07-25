package com.kmerz.app.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/media")
public class MediaController {
	
	@Inject
	PostService pService;
	
	@RequestMapping(value = "/upload_media", method = RequestMethod.POST)
	public String upload_media(@RequestParam("file") MultipartFile file,
							   @RequestParam("community_id") String community_id,
							   @RequestParam("category_no")  int category_no,
							   @RequestParam("post_title")   String post_title,	
							   HttpSession session
							   ) throws IOException {
		Path uploadDir = Paths.get("C:\\Users\\vip\\Desktop\\spring\\kmerz\\kmerz\\src\\main\\webapp\\resources\\post");	
		if (!Files.isDirectory(uploadDir)) {
			try {
				Files.createDirectories(uploadDir);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String logicalFileName = null;
		System.out.println(file);
		try {
			UUID tempFileName = UUID.randomUUID();
			String originalFileName = file.getOriginalFilename();
			String fileExt = FilenameUtils.getExtension(originalFileName);

			if (originalFileName.toLowerCase().endsWith(".txt")) {
				fileExt = "txt";
			}
			logicalFileName = tempFileName.toString() + "." + fileExt;

			byte[] fileBytes = file.getBytes();
			Path filePath = uploadDir.resolve(logicalFileName);
			Files.write(filePath, fileBytes);
			System.out.println(filePath);
			System.out.println(logicalFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_name = memberVo.getUser_name();
		PostsVo vo = new PostsVo();
		vo.setCategory_no(category_no);
		vo.setCommunity_id(community_id);
		vo.setPost_title(post_title);
		vo.setUser_name(user_name);
		vo.setPost_content_file(logicalFileName);
		vo.setPost_lastupdate(new Timestamp(System.currentTimeMillis()));
		vo.setPost_status("accept");
		System.out.println(vo);
		pService.posting(vo);
		return "include/upload_media";
	}
	@RequestMapping(value="/images")
	public String images() {
		return "D:\\upload\\images\\battlefield 2042.jpg";
	}
}

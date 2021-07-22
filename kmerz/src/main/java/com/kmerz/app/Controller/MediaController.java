package com.kmerz.app.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/media")
public class MediaController {
	@RequestMapping(value = "/upload_media", method = RequestMethod.POST)
	public String upload_media(@RequestParam("file") MultipartFile file) throws IOException {
		Path uploadDir = Paths.get("d:/upload/post");	
		if (!Files.isDirectory(uploadDir)) {
			try {
				Files.createDirectories(uploadDir);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(file);
		try {
			UUID tempFileName = UUID.randomUUID();
			String originalFileName = file.getOriginalFilename();
			String fileExt = FilenameUtils.getExtension(originalFileName);

			if (originalFileName.toLowerCase().endsWith(".txt")) {
				fileExt = "txt";
			}
			String logicalFileName = tempFileName.toString() + "." + fileExt;

			byte[] fileBytes = file.getBytes();
			Path filePath = uploadDir.resolve(logicalFileName);
			Files.write(filePath, fileBytes);
			System.out.println(filePath);
			System.out.println(logicalFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "include/upload_media";
	}
}

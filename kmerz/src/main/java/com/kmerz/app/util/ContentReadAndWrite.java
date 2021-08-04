package com.kmerz.app.util;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class ContentReadAndWrite {
	public static String WriteContent(MultipartFile file, int seqPostNo) {
		//Path uploadDir = Paths.get("G:\\workspace\\springmvc\\kmerz\\kmerz\\src\\main\\webapp\\resources\\post");
		String path = "D:/kmerz/repository/post/";
		//System.out.println(file);
		Path uploadDir = AttachmentProcessing.PathProcessing(path);
		String logicalFileName = null;
		Path filePath = null;
		try {
			UUID tempFileName = UUID.randomUUID();
			String originalFileName = file.getOriginalFilename();
			String fileExt = FilenameUtils.getExtension(originalFileName);
			
			if (originalFileName.toLowerCase().endsWith(".txt")) {
				fileExt = "txt";
			}
			logicalFileName = seqPostNo + "_" + tempFileName.toString() + "." + fileExt;

			byte[] fileBytes = file.getBytes();
			filePath = uploadDir.resolve(logicalFileName);
			Files.write(filePath, fileBytes);
			//System.out.println(filePath);
			//System.out.println(logicalFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filePath.toString();

	}

	public static String ReadContent(String filePath) throws IOException {
		byte[] content = null;
		content = Files.readAllBytes(Paths.get(filePath));
		return new String(content);
	}
}

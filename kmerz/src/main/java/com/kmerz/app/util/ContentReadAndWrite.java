package com.kmerz.app.util;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class ContentReadAndWrite {
	public static void WriteContent(MultipartFile file) {
		Path uploadDir = Paths.get("G:\\workspace\\springmvc\\kmerz\\kmerz\\src\\main\\webapp\\resources\\post");
		if (!Files.isDirectory(uploadDir)) {
			try {
				Files.createDirectories(uploadDir);
			} catch (IOException e) {
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
	}

	public static String ReadContent(String filePath) throws IOException {
		byte[] content = null;
		content = Files.readAllBytes(Paths.get(filePath));
		System.out.println(new String(content));
		System.out.println("파일경로 = " + filePath);
		return new String(content);
	}
}

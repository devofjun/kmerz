package com.kmerz.app.util;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import ws.schild.jave.Encoder;
import ws.schild.jave.EncoderException;
import ws.schild.jave.InputFormatException;
import ws.schild.jave.MultimediaObject;
import ws.schild.jave.encode.AudioAttributes;
import ws.schild.jave.encode.EncodingAttributes;
import ws.schild.jave.encode.VideoAttributes;

public class AttachmentProcessing {
	public static String path = "D:/kmerz/repository/media/";
	
	public static String Upload_Attachment() {
		//String path = "C:/Users/beng0/kmerz/repository/media/";
		
		return "";
	}
	public static Path PathProcessing(String path) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		String dateString = year + "/" + month + "/" + day;
		path += dateString;
		Path uloadDir = Paths.get(path);
		DirProcessing(uloadDir);
		return uloadDir;
	}
	public static void DirProcessing(Path uploadDir) {
		if (!Files.isDirectory(uploadDir)) {
			try {
				Files.createDirectories(uploadDir);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public static String MediaFileNameProcessing(int seqPostNo) {
//		String path = "E:/kmerz/repository/media/";

		String path = "D:/kmerz/repository/media/";

		Path uploadDir = PathProcessing(path);
		Path filePath = null;
		String logicalFileName = null;
		UUID tempFileName = UUID.randomUUID();
		logicalFileName = seqPostNo + "_" + tempFileName.toString();
		filePath = uploadDir.resolve(logicalFileName);
		return filePath.toString();
	}
	public static String FileProcessing(String path, MultipartFile file, int seqPostNo) {
		Path uploadDir = PathProcessing(path);
		String logicalFileName = null;
		Path filePath = null;
		try {
			String originalFileName = file.getOriginalFilename();
			String fileExt = FilenameUtils.getExtension(originalFileName);
			UUID tempFileName = UUID.randomUUID();
			//fileExt = ExtensionProcessing(originalFileName);
			logicalFileName = seqPostNo + "_" + tempFileName.toString() + "." + fileExt;
			byte[] fileBytes = file.getBytes();
			filePath = uploadDir.resolve(logicalFileName);
			Files.write(filePath, fileBytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filePath.toString();
	}
	// 이미지일때 호출됨
	public static void TranscodingJpg(MultipartFile files, String output) {
		System.out.println("Transcoding jpg");
		File source = multipartToFile(files);
		File target = new File(output + ".jpg");
		try {
			BufferedImage input_img = ImageIO.read(source);
			BufferedImage output_img = new BufferedImage(input_img.getWidth(), input_img.getHeight(), BufferedImage.TYPE_INT_RGB);
			output_img.createGraphics().drawImage(input_img, 0, 0, Color.white, null);
			ImageIO.write(output_img, "jpg", target);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 동영상일때 호출됨
	public static void TranscodingMP4(MultipartFile files,String output) {
		System.out.println("encode MP4");
		File source = multipartToFile(files);
		File target = new File(output + ".mp4");
		
		AudioAttributes audio = new AudioAttributes();
		VideoAttributes video = new VideoAttributes();
		EncodingAttributes attrs = new EncodingAttributes();
		
		attrs.setAudioAttributes(audio);
		attrs.setVideoAttributes(video);
		audio.setCodec(AudioAttributes.DIRECT_STREAM_COPY);
		video.setCodec("libx264"); 

		audio.setSamplingRate(new Integer(44100));
		audio.setChannels(new Integer(2));
		audio.setBitRate(new Integer(192000));
		
		video.setBitRate(new Integer(500000)); 
		video.setFrameRate(new Integer(60)); 
		
		attrs.setOutputFormat("mp4");
		Encoder instance = new Encoder(); 
		try {
			instance.encode(new MultimediaObject(source), target, attrs, null);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InputFormatException e) {
			e.printStackTrace();
		} catch (EncoderException e) {
			e.printStackTrace();
		}
	}
	
	public static File multipartToFile(MultipartFile mfile) {
		// 빈 파일 객체
		File file = new File(mfile.getOriginalFilename());
		try {
			// 자바스크립트에서 넘겨주는 파일을 자바에서 쓸수있게 파일 객체로 변환해줌
			mfile.transferTo(file); // 빈파일객체 데이터 넣어줌
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return file;
	}
}

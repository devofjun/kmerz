package com.kmerz.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.MediaDao;
import com.kmerz.app.vo.MediaVo;

@Service
public class MediaServiceImpl implements MediaService {

	@Inject
	MediaDao mediaDao;
	
	@Override
	public void uploadMedia(MediaVo mediaVo) {
		// 미디어 파일 생성후 DB에 저장
		mediaDao.insertMedia(mediaVo);
	}

}

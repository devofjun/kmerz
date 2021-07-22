package com.kmerz.app.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.MediaVo;

@Repository
public class MediaDaoImpl implements MediaDao {
	
	private static final String NAMESPACE = "com.kmerz.app.media.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertMedia(MediaVo mediaVo) {
		// 생성된 파일의 id와 path를 DB에 저장함
		sqlSession.insert(NAMESPACE+"insertMedia", mediaVo);
	}
	
}

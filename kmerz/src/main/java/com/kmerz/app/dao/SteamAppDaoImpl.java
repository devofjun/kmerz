package com.kmerz.app.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.SteamAppVo;

@Repository
public class SteamAppDaoImpl implements SteamAppDao{

	private static final String NAMESPACE = "com.kmerz.app.steamapp.";
	
	@Inject
	SqlSession session;
	
	@Override
	public void insertSteamApp(SteamAppVo steamAppVo) {
		session.insert(NAMESPACE+"insertSteamApp", steamAppVo);
	}

}

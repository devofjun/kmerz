package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public SteamAppVo selectSteamApp(int appid) {
		// 저장된 스팀앱 정보 id로 찾기
		Map<String, Integer> map = new HashMap<>(); 
		map.put("app_id", appid);
		SteamAppVo appVo = session.selectOne(NAMESPACE+"selectSteamApp", map);
		return appVo;
	}

}

package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.SteamAppDao;
import com.kmerz.app.vo.SteamAppVo;

@Service
public class SteamAppServiceImpl implements SteamAppService {

	@Inject
	SteamAppDao appDao;
	
	@Override
	public void addSteamAppInfo(SteamAppVo appVo) {
		// 앱 정보 저장
		if(appVo != null) {
			appDao.insertSteamApp(appVo);
			System.out.println("DB에 새로운 앱 정보를 저장했습니다.");
		}
	}
	
	@Override
	public void addSteamAppInfos(List<SteamAppVo> steamAppList) {
		// test
		for(SteamAppVo appVo : steamAppList) {
			System.out.println(appVo);
			appDao.insertSteamApp(appVo);
		}
	}

	@Override
	public SteamAppVo getSteamAppID(int appid) {
		// appid로 저장된 스팀앱 정보 가져오기
		SteamAppVo vo = appDao.selectSteamApp(appid);
		return vo;
	}

	

}

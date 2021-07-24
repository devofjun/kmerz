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
	public void addSteamAppInfo(List<SteamAppVo> steamAppList) {
		for(SteamAppVo appVo : steamAppList) {
			System.out.println(appVo);
			appDao.insertSteamApp(appVo);
		}
	}

}

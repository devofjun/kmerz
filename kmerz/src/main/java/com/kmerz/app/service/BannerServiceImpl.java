package com.kmerz.app.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.BannerDao;
import com.kmerz.app.dao.SteamAppDao;
import com.kmerz.app.vo.BannerVo;
import com.kmerz.app.vo.SteamAppVo;

@Service
public class BannerServiceImpl implements BannerService {

	@Inject
	BannerDao bannerDao;
	@Inject
	SteamAppDao steamAppDao;
	
	@Transactional
	@Override
	public void initBanner(List<BannerVo> list) {
		bannerDao.deleteAll();
		for(BannerVo vo : list) {
			bannerDao.insertBanner(vo);
		}
	}

	@Transactional
	@Override
	public List<SteamAppVo> getBannerList() {
		// TODO Auto-generated method stub
		List<BannerVo> bannerList = bannerDao.selectAll();
		List<SteamAppVo> appList = new ArrayList<>();
		for(BannerVo vo : bannerList) {
			appList.add(steamAppDao.selectAppOne(vo.getApp_id()));
		}
		/*List<Integer> idList = new ArrayList<>();
		for(BannerVo vo : bannerList) {
			idList.add(vo.getApp_id());
		}
		System.out.println("getBannerList_idList: "+idList.toString());
		List<SteamAppVo> appList = steamAppDao.selectBannerAppList(idList);
		*/
		return appList;
	}

}

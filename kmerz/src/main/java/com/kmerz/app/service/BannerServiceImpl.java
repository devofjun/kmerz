package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.BannerDao;
import com.kmerz.app.vo.BannerVo;

@Service
public class BannerServiceImpl implements BannerService {

	@Inject
	BannerDao bannerDao;
	
	@Transactional
	@Override
	public void initBanner(List<BannerVo> list) {
		bannerDao.deleteAll();
		for(BannerVo vo : list) {
			bannerDao.insertBanner(vo);
		}
	}

}

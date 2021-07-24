package com.kmerz.app.dao;

import com.kmerz.app.vo.BannerVo;

public interface BannerDao {
	public void deleteAll();
	public void insertBanner(BannerVo bannerVo);
}

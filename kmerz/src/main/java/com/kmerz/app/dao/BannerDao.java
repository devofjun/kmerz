package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.BannerVo;

public interface BannerDao {
	public void deleteAll();
	public void insertBanner(BannerVo bannerVo);
	public List<BannerVo> selectAll();
}

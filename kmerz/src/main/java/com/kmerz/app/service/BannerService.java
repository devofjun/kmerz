package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.BannerVo;
import com.kmerz.app.vo.SteamAppVo;

public interface BannerService {
	public void initBanner(List<BannerVo> list);
	public List<SteamAppVo> getBannerList();
}

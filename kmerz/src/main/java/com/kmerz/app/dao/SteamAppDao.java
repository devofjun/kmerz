package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.BannerVo;
import com.kmerz.app.vo.SteamAppVo;

public interface SteamAppDao {
	public void insertSteamApp(SteamAppVo steamAppVo);
	public SteamAppVo selectAppOne(int appid);
	public List<SteamAppVo> selectBannerAppList(List<Integer> idList);
}

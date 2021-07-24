package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.SteamAppVo;

public interface SteamAppService {
	public void addSteamAppInfo(SteamAppVo appVo);
	public void addSteamAppInfos(List<SteamAppVo> steamAppVo);
	public SteamAppVo getSteamAppID(int appid);
}

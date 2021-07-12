package com.kmerz.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	CommunityDao commDao;
	
	@Override
	public String test() {
		System.out.println("서비스");		
		return commDao.test();
	}

}

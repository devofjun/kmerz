package com.kmerz.app.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	private static final String NAMESPACE = "com.kmerz.app.community.";
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public String test() {
		System.out.println("다오");
		sqlsession.selectOne(NAMESPACE+"commtest");
		return "success";
	}

}

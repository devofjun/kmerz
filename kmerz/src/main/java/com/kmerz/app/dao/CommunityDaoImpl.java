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
	public int test() {
		System.out.println("다오");
		int result = sqlsession.selectOne(NAMESPACE+"commtest");
		System.out.println(result);
		return result;
	}

}

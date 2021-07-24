package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.BannerVo;

@Repository
public class BannerDaoImpl implements BannerDao {

	private static final String NAMESPACE = "com.kmerz.app.banner.";
	
	@Inject
	SqlSession session;
	
	
	@Override
	public void deleteAll() {
		session.delete(NAMESPACE+"deleteAll");
	}

	@Override
	public void insertBanner(BannerVo bannerVo) {
		session.insert(NAMESPACE+"insertBanner", bannerVo);
	}

	@Override
	public List<BannerVo> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+"selectAll");
	}

}

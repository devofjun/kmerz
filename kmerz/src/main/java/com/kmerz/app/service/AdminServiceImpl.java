package com.kmerz.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.AdminDao;
import com.kmerz.app.vo.AdminVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDao adminDao;
	
	@Override
	public void registAdmin(AdminVo adminVo) {
		adminDao.insertAdmin(adminVo);
	}

	@Override
	public AdminVo loginAdmin(String admin_id, String admin_pw) {
		AdminVo adminVo = adminDao.selectIdPw(admin_id, admin_pw);
		return adminVo;
	}

}

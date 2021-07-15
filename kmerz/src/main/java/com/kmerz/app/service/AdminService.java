package com.kmerz.app.service;

import com.kmerz.app.vo.AdminVo;

public interface AdminService {
	public void registAdmin(AdminVo adminVo);
	public AdminVo loginAdmin(String admin_id, String admin_pw);
}

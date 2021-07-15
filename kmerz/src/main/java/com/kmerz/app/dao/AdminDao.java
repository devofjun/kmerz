package com.kmerz.app.dao;

import com.kmerz.app.vo.AdminVo;

public interface AdminDao {
	public void insertAdmin(AdminVo managerVo);
	public AdminVo selectIdPw(String admin_id, String admin_pw);
}

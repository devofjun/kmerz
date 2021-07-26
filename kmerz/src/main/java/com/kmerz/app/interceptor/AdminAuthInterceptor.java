package com.kmerz.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kmerz.app.vo.AdminVo;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter {
	// 요청이 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		// 요청 경로 세션에 추가하기
		String uri = request.getRequestURI();
		String queryString = request.getQueryString();
		String requestPath = uri + "?" + queryString;
		System.out.println("인터셉터 requestPath: " + requestPath);
		session.setAttribute("requestPath", requestPath);
		
		AdminVo adminVo = (AdminVo) session.getAttribute("loginAdminVo");
		if (adminVo == null) {
			response.sendRedirect("/admin/loginForm");
			return false;
		} else {
			//System.out.println("인터셉터 통과");
			return true;
		}
	}
}

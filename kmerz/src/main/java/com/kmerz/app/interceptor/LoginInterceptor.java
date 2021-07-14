package com.kmerz.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kmerz.app.vo.MemberVo;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
					throws Exception {
			HttpSession session = request.getSession();
			
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			if(memberVo == null) {
				// 로그인 하지 않은 사용자일 경우 로그인 페이지로 이동
				response.sendRedirect("/m/loginForm");
				return false;
			}
			// 로그인 사용자일 경우 Controller 호출
			return true;
	}
}

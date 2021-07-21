package com.kmerz.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kmerz.app.vo.MemberVo;

public class CommunityInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		// 요청 경로 얻기
		String uri = request.getRequestURI();
		String queryString = request.getQueryString();
		String requestPath = uri;
		if (queryString != null) {
			requestPath += "?" + queryString;
		}
		System.out.println("requestPath:" + requestPath);
		session.setAttribute("requestPath", requestPath);

		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		if (memberVo == null) {
			// 로그인 하지 않은 사용자일 경우 로그인 페이지로 이동
			response.sendRedirect("/m/requestLoginForm");
			return false;
		}
		// 로그인 사용자일 경우 Controller 호출
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("requestPath");
		super.postHandle(request, response, handler, modelAndView);
	}
}

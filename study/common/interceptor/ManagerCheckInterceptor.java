package com.study.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.login.vo.UserVO;

public class ManagerCheckInterceptor extends HandlerInterceptorAdapter{
	
	// ManagerCheck
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		
		if(user==null) {
			// 로그인X
			response.sendRedirect(request.getContextPath()+"/login/login.wow");
			return false;
		}
		
		// 로그인O
		if(! "MANAGER".equals(user.getUserRole())) {
			response.sendError(403, "당신은 매니저가 아닙니다.");
			return false;
		}
		
		return true;
	}
}

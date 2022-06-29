package com.study.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.login.vo.UserVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	// RequestMapping 가기 전 여러가지 공통된 기능을 실행하는것 > interceptor
	// return type > boolean : true 일 때 RequestMapping메소드를 가도록
	// 로그인이 되어있지 않다면 false 
	// 로그인의 유무 > session으로 판단.
	// 여기로 오는 request는 애초에 /mypage/* 에 대한 request
	// mvc-servlet에 bean으로 객체를 만들어줘야함 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		String ajax = request.getHeader("X-requested-with"); 
		System.out.println(ajax);
		
		if(user==null) {
			response.sendError(401); // 처리는 error 아무거나 보내도 되지만 로그인이안됨 > 인증안됨 401
			// 로그인이 되어있지 않음
			
			// 브라우저 요청 > [필터] > D.S > MYPAGE 
			// [필터] 에서 true면 MYPAGE로 false면 다시 보내주도록 Redirect , return false만 한다면 빈 화면만 출력   
			response.sendRedirect(request.getContextPath() + "/login/login.wow");
			return false;
		}
		return true;
		
	}
	
}

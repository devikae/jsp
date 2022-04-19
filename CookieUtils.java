package com.study.common.util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;



public class CookieUtils {
	//특정 쿠키가 검색, 쿠키생성+set 한번에 하기 
	
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	//문자열과 쿠키객체를 받아 만든 쿠키 맵
	
	
	// 생성자, CookieUtils 만들 때 매개변수로 request를 받아서 cookieMap에 저장
	public CookieUtils(HttpServletRequest request) { // 특정 키 유무 리퀘스트로 판별
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				this.cookieMap.put(cookie.getName(), cookie);
				//맵에 만든 쿠키의 이름과, 객체를 넣어줌.
			}
		}
		
	}
	
	// 해당 쿠키가 있는지 없는지, 
	// boolean타입 리턴 
	public boolean exists(String name) {
		return cookieMap.get(name)!=null; 
	}
	
	// 해당 쿠키 얻기 
	public Cookie getCookie(String cookieName) {
		return cookieMap.get(cookieName);
	}
	
	public String getValue(String name) throws IOException{
		Cookie cookie=cookieMap.get(name);
		if(cookie==null) return null;
		return URLDecoder.decode(cookie.getValue(),"utf-8");
	}
	
	// 쿠키생성과 set을 한번에
	
	public static Cookie createCookie(String name, String value) throws IOException {
		return createCookie(name, value, "", "", -1);
	}
	
	public static Cookie createCookie(String name,String value,String path) throws IOException{
		return createCookie(name,value,"",path,-1);
	}
	
	
	public static Cookie createCookie(String name,String value,int maxAge) throws IOException{
		return createCookie(name,value,"","",maxAge);
	}
	
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
		return createCookie(name, value, "", path, maxAge);
	}
	
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
}

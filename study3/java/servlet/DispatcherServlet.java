package com.study.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.free.web.FreeList;

public class DispatcherServlet extends HttpServlet{
	private RequestMappingHandlerMapping handlerMapping;
	
	@Override
	public void init() throws ServletException {
		// 첫 요청이 오면 init 메소드 실행 (서버 시작시 실행)
		String uriPropertiesLocation = "/WEB-INF/classes/config/uri_handlermapping.properties";
		try {
			handlerMapping = new RequestMappingHandlerMapping(getServletContext(), uriPropertiesLocation);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// (요청 할 때 마다 실행)
		String uri= req.getRequestURI();
		uri=uri.substring(req.getContextPath().length());
		
		Handler handler = handlerMapping.getHandler(uri); // free/freeList.wow 로 요청을 하면 freeList에 대한 객체 리턴
		if(handler == null) {
			resp.sendError(404); // 처리할 수 없는 uri 
		}else {
			try {
				String viewPage = handler.process(req, resp);
				if(viewPage.startsWith("redirect:") ) {
					resp.sendRedirect(viewPage.substring("redirect:".length()));
				}else {
					RequestDispatcher rd = req.getRequestDispatcher(viewPage);
					rd.forward(req,	resp);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
				
	}
}
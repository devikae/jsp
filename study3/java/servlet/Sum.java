package com.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sum extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		// 서블릿이 처음 생성될 때 실행되는 코드 
		System.out.println("Sum 서블릿이 생성되었습니다.");
		super.init();
	}
	
	@Override
	public void destroy() {
		// 서블릿이 종료될 때 실행되는 메소드
		super.destroy();
	}
	
	
	// service : 어떤 요청이 오든 실행되는 메소드
	// doGet  : Get요청이 왔을 때 실행되는 메소드
	// doPost : Post 요청이 왔을 때 실행되는 메소드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html ; charset = utf-8 ");
		PrintWriter out = resp.getWriter();
		int to = Integer.parseInt(req.getParameter("to"));
		
		out.print("<html><body><ul>");
		for(int i = 0; i <= to; i++) {
			out.print("<li>1부터 " +i + "까지 합 = " + (i+1)/2 + "</li>"  );
		}
		out.print("</ul></body></html>");
	}
}

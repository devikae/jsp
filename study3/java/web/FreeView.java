package com.study.free.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.servlet.Handler;

public class FreeView implements Handler {

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int boNo = Integer.parseInt(req.getParameter("boNo"));
		IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
		try {
			FreeBoardVO free = freeBoardService.getBoard(boNo);
			freeBoardService.increaseHit(boNo);
			req.setAttribute("free", free);
		} catch (BizNotFoundException | BizNotEffectedException bnf) {
			req.setAttribute("bnf", bnf);
		}
		return "/WEB-INF/views/free/freeView.jsp";
	}
}

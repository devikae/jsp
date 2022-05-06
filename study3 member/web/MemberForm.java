package com.study.member.web;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.servlet.Handler;

public class MemberForm implements Handler {

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ICommCodeService codeService = new CommCodeServiceImpl();
		List<CodeVO> categoryList = codeService.getCodeListByParent("HB00");
		List<CodeVO> categoryList2 = codeService.getCodeListByParent("JB00");
		req.setAttribute("categoryList", categoryList);
		req.setAttribute("categoryList2", categoryList2);
		return "member/memberForm";
	}
}

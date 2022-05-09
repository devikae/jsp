package com.study.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.member.dao.MemberDaoOracle;
import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;
import com.study.servlet.Handler;

public class MemberDelete implements Handler {


	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		IMemberService memberService = new MemberServiceImpl();
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		MemberVO member = new MemberVO();
		
		BeanUtils.populate(member, req.getParameterMap());
		String memId = req.getParameter("memId");

		try {
			memberService.removeMember(memberService.getMember(memId));
			resultMessageVO.messageSetting(true, "삭제", "삭제성공", "/member/memberList.wow", "목록으로");
			req.setAttribute("member", member);
		} catch (BizNotFoundException bnf) {
			resultMessageVO.messageSetting(false, "글 NotEffected", "업데이트에 실패했습니다.", "/member/memberList.wow", "목록으로");
			req.setAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		} catch (BizNotEffectedException bne) {
			resultMessageVO.messageSetting(false, "글 NotFound", "해당 글이 없습니다.", "/member/memberList.wow", "목록으로");
			req.setAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		req.setAttribute("resultMessageVO", resultMessageVO);
		
		return "common/message";
	}
}

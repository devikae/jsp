package com.study.member.service;

import java.util.List;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.member.dao.IMemberDao;
import com.study.member.dao.MemberDaoOracle;
import com.study.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	
	IMemberDao memberDao = new MemberDaoOracle();

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = memberDao.getMemberList();
		return memberList;
	}

	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		MemberVO member = memberDao.getMember(memId);
		if(member == null)throw new BizNotFoundException();
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		
//		MemberVO dbMem = memberDao.getMember(member.getMemId());
		
		// dbMem의 비밀번호와 파라미터로 들어온 member의 비밀번호 비교 
		
//		if(dbMem==null) throw new BizNotFoundException();
		
//		if(!dbMem.getMemPass().equals(member.getMemPass())) throw new BizNotEffectedException();
		
		int resultCnt = memberDao.updateMember(member);
		
		if(resultCnt == 0) throw new BizNotEffectedException();
		
	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		
//		MemberVO dbMem = memberDao.getMember(member.getMemId());
		
//		if(dbMem==null) throw new BizNotFoundException();
		
//		if(!dbMem.getMemPass().equals(member.getMemPass())) throw new BizNotEffectedException();
		
		MemberVO Mem1 = memberDao.getMember(member.getMemId());
		System.out.println("파라미터 객체 새로 담음 / 객체의 getName: " + Mem1.getMemName());
		if( Mem1 == null) {System.out.println("Mem1 == null ::"); throw new BizNotFoundException();} 
		System.out.println("Mem1 == null 이 아니다");
		
		int resultCnt = memberDao.deleteMember(Mem1);
		System.out.println("rC: "+resultCnt);
		
		if(resultCnt == 0) {System.out.println("rC == 0::"); throw new BizNotEffectedException();}
		
		
	}

	@Override
	public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
		
//		MemberVO dbMem = memberDao.getMember(member.getMemId());
//		System.out.println("리스트 담기전");
//		List<MemberVO> dbMemList = memberDao.getMemberList();
//		// db에 있는 멤버를 담은 리스트 
//		System.out.println("리스트 담은 후");
//		
//		for(int i =0; i<dbMemList.size(); i++) {
//			
//			if(member.getMemId().equals(dbMemList.get(i).getMemId())) {
//				System.out.println("중복일때");
//				throw new BizDuplicateKeyException();
//			}else if(!dbMemList.get(i).getMemId().equals(member.getMemId())) {
//				throw new BizNotEffectedException();
//			}
//			
//		}
		
		MemberVO Mem1 = memberDao.getMember(member.getMemId());
		
		if(Mem1 == null) { // 파라미터 멤버의 ID로 가져온 getMember가 null일 떄 > 중복 아님 가입가능
			int resultCnt = memberDao.insertMember(member);
			if(resultCnt == 0) throw new BizNotEffectedException();
		}else if(Mem1 != null) { // 널이 아님 >> 값이 있음 > 중복됨 
			throw new BizDuplicateKeyException();
		}else {
			throw new BizNotEffectedException();
		}
		
		
		
		
//		if(dbMem.getMemId().equals(member.getMemId())) throw new BizDuplicateKeyException();
		
//		int resultCnt = memberDao.insertMember(member);
		
//		if(resultCnt == 0) throw new BizNotEffectedException();
		
	}


	
}

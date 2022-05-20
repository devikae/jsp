package com.study.member.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.free.dao.IFreeBoardDao;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MailAuthVO;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	IMemberDao memberDao;

	@Override
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) {
			int totalRowCount = memberDao.getTotalRowCount(searchVO);
			searchVO.setTotalRowCount(totalRowCount);
			searchVO.pageSetting();
			return memberDao.getMemberList(searchVO);

	}

	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
			MemberVO vo = memberDao.getMember(memId);
			if (vo == null) {
				throw new BizNotFoundException();
			}
			return vo;
	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
			MemberVO vo = memberDao.getMember(member.getMemId());
			if (vo == null) {
				throw new BizNotFoundException();
			}
			int cnt = memberDao.updateMember(member);
			if (cnt == 0)
				throw new BizNotEffectedException();
	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
			MemberVO vo = memberDao.getMember(member.getMemId());
			if (vo == null) {
				throw new BizNotFoundException();
			}
			int cnt = memberDao.deleteMember(member);
			if (cnt == 0)
				throw new BizNotEffectedException();
	}

	@Override
	public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
			MemberVO vo = memberDao.getMember(member.getMemId());
			if (vo != null) {
				throw new BizDuplicateKeyException();
			}
			int cnt = memberDao.insertMember(member);
			if (cnt == 0)
				throw new BizNotEffectedException();
			int cnt2 = memberDao.insertUserRole(member.getMemId());
			if (cnt2 == 0)
				throw new BizNotEffectedException();
			
	}
	
	@Override
	public void registMailAuth(String mail, String authKey) {
		MailAuthVO mailAuth = memberDao.getMailAuth(mail);
		
		if(mailAuth == null) {
			int cnt = memberDao.insertMailAuth(mail, authKey);
		}else {
			int cnt = memberDao.updateMailAuth(mail, authKey);
		}
		
		
	}
	
	@Override
	public boolean authKeyCompare(MailAuthVO mailAuth) {
		MailAuthVO vo = memberDao.getMailAuth(mailAuth.getMail());
		System.out.println(vo.getAuthKey());
		System.out.println(mailAuth.getAuthKey());
		if(vo==null) {
			return false;
		}else {
			if(vo.getAuthKey().equals(mailAuth.getAuthKey())) {
				// 인증키가 같다면
				memberDao.completeAuth(mailAuth.getMail());
				return true;
			}else {
				// 인증키와 다르다면
				return false;
			}
		}
	}
	
	@Override
	public boolean isMailAuthed(String mail) {
		MailAuthVO mailAuth = memberDao.getMailAuth(mail);
		if(mailAuth==null) {
			return false;
		}
		if(mailAuth.getIsAuth()==1) {
			return true;
		}else {
			return true;
		}
		
	}

}

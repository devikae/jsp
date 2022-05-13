package com.study.login.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import com.study.login.vo.UserVO;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService {
//SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	
	@Inject
	IMemberDao memberDao;

	@Override
	public UserVO getUser(String memId) {
//		try (SqlSession session = sqlSessionFactory.openSession(true)) {
//			IMemberDao memberDao = session.getMapper(IMemberDao.class);
			MemberVO member = memberDao.getMember(memId);
			if (member != null) {
				UserVO user = new UserVO();
				user.setUserId(memId);
				user.setUserName(member.getMemName());
				user.setUserPass(member.getMemPass());
				user.setUserRole("MEMBER");
				return user;
			} else {
				return null;
			}
//		}
	}
}

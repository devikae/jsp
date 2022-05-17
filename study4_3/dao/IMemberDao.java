package com.study.member.dao;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

@Mapper
public interface IMemberDao {

	public int getTotalRowCount(MemberSearchVO searchVO);
	public List<MemberVO> getMemberList(MemberSearchVO searchVO);
	public MemberVO getMember(String memId);
	public int updateMember(MemberVO member);
	public int deleteMember(MemberVO member);
	public int insertMember(MemberVO member);
	
	// memId로 얻기
	public String getUserRoleByMemId(String memId);
	
	public int insertUserRole(String memId);
	
	// 로그인을 a004로 했을 때 매니저 세션 가지고 매니저인지 판단
	
}

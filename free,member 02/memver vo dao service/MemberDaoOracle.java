package com.study.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.exception.DaoException;
import com.study.member.vo.MemberVO;

public class MemberDaoOracle implements IMemberDao {

	@Override
	public List<MemberVO> getMemberList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			 
			StringBuffer sb = new StringBuffer();
			
			sb.append(" SELECT											");
			sb.append("    mem_id      , mem_pass  , mem_name	");
			sb.append("    , mem_bir   , mem_zip   , mem_add1	");
			sb.append("    , mem_add2  , mem_hp    , mem_mail	");
			sb.append("    , mem_job   , mem_hobby					");
			sb.append("    , mem_mileage, mem_del_yn				");
			sb.append(" FROM member									");
			                  
			
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			
			List<MemberVO> memberList = new ArrayList<MemberVO>(); 
			
			while(rs.next()){
				MemberVO member = new MemberVO();
				member.setMemId( rs.getString("mem_id") );
				member.setMemPass( rs.getString("mem_pass") );
				member.setMemName( rs.getString("mem_name") );
				member.setMemBir( rs.getString("mem_bir") );
				member.setMemZip( rs.getString("mem_zip") );
				member.setMemAdd1( rs.getString("mem_add1") );
				member.setMemAdd2( rs.getString("mem_add2") );
				member.setMemHp( rs.getString("mem_hp") );
				member.setMemMail( rs.getString("mem_mail") );
				member.setMemJob( rs.getString("mem_job") );
				member.setMemHobby( rs.getString("mem_hobby") );
				member.setMemMileage( rs.getInt("mem_mileage") );
				member.setMemDelYn( rs.getString("mem_del_yn") );
				
				memberList.add(member);
				
			}
			
			return memberList;	
			
		}catch(SQLException e){
			throw new DaoException("getMemberList: " +e.getMessage(), e);
		}finally{
			
			if(rs!=null)   {try {rs.close();} catch(Exception e){}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e){}}
			if(conn!=null) {try {conn.close();} catch(Exception e){}}
			
		}
		
	}

	@Override
	public MemberVO getMember(String memId) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" SELECT											");
			sb.append("    mem_id      , mem_pass  , mem_name	");
			sb.append("    , mem_bir   , mem_zip   , mem_add1	");
			sb.append("    , mem_add2  , mem_hp    , mem_mail	");
			sb.append("    , mem_job   , mem_hobby					");
			sb.append("    , mem_mileage, mem_del_yn				");
			sb.append(" FROM member									");
			sb.append(" WHERE mem_id = ?								");
			
			pstmt = conn.prepareStatement(sb.toString());
			int cnt = 1;
			pstmt.setString(1, memId);
			
			rs = pstmt.executeQuery();
			
				
			if(rs.next()){
				MemberVO member = new MemberVO();
				member.setMemId( rs.getString("mem_id") );
				member.setMemPass( rs.getString("mem_pass") );
				member.setMemName( rs.getString("mem_name") );
				member.setMemBir( rs.getString("mem_bir") );
				member.setMemZip( rs.getString("mem_zip") );
				member.setMemAdd1( rs.getString("mem_add1") );
				member.setMemAdd2( rs.getString("mem_add2") );
				member.setMemHp( rs.getString("mem_hp") );
				member.setMemMail( rs.getString("mem_mail") );
				member.setMemJob( rs.getString("mem_job") );
				member.setMemHobby( rs.getString("mem_hobby") );
				member.setMemMileage( rs.getInt("mem_mileage") );
				member.setMemDelYn( rs.getString("mem_del_yn") );
				
				String cut = member.getMemBir();
				String birth = cut.substring(0, 10);
				member.setMemBir(birth);
				
				return member;
			}
			return null;
			
		}catch(SQLException e){
			throw new DaoException("getMember: "+ e.getMessage(), e);
		}finally{
			
			if(rs!=null)   {try {rs.close();} catch(Exception e){}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e){}}
			if(conn!=null) {try {conn.close();} catch(Exception e){}}
			
		}
		
	}

	@Override
	public int updateMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" UPDATE member SET	");
			sb.append("      mem_pass  = ?  ");
			sb.append("    , mem_name  = ?  ");
			sb.append("    , mem_zip   = ? 	");
			sb.append("    , mem_add1  = ? 	");
			sb.append("    , mem_add2  = ? 	");
			sb.append("    , mem_bir   = ? 	");
			sb.append("    , mem_mail  = ? 	");
			sb.append("    , mem_hp    = ? 	");
			sb.append("    , mem_job   = ? 	");
			sb.append("    , mem_hobby = ? 	");
			sb.append(" WHERE mem_id = ?		");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			int cnt=1;
			
			pstmt.setString(cnt++, member.getMemPass());
			pstmt.setString(cnt++, member.getMemName());
			pstmt.setString(cnt++, member.getMemZip());
			pstmt.setString(cnt++, member.getMemAdd1());
			pstmt.setString(cnt++, member.getMemAdd2());
			pstmt.setString(cnt++, member.getMemBir());
			pstmt.setString(cnt++, member.getMemMail());
			pstmt.setString(cnt++, member.getMemHp());
			pstmt.setString(cnt++, member.getMemJob());
			pstmt.setString(cnt++, member.getMemHobby());
			pstmt.setString(cnt++, member.getMemId());
				
			int resultCnt= pstmt.executeUpdate();
			
			return resultCnt;
			
		}catch(SQLException e){
			throw new DaoException("updateBoard: " + e.getMessage());
		}finally{
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e){}}
			if(conn!=null) {try {conn.close();} catch(Exception e){}}
			
		}
		
	}

	@Override
	public int deleteMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" UPDATE member SET		");
			sb.append("     mem_del_yn  = 'Y'  ");
			sb.append(" WHERE mem_id    =  ?   ");
			
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, member.getMemId());
			
			int resultCnt= pstmt.executeUpdate();
			
			return resultCnt;
			
			}catch(SQLException e){
				throw new DaoException("delete: " + e.getMessage());
			
			}finally{
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {}}
			if (conn != null) {try {conn.close();} catch (Exception e) {}}
			}
	}

	@Override
	public int insertMember(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuilder sb = new StringBuilder();
			sb.append( "INSERT INTO member (						");			
			sb.append( "    mem_id,      mem_pass,   mem_name	");			
			sb.append( "    , mem_bir,   mem_zip,    mem_add1	");			
			sb.append( "    , mem_add2,  mem_hp,     mem_mail	");			
			sb.append( "    , mem_job,   mem_hobby					");			
			sb.append( "    , mem_mileage, mem_del_yn				");			
			sb.append( ") VALUES (										");			
			sb.append( "     ?     ,?   ,?							");			
			sb.append( "    ,?                     ,?   ,?		");			
			sb.append( "    ,?                     ,?   ,?		");			
			sb.append( "    ,?                     ,?				");			
			sb.append( "    ,0                    ,'N'	 )		");			

			pstmt = conn.prepareStatement(sb.toString());
			int cnt=1;
			
			pstmt.setString(cnt++, member.getMemId());
			pstmt.setString(cnt++, member.getMemPass());
			pstmt.setString(cnt++, member.getMemName());
			pstmt.setString(cnt++, member.getMemBir());
			pstmt.setString(cnt++, member.getMemZip());
			pstmt.setString(cnt++, member.getMemAdd1());
			pstmt.setString(cnt++, member.getMemAdd2());
			pstmt.setString(cnt++, member.getMemHp());
			pstmt.setString(cnt++, member.getMemMail());
			pstmt.setString(cnt++, member.getMemJob());
			pstmt.setString(cnt++, member.getMemHobby());

			int resultCnt = pstmt.executeUpdate();
			
			return resultCnt;

			}catch(SQLException e){
				throw new DaoException("regist: " + e.getMessage());
			}finally{
				if (pstmt != null) {try {pstmt.close();} catch (Exception e) {}}
				if (conn != null) {try {conn.close();} catch (Exception e) {}}
			}
	}

}

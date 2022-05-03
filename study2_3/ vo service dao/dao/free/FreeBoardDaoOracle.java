package com.study.free.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.study.exception.BizNotEffectedException;
import com.study.exception.DaoException;
import com.study.free.vo.FreeBoardSearchVO;
import com.study.free.vo.FreeBoardVO;

public class FreeBoardDaoOracle implements IFreeBoardDao {
	// IFreeBoarrdDao, FreeBoardDaoOracle, Mysql
	
	// (persistence) DAO의 역할 : DB에 접근,  
	
	
	@Override
	public int getTotalRowCount(FreeBoardSearchVO searchVO) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuffer sb = new StringBuffer();
			
			sb.append("  SELECT count(*)			");
			sb.append("  FROM free_board			");
			sb.append("  WHERE bo_del_yn = 'N'	");
			
//			if(searchVO.getSearchWord() != null && searchVO.getSearchWord().isEmpty()) {
//				sb.append("");
//			}
			
			if(StringUtils.isNotEmpty(searchVO.getSearchWord())) {
				switch (searchVO.getSearchType()) {
				case "T":sb.append(" AND bo_title LIKE '%' || ? || '%' ");					break; // title
				case "W":sb.append(" AND bo_writer LIKE '%' || ? || '%' ");					break; // writer
				case "C":sb.append(" AND bo_content LIKE '%' || ? || '%' ");					break; // content

				default:
					break;
				}
			}
			
			
//			if(StringUtils.isBlankEmpty(searchVO.getSearchWord())) {
//				"			"
//			}
			
			if(StringUtils.isNotEmpty(searchVO.getSearchCategory())) {
				sb.append(" AND bo_category = ? ");
				
			}
			
			pstmt = conn.prepareStatement(sb.toString());
			int cnt =1;
			
			if(StringUtils.isNotEmpty(searchVO.getSearchWord())) {
				pstmt.setString(cnt++, searchVO.getSearchWord());
			}
			if(StringUtils.isNotEmpty(searchVO.getSearchCategory())) {
				pstmt.setString(cnt++, searchVO.getSearchCategory());
			}
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int resultCnt = rs.getInt(1);
				// int resultCnt = rs.getInt("count(*)");
				return resultCnt;
			}
			return 0;
		}catch(SQLException e){ 
			throw new DaoException("getTotalRowCount: " +e.getMessage(), e);
		}finally{
			if(rs!=null)   {try {rs.close();} catch(Exception e){}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e){}}
			if(conn!=null) {try {conn.close();} catch(Exception e){}}
			
		}
	}
	
	@Override
	public List<FreeBoardVO> getBoardList(FreeBoardSearchVO searchVO) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuffer sb = new StringBuffer();
			
			
			sb.append(" SELECT * FROM    (                                  ");
			sb.append("  SELECT a.*, rownum AS rnum  FROM(                  ");
			
			sb.append(" SELECT                                              ");
			sb.append("    to_char(bo_reg_date, 'YYYY-MM-DD') AS bo_reg_date");
			sb.append("   ,to_char(bo_mod_date, 'YYYY-MM-DD') AS bo_mod_date");
			sb.append("	 	, bo_no       , bo_title    , bo_category      ");
			sb.append("	 	, bo_writer   , bo_pass     , bo_content       ");
			sb.append("	 	, bo_ip       , bo_hit      , bo_del_yn        ");
			// code
			sb.append("      , b.comm_nm AS bo_category_nm                  ");
			sb.append(" FROM free_board a, comm_code b                      ");
			sb.append(" WHERE a.bo_category = b.comm_cd                     ");
			
			sb.append(" AND bo_del_yn= 'N'											");
			
			if(StringUtils.isNotEmpty(searchVO.getSearchWord())) {
				switch (searchVO.getSearchType()) {
				case "T":sb.append(" AND bo_title LIKE '%' || ? || '%' ");					break; // title
				case "W":sb.append(" AND bo_writer LIKE '%' || ? || '%' ");					break; // writer
				case "C":sb.append(" AND bo_content LIKE '%' || ? || '%' ");					break; // content

				default:			break;
				}
			}
			
			if(StringUtils.isNotEmpty(searchVO.getSearchCategory())) {
				sb.append(" AND bo_category = ? ");
				
			}
			
			
			sb.append(" ORDER BY bo_no DESC                                 ");
			
			sb.append(" ) a ) b                                             ");
			sb.append(" WHERE rnum BETWEEN ? and ?                          ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			int cnt=1;
			
			if(StringUtils.isNotEmpty(searchVO.getSearchWord())) {
				pstmt.setString(cnt++, searchVO.getSearchWord());
			}
			if(StringUtils.isNotEmpty(searchVO.getSearchCategory())) {
				pstmt.setString(cnt++, searchVO.getSearchCategory());
			}
			
			pstmt.setInt(cnt++, searchVO.getFirstRow());
			pstmt.setInt(cnt++, searchVO.getLastRow());
			
			rs = pstmt.executeQuery();
			
			
			List<FreeBoardVO> freeList = new ArrayList<FreeBoardVO>(); 
			
			while(rs.next()){
				FreeBoardVO free = new FreeBoardVO();
				free.setBoNo			 ( rs.getInt("bo_no") );
				free.setBoTitle		 ( rs.getString("bo_title") );
				free.setBoCategory	 ( rs.getString("bo_category") );
				free.setBoWriter	 ( rs.getString("bo_writer") );
				free.setBoPass		 ( rs.getString("bo_pass") );
				free.setBoContent	 ( rs.getString("bo_content") );
				free.setBoIp			 ( rs.getString("bo_ip") );
				free.setBoHit		 ( rs.getInt("bo_hit") );
				free.setBoRegDate	 ( rs.getString("bo_reg_date") );
				free.setBoModDate	 ( rs.getString("bo_mod_date") );
				free.setBoDelYn		 ( rs.getString("bo_del_yn") );
				free.setBoCategoryNm( rs.getString("bo_category_nm") );
				
				freeList.add(free);
				
			}
			
//			request.setAttribute("freeList", freeList);	jsp가 아니기 때문에 
			return freeList;
			//  위에서 select의 결과를 담은 freeList 리턴
			
		}catch(SQLException e){
			throw new DaoException("getBoardList: " +e.getMessage(), e);
			
		}finally{
			
			if(rs!=null)   {try {rs.close();} catch(Exception e){}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e){}}
			if(conn!=null) {try {conn.close();} catch(Exception e){}}
			
		}
	}

	@Override
	public FreeBoardVO getBoard(int boNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");

			StringBuffer sb = new StringBuffer();

			sb.append(" 	 SELECT                                      					");
			sb.append(" 	bo_no                                                      	");
			sb.append(" 	, bo_title , bo_category , bo_writer         	  			  	");
			sb.append(" 	, bo_pass , bo_content , bo_ip                         		");
			sb.append(" 	, bo_hit , bo_reg_date , bo_mod_date         	         		");
			sb.append(" 	, bo_del_yn                                            		");
			// code add
			sb.append(" 	, b.comm_nm AS bo_category_nm										");
			sb.append(" FROM free_board a, comm_code b                         			");
			sb.append(" WHERE a.bo_category = b.comm_cd								 		");
			sb.append(" 	 AND bo_no = ?                                     				");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				FreeBoardVO free = new FreeBoardVO();
				free.setBoNo(rs.getInt("bo_no"));
				free.setBoTitle(rs.getString("bo_title"));
				free.setBoCategory(rs.getString("bo_category"));
				free.setBoWriter(rs.getString("bo_writer"));
				free.setBoPass(rs.getString("bo_pass"));
				free.setBoContent(rs.getString("bo_content"));
				free.setBoIp(rs.getString("bo_ip"));
				free.setBoHit(rs.getInt("bo_hit"));
				free.setBoRegDate(rs.getString("bo_reg_date"));
				free.setBoModDate(rs.getString("bo_mod_date"));
				free.setBoDelYn(rs.getString("bo_del_yn"));
				free.setBoCategoryNm( rs.getString("bo_category_nm") );
				
				return free;
			}
			
			return null;

		} catch (SQLException e) {
			throw new DaoException("getBoard: "+ e.getMessage(), e);
		} finally {

			if (rs != null) {try {rs.close();} catch (Exception e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {}}
			if (conn != null) {try {conn.close();} catch (Exception e) {}}}
	}

	@Override
	public int increaseHit(int boNo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			StringBuffer sb = new StringBuffer();
			sb.append(" UPDATE free_board SET		");
			sb.append(" bo_hit = bo_hit+1			");
			sb.append(" WHERE bo_no = ?				");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boNo);
			int resultCnt = pstmt.executeUpdate();
			return resultCnt;
			
		}catch(SQLException e) {
			throw new DaoException("increaseHit: "+ e.getMessage());
		}finally {
			
			if(pstmt !=null) {try {pstmt.close();} catch(Exception e) {}}
			if(conn !=null) {try {conn.close();} catch(Exception e) {}}
		}
	}

	@Override
	public int updateBoard(FreeBoardVO freeBoard) {
		// edit에서 사용자가 수정한 내용을 DB에서도 수정되도록
		
		Connection conn = null;
		PreparedStatement pstmt = null;
	 	//RS는 업데이트에서 필요없다. (SELECT문의 결과를 담는 객체이기 때문에 필요없음 > 업데이트는 화면에 출력 안하고 나올필요도 없어서)
	 	
	 	try{
//			freeBoard.setBoIp(request.getRemoteAddr()); 		
	 		
	 		conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
	 		
	 		StringBuffer sb = new StringBuffer();
	 		
	 		// DB에서 select하는 코드
	 		// if (boPass가 맞는지 확인) 후 업데이트
	 		
	 		sb.append(" UPDATE free_board SET				");
	 		sb.append("      bo_title       = ?				");
	 		sb.append("     , bo_category   = ?				");
	 		sb.append("     , bo_content    = ?				");
	 		sb.append("     , bo_ip         = ?				");
	 		sb.append("     , bo_hit        = bo_hit+1	");
	 		sb.append("     , bo_mod_date   = sysdate		");
	 		sb.append(" WHERE bo_no         = ?				");
	 		
	 		pstmt=conn.prepareStatement(sb.toString());
	 		
	 		int cnt=1;
	 		pstmt.setString(cnt++, freeBoard.getBoTitle());
	 		pstmt.setString(cnt++, freeBoard.getBoCategory());
	 		pstmt.setString(cnt++, freeBoard.getBoContent());
	 		pstmt.setString(cnt++, freeBoard.getBoIp());
	 		pstmt.setInt(cnt++, freeBoard.getBoNo());
	 		
	 		int resultCnt= pstmt.executeUpdate();
	 		
	 		return resultCnt;
	 		
	 	}catch(SQLException e){
	 		throw new DaoException("updateBoard: " + e.getMessage());
	 	}finally{
			if (pstmt != null) {try {pstmt.close();} catch (Exception e) {}}
			if (conn != null) {try {conn.close();} catch (Exception e) {}}
	 	}
	}

	@Override
	public int deleteBoard(FreeBoardVO freeBoard) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuffer sb = new StringBuffer();
			
			sb.append(" UPDATE free_board SET				");
			sb.append("      bo_del_yn      = 'Y'			");
			sb.append(" WHERE bo_no         = ?				");
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, freeBoard.getBoNo());
			
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
	public int insertBoard(FreeBoardVO freeBoard) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			StringBuilder sb = new StringBuilder();
			sb.append(" INSERT INTO free_board (															");
			sb.append("     bo_no           , bo_title      , bo_category							");
			sb.append("     , bo_writer     , bo_pass       , bo_content 							");
			sb.append("     , bo_ip         , bo_hit        , bo_reg_date							");
			sb.append("     , bo_mod_date   , bo_del_yn													");
			sb.append(" ) VALUES (																				");
			sb.append("     SEQ_FREE_BOARD.nextval                , ?             , ?				");
			sb.append("     ,?                                    , ?             , ?				");
			sb.append("     ,?                                    , 0             , sysdate		");
			sb.append("    ,null                                 , 'N'                       )	");
			
			pstmt = conn.prepareStatement(sb.toString());
			int cnt=1;
			pstmt.setString(cnt++, freeBoard.getBoTitle());
			pstmt.setString(cnt++, freeBoard.getBoCategory());
			pstmt.setString(cnt++, freeBoard.getBoWriter());
			pstmt.setString(cnt++, freeBoard.getBoPass());
			pstmt.setString(cnt++, freeBoard.getBoContent());
			pstmt.setString(cnt++, freeBoard.getBoIp());
			
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

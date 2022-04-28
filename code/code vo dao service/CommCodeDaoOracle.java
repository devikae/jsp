package com.study.code.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.code.vo.CodeVO;
import com.study.exception.DaoException;
import com.study.free.vo.FreeBoardVO;

public class CommCodeDaoOracle implements ICommCodeDao{

	@Override
	public List<CodeVO> getCodeListByParent(String parentCode) {
		// DB가서 commCode 가지고 오는 코드 쓰면 된다.
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT												");
			sb.append("	 comm_cd, comm_nm, comm_parent, comm_ord	");
			sb.append(" FROM comm_code	 								");
			sb.append(" WHERE comm_parent = ?							");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, parentCode);
			
			rs = pstmt.executeQuery();
			
			List<CodeVO> codeList = new ArrayList<CodeVO>();
			while(rs.next()) {
				CodeVO code = new CodeVO();
				code.setCommCd( rs.getString("comm_cd") );
				code.setCommNm( rs.getString("comm_nm") );
				code.setCommParent( rs.getString("comm_parent") );
				code.setCommOrd( rs.getString("comm_ord") );
				codeList.add(code);
			
			}
			
				return codeList;
		}catch(SQLException e){
			throw new DaoException("getCodeList: " +e.getMessage(), e);
		}finally{
			if(rs!=null)   {try {rs.close();} catch(Exception e){}}
			if(pstmt!=null) {try {pstmt.close();} catch(Exception e){}}
			if(conn!=null) {try {conn.close();} catch(Exception e){}}
			
		}
	}

}

package com.study.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardSearchVO;
import com.study.free.vo.FreeBoardVO;

public class AOSimpleFreeList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//			<jsp:useBean id="searchVO" class="com.study.free.vo.FreeBoardSearchVO"></jsp:useBean>
//			<jsp:setProperty property="*" name="searchVO"/>
			// 파라미터로 넘어온 것들을 FreeBoardSearchVO세팅해줌 
		
			FreeBoardSearchVO searchVO = new FreeBoardSearchVO();
//			searchVO.setSearchType(req.getParameter("searchType"));
//			searchVO.setCurPage(Integer.parseInt(req.getParameter("searchType")));
			
			try {
				// 위의 jsp:useBean, setProperty의 역할을 해주는 >> 파라미터들을 세팅하기 위한 메소드
				BeanUtils.populate(searchVO, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				System.out.println("왜 안되누");
				e.printStackTrace();
			}
			
			
		
			IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
			List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(searchVO);
			req.setAttribute("freeBoardList", freeBoardList);

			ICommCodeService codeService = new CommCodeServiceImpl();
			List<CodeVO> cateList = codeService.getCodeListByParent("BC00");
			req.setAttribute("cateList", cateList);
			
			req.setAttribute("searchVO", searchVO); // el로 사용해야하기 때문에 
		
		String view = "/WEB-INF/views/free/freeList.jsp";
		RequestDispatcher rd= req.getRequestDispatcher(view);
		rd.forward(req, resp);
		// 브라우저가 .wow로 요청 >> 서버에서 AOSimpleFreeList가 요청을 받아 rd.forward > jsp
		
	}
}

package com.study.free.web;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.code.service.CommCodeServiceImpl;
import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.free.service.FreeBoardServiceImpl;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardSearchVO;
import com.study.free.vo.FreeBoardVO;

@Controller
public class FreeBoardController {
	@Inject
	IFreeBoardService freeBoardService;
	@Inject 
	ICommCodeService codeService;
	
	// edit, form, list에는 cateList가 공통으로 model에 담긴다. >> 공통처리 
	// view에서 cateList는 el로 사용 안하니까 담는건 상관 없음 
	@ModelAttribute("cateList")
	public List<CodeVO> cateList(){
		return codeService.getCodeListByParent("BC00");
	}
	
	@RequestMapping(value="/free/freeList.wow")
	public String freeBoardList(Model model,@ModelAttribute("SearchVO")FreeBoardSearchVO searchVO) {
//		FreeBoardSearchVO searchVO=new FreeBoardSearchVO();
//		try {
//			BeanUtils.populate(searchVO, req.getParameterMap());
//		} catch (IllegalAccessException | InvocationTargetException e) {
//			System.out.println("파라미터가 세팅이 안되네...");
//			e.printStackTrace();
//		} 
//		req.setAttribute("searchVO", searchVO);
		// setAttribute"searchVO"를 안해줘도 된다 위 매개변수에서 ModelAttribute를 해주기 때문에
		
		List<FreeBoardVO> freeBoardList = freeBoardService.getBoardList(searchVO);
//		req.setAttribute("freeBoardList", freeBoardList);
		// 55번 처럼 model.add
		model.addAttribute("freeBoardList",freeBoardList);
		
//		List<CodeVO> cateList=codeService.getCodeListByParent("BC00");
//		req.setAttribute("cateList", cateList);
//		model.addAttribute("cateList", cateList);
		// 위에 공통으로 담기도록 만들어줬으므로 모두 지움 
		
		return "free/freeList";
	}
	
	@RequestMapping("/free/freeView.wow")
	public String freeBoardView(Model model,@RequestParam(required = true, name = "boNo") int boNo) {
		// RequestParam(required = false) false라면 매개변수가 있어도되고 없어도 될때 이용
		// name은 잘 안사용한다
		
//		int boNo=Integer.parseInt(req.getParameter("boNo"));
		// 매개변수에 변수이름만 같게 하면 spring이 처리 해줌 
		
//		IFreeBoardService freeBoardService=new FreeBoardServiceImpl();
		// 의존주입으로 받았기 때문에 객체생성 X 
		
		try{
			FreeBoardVO freeBoard=freeBoardService.getBoard(boNo);
//			req.setAttribute("freeBoard", freeBoard);
			// 모델로 Attribute
			model.addAttribute("freeBoard", freeBoard);
			freeBoardService.increaseHit(boNo);
			
		}catch (BizNotFoundException enf){
			ResultMessageVO resultMessageVO= new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글Notfound", "해당 글이 없습니다",
					"/free/freeList.wow", "목록으로");
//			req.setAttribute("resultMessageVO", resultMessageVO);
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}catch (BizNotEffectedException ene){
			ResultMessageVO resultMessageVO= new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글NotEffected", "업데이트에 실패했습니다",
					"/free/freeList.wow", "목록으로");
//			req.setAttribute("resultMessageVO", resultMessageVO);
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "free/freeView";
	}
	
	@RequestMapping("/free/freeEdit2.wow")
	public ModelAndView freeBoardEdit(int boNo) {
		ModelAndView mav = new ModelAndView();
		
		try{
			FreeBoardVO freeBoard=freeBoardService.getBoard(boNo);
//			req.setAttribute("freeBoard", freeBoard);
			// ModelAndView는 model.addAtt 하지 않는다 
			mav.addObject("freeBoard", freeBoard);
		}catch (BizNotFoundException enf){
			ResultMessageVO resultMessageVO= new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글Notfound", "해당 글이 없습니다",
					"/free/freeList.wow", "목록으로");
//			req.setAttribute("resultMessageVO", resultMessageVO);
			mav.addObject("resultMessageVO", resultMessageVO);
			// view 이름을 String으로 해서 리턴 했다면 mav에선 view이름을 mav객체에 넣어서 이용 
			mav.setViewName("common/message");
		}
		
//		ICommCodeService codeService=new CommCodeServiceImpl();
		// 주입받아서 직접생성X
		
//		return "free/freeEdit";
		// 위와 마찬가지 
		mav.setViewName("free/freeEdit");
		
		return mav;
	
	}
	
	
	@RequestMapping("/free/freeEdit.wow")
	public String freeBoardEdit(Model model, int boNo) {
		try{
			FreeBoardVO freeBoard=freeBoardService.getBoard(boNo);
//			req.setAttribute("freeBoard", freeBoard);
			model.addAttribute("freeBoard", freeBoard);
		}catch (BizNotFoundException enf){
			ResultMessageVO resultMessageVO= new ResultMessageVO();
			resultMessageVO.messageSetting(false, "글Notfound", "해당 글이 없습니다",
					"/free/freeList.wow", "목록으로");
			model.addAttribute("resultMessageVO", resultMessageVO);
			return "common/message";
		}
		return "free/freeEdit";
	}
	
	@RequestMapping(value = "/free/freeModify.wow", method = RequestMethod.POST)
	// 이렇게 method를 POST로 지정해줘도 되지만 보통 @PostMapping를 더 많이 사용한다.
	public String freeBoardModify(Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
		
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		
		try {
			freeBoardService.modifyBoard(freeBoard);
			resultMessageVO.messageSetting(true, "수정", "수정성공"
				,"/free/freeList.wow" , "목록으로");
		} catch (BizNotFoundException enf) {
			resultMessageVO.messageSetting(false, "글Notfound", "해당 글이 없습니다",
					"/free/freeList.wow", "목록으로");
		} catch (BizPasswordNotMatchedException epm) {
			resultMessageVO.messageSetting(false, "비밀번호틀림", "글쓸때의 비밀번호랑 다릅니다",
					"/free/freeList.wow", "목록으로");
		} catch (BizNotEffectedException ene) {
			resultMessageVO.messageSetting(false, "글NotEffected", "업데이트에 실패했습니다",
					"/free/freeList.wow", "목록으로");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	@PostMapping("/free/freeDelete.wow")
	public String freeBoardDelete(Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard ) {
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		try {
			freeBoardService.removeBoard(freeBoard);
			resultMessageVO.messageSetting(true, "삭제", "삭제성공"
					,"/free/freeList.wow" , "목록으로");
		}catch (BizNotFoundException enf) {
			resultMessageVO.messageSetting(false, "글Notfound", "해당 글이 없습니다",
					"/free/freeList.wow", "목록으로");
		} catch (BizPasswordNotMatchedException epm) {
			resultMessageVO.messageSetting(false, "비밀번호틀림", "글쓸때의 비밀번호랑 다릅니다",
					"/free/freeList.wow", "목록으로");
		} catch (BizNotEffectedException ene) {
			resultMessageVO.messageSetting(false, "글NotEffected", "업데이트에 실패했습니다",
					"/free/freeList.wow", "목록으로");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
	@RequestMapping("/free/freeForm.wow")
	public String freeBoardForm(Model model) {
		return "free/freeForm";
	}
	
	@PostMapping("/free/freeRegist.wow")
	public String freeBoardRegist(Model model,@ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
		ResultMessageVO resultMessageVO=new ResultMessageVO();
		try {
			freeBoardService.registBoard(freeBoard);
			resultMessageVO.messageSetting(true, "등록", "등록성공", "free/freeList.wow"
					 ,"목록으로");
		} catch (BizNotEffectedException ebe) {
			resultMessageVO.messageSetting(false, "실패", "업데이트실패", "free/freeList.wow"
					 ,"목록으로");
		}
		model.addAttribute("resultMessageVO", resultMessageVO);
		return "common/message";
	}
	
}

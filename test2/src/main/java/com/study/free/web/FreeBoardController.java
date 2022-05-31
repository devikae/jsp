package com.study.free.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;

@Controller
public class FreeBoardController {
	@Inject
	IFreeBoardDao freeBoardDao;
	
	@RequestMapping("/free/freeList.wow")
	public String freeList(Model model) {
		List<FreeBoardVO> freeBoardList =freeBoardDao.getFreeBoardList();
//		System.out.println(freeList);
		model.addAttribute("freeBoardList", freeBoardList);
		return "free/freeList";
	}
	
}

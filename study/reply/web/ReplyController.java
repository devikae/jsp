package com.study.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.exception.BizAccessFailException;
import com.study.exception.BizNotFoundException;
import com.study.reply.service.IReplyService;
import com.study.reply.vo.ReplySearchVO;
import com.study.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	@Inject
	IReplyService replyService;
	
	// 내가 보내는 data를 받는쪽에선 json으로 해석 하라는 명령
	@ResponseBody
	@RequestMapping(value = "/reply/replyList.wow", produces = "application/json; charset=utf-8")
	public List<ReplyVO> replyList(ReplySearchVO searchVO){
		// 서버가 아닌 일반 사용자의 브라우저는 ReplyVO 가 뭔지 모르기 때문에 Json으로 파싱해서(spring) 보내야함 
		List<ReplyVO> replyList = replyService.getReplyListByParent(searchVO);
		return replyList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/replyRegist.wow",  produces = "application/json; charset=utf-8")
	public Map<String, Object> replyRegist(ReplyVO reply){
		// String 이나 int로 해도 된다 select문은 형태에 맞춰줘야 한다.
		// Map의 사용 이유는 json으로 이용 해보기 위해 
		replyService.registReply(reply);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", "DB 등록 완료");
		map.put("success", true);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply/replyModify.wow", produces = "application/json; charset=utf-8")
	public Map<String,Object> replyModify(ReplyVO reply) throws BizNotFoundException, BizAccessFailException{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
//		try {
			replyService.modifyReply(reply); 
			System.out.println("수정 완료");
			// try catch 보다 ajax의 error 함수에서 처리해주는게 좋다 
//			map.put("data", "수정 완료.");
//			map.put("success", true);
//		} catch(BizNotFoundException BNF) {
//			System.out.println("BNF 대상없음");
//			map.put("data", "대상 찾지 못함.");
//			map.put("error", false);
//		} catch(BizAccessFailException BAF) {
//			System.out.println("로그인 안함 잘못된 접근");
//			map.put("data", "잘못된 접근.");
//			map.put("error", false);
//		}
		return map;
	}
	

	@ResponseBody
	@RequestMapping(value = "/reply/replyDelete.wow", produces = "application/json; charset=utf-8")
	public Map<String, Object> replyDelete(ReplyVO reply) throws BizNotFoundException, BizAccessFailException{
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			replyService.removeReply(reply); 
			System.out.println("삭제 완료");
			map.put("data", "삭제 완료.");
			map.put("success", true);
		} catch(BizNotFoundException BNF) {
			System.out.println("BNF ");
			map.put("data", "대상 찾지 못함.");
			map.put("error", false);
		} catch(BizAccessFailException BAF) {
			System.out.println("잘못된 접근");
			map.put("data", "잘못된 접근.");
			map.put("error", false);
		}
		
		return map;
	}
	
}

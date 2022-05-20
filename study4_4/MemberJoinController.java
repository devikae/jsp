package com.study.member.web;

import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.study.code.service.ICommCodeService;
import com.study.code.vo.CodeVO;
import com.study.common.valid.Step1;
import com.study.common.valid.Step2;
import com.study.common.valid.Step3;
import com.study.common.vo.ResultMessageVO;
import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.member.service.IMemberService;
import com.study.member.service.MailSendService;
import com.study.member.vo.MemberVO;


@SessionAttributes("member")
// 1~3 step을 다 거쳐도 regist할 때 데이터가 넘어가지 않기때문에 넘겨주기 위해 사용 
// model에 담긴 member의 값을 유지시켜주는 용도 해당 controller내에서만 값이 유지됨

@Controller
public class MemberJoinController {
	
	// step1~3 까지 데이터 검증 필요 
	
//	VO > step > controller
	@Inject
	ICommCodeService codeService;
	@Inject
	IMemberService memberService;
	
	
	// step1이 실행되기 전에 먼저 실행 
	@ModelAttribute("member")
	public MemberVO member() {
		return new MemberVO();
	}
	
	@ModelAttribute("jobList")
	public List<CodeVO> jobList(){
		return codeService.getCodeListByParent("JB00");
	}
	
	@ModelAttribute("hobbyList")
	public List<CodeVO> hobbyList(){
		return codeService.getCodeListByParent("HB00");
	}
	
	@RequestMapping("/join/step1.wow")
	public String step1(@ModelAttribute("member") MemberVO member) {
		return "join/step1";
	}
	
	// step1의 내용을 step2에서 검사 
	@RequestMapping("/join/step2.wow")
	public String step2(Model model,@Validated(value = {Step1.class})@ModelAttribute("member") MemberVO member, BindingResult error) {
		
		if(error.hasErrors()) {
			return "join/step1";
			// 문제가 있으면 다시 step1로
		}
		model.addAttribute("canEl", "YesWeCan");
		return "join/step2";
	}
	
	// step2의 내용을 step3에서 검사 
	@RequestMapping("/join/step3.wow")
	public String step3(@Validated(value = {Step2.class})@ModelAttribute("member") MemberVO member, BindingResult error) {
		
		if(error.hasErrors()) {
			return "join/step2";
			// 검사 후 문제가 있다면 step2로
		}
		
		return "join/step3";
	}
	
	// step3에서는 다음은 regist로
	@RequestMapping("/join/regist.wow")
	public String regist(Model model,@Validated(value= {Step3.class})@ModelAttribute("member") MemberVO member, BindingResult error, SessionStatus status) {
		if(error.hasErrors()) {
			return "join/step3";
		}
		System.out.println(member);
		// member DB에 insert하면됨
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		
		status.setComplete();
		// SessionAttr에 저장되어 있던 내용을 클리어 시킴 > 실패했을때 다시 입력하도록
		
		try {
			memberService.registMember(member);
			resultMessageVO.messageSetting(true, "회원 등록 성공", "회원을 등록했습니다.", "/member/memberList.wow", "목록으로");
		} catch (BizNotEffectedException ene) {
			resultMessageVO.messageSetting(false, "회원 등록 실패", "회원을 등록하는데 실패했습니다.", "/member/memberList.wow", "목록으로");
		} catch (BizDuplicateKeyException ede) {
			resultMessageVO.messageSetting(false, "회원중복아이디", "회원아이디가 이미 존재합니다.", "/member/memberList.wow", "목록으로");
		}
		model.addAttribute("resultMessageVO",resultMessageVO);
		return "common/message";
	}
	
	// 취소 했을 때
	@RequestMapping("join/cancel.wow")
	public String cancel(SessionStatus status) {
		
		status.setComplete(); // 취소
		return "redirect:/";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/idCheck.wow", produces = "text/plain; charset=utf-8")
	public String idCheck(String memId) {
		try {
			memberService.getMember(memId);
			return "불가능";
		}catch (BizNotFoundException e) {
			return "사용가능";
		}
	}
	
		
		
//		return memId+"여기까지 왔음";
		
		
//		return "cow"; 
		// return 값이 그대로 전달 된다. 
		// @ResponseBody를 붙여서 응답의 body가 이 메소드로 
		//     " 어노테이션을 붙이지 않으면 응답의 body에  위 메소드들, html
		// produces = "text/plain" 적으면 텍스트로 보여줌
		
		@Inject
		MailSendService mailService; 
		// 메일서비스 객체 인젝트
	
		@ResponseBody
		@RequestMapping("/join/mailAuth.wow")
		public String mailAuth(String mail) throws MessagingException {
			// controller의 역할 요청을 처리할 서비스 선택, 예외처리  > 그래서 여기서 메일을 보내는게 아니고 서비스에서 만들것 
			
			String authKey = mailService.sendAuthMail(mail);
			
			
			return authKey;
		}
		
	
	
	
	
	
}


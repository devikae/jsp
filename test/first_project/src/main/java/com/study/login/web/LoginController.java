package com.study.login.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.login.dao.ILoginDao;
import com.study.user.vo.UserVO;

@Controller
public class LoginController {
	@Inject
	ILoginDao loginDao;
	
	@RequestMapping("/login/isLogin.wow")
	public String isLogin() {
		return "login/isLogin";
	}
	
	@GetMapping("/login/login.wow")
	public String loginGet() {
		return "login/login";
	}
	
	@PostMapping("/login/login.wow")
	public String loginPost(String id, String pw, HttpSession session) {
		//id, pw는 사용자가 입력한 id와 pw
		UserVO user=loginDao.getUser(id);
		if(user==null) return "redirect:/login/login.wow";
		else { //id는 맞음
			if(!user.getUser_pass().equals(pw)) { //비밀번호는 틀림
				 return "redirect:/login/login.wow";
			}else { //비밀번호도 맞음
				session.setAttribute("user", user);
				return "redirect:/login/isLogin.wow";
			}
		}
	}
	
	@RequestMapping("/login/logout.wow")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/login/isLogin.wow";
	}
	
	
	@RequestMapping("/login/userForm.wow")
	public String userForm() {
		return "login/userForm";
	}
	
	@RequestMapping("/login/userRegist.wow")
	public String userRegist(UserVO user) {
		loginDao.insertUser(user);
		return "redirect:/login/isLogin.wow";
	}
	
	
	
	
	
	
	
}

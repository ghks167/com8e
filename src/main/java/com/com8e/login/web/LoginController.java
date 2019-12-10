package com.com8e.login.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.member.service.IMemberService;
import com.com8e.member.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private IMemberService memberService; 
	
	
	@RequestMapping(value = "login/loginForm")
	public String loginForm(@ModelAttribute("member")MemberVO vo, BindingResult errors) {
		return "login/loginForm";
	}
	
	@RequestMapping(value = "login/logincheck")
	public String loginCheck(HttpSession session ,@ModelAttribute("member")MemberVO vo, BindingResult errors) throws Exception{
		
		MemberVO vo2 = memberService.selectMember(vo.getMem_id());
		if(vo2 != null) {
			if(vo.getMem_pass().equals(vo2.getMem_pass())) {
				session.setAttribute("LOGIN_INFO", vo2.getMem_id());
				return "index";
			}		
		}
		
		
		return "login/loginForm";
		
	}
	
	@RequestMapping(value = "login/loginout")
	public String loginout(HttpSession session) {
		session.removeAttribute("LOGIN_INFO");
		
		return "index";
	}
	
}

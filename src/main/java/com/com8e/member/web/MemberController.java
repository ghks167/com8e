package com.com8e.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.member.vo.MemberVO;

@Controller
public class MemberController {
	
	
	@RequestMapping(value = "member/memberForm")
	public String memberForm(@ModelAttribute("member") MemberVO member) {
		return "member/memberForm";
	}
	
	@RequestMapping(value = "member/memberRegist")
	public String memberRegist(@ModelAttribute("member") @Validated MemberVO vo, BindingResult error) {
		
		
		
		return "member/memberRegist";
	}
	
}

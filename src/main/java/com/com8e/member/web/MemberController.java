package com.com8e.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.member.service.IMemberService;
import com.com8e.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	IMemberService memberService;
	
	@RequestMapping(value = "member/memberForm")
	public String memberForm(@ModelAttribute("member") MemberVO member) {
		return "member/memberForm";
	}
	
	@RequestMapping(value = "member/memberRegist")
	public String memberRegist(@ModelAttribute("member") @Validated MemberVO vo, BindingResult error) throws Exception{
		
		
		
		memberService.insertMember(vo);
		
		
		return "member/memberRegist";
	}
	
}

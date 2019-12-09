package com.com8e.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.common.vo.ResultMessageVO;
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
	public String memberRegist(Model model,@ModelAttribute("member") @Validated MemberVO vo, BindingResult error) throws Exception{
			
		
		try {
			int succ = memberService.insertMember(vo);
			
			ResultMessageVO messageVO = new ResultMessageVO();
			
			messageVO.setResult(true).setMessage("회원가입되었습니다.").setTitle("회원가입성공").setUrlTitle("회원정보보기").setUrlTitle("#");
			model.addAttribute("resultMessage", messageVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			ResultMessageVO messageVO = new ResultMessageVO();
			messageVO.setResult(false).setMessage("회원가입에 실패하였습니다.").setTitle("회원가입실패").setUrlTitle("..").setUrlTitle("#");
			model.addAttribute("resultMessage", messageVO);
		}
		
		
		return "common/message";
	}
	
}

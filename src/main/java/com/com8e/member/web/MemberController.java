package com.com8e.member.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			
			messageVO.setResult(true).setMessage("회원가입되었습니다.").setTitle("회원가입성공").setUrlTitle("회원정보보기").setUrl("#");
			model.addAttribute("resultMessage", messageVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			ResultMessageVO messageVO = new ResultMessageVO();
			messageVO.setResult(false).setMessage("회원가입에 실패하였습니다.").setTitle("회원가입실패").setUrlTitle("..").setUrl("#");
			model.addAttribute("resultMessage", messageVO);
		}
		
		
		return "common/message";
	}
	
	@RequestMapping(value = "member/memberView")
	public String memberView(HttpSession session, Model model) throws Exception{
		
		if(session.getAttribute("LOGIN_INFO") == null) {
			return "login/loginForm";
		}
		
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		MemberVO vo = memberService.selectMember(mem_id);
		model.addAttribute("member", vo);
		
		
		
		
		return "member/memberView";
	}
	
	@RequestMapping(value = "member/memberView", method = RequestMethod.POST)
	public String memberEdit(@ModelAttribute("member") MemberVO vo, Model model) throws Exception{
		
		int cnt = memberService.updateMember(vo);
		ResultMessageVO messageVO = new ResultMessageVO();
		if(cnt > 0) {
			messageVO.setResult(true).setMessage("수정이완료되었습니다.").setTitle("수정성공").setUrlTitle("회원정보보기").setUrl("member/memberView");
			model.addAttribute("resultMessage", messageVO);
		}else {
			messageVO.setResult(false).setMessage("수정에 실패하였습니다.").setTitle("수정실패").setUrlTitle("회원정보보기").setUrl("member/memberView");
			model.addAttribute("resultMessage", messageVO);
		}
		
		
		return "common/message";
	}
	
	
	@RequestMapping(value = "/member/overlapcheck" ,method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> overlapCheck(String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO vo = memberService.selectMember(id);
		
		if(vo == null) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	
	
	
}

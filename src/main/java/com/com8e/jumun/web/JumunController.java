package com.com8e.jumun.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.jumun.service.IJumunService;
import com.com8e.jumun.vo.JumunListVO;
import com.com8e.jumun.vo.JumunVO;
import com.com8e.member.service.IMemberService;
import com.com8e.member.vo.MemberVO;

@Controller
public class JumunController {
	
	@Autowired
	private IJumunService jumunService;
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value = "/jumun/jumunRegist")
	public String jumun(Model model, int[] cart_prod, HttpSession session) throws Exception{
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("prods", cart_prod);
	
		List<JumunListVO> list = jumunService.selectJumunListByCart(map);
		MemberVO memvo = memberService.selectMember(mem_id);
		
		
		model.addAttribute("memVO", memvo);
		model.addAttribute("jumun_list", list);
		
		return "jumun/jumunRegistForm";
	}
	
	@RequestMapping(value = "/jumun/jumunProcess")
	public String jumunProcess(JumunVO vo) throws Exception{
		jumunService.insertJumun(vo);
		
		
		
		return "jumun/jumunProcess";
	}
	
}

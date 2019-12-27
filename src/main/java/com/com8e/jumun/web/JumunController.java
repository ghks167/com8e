package com.com8e.jumun.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.common.vo.ResultMessageVO;
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
	public String jumun(Model model, int[] cart_no, HttpSession session) throws Exception{
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("carts", cart_no);
	
		List<JumunListVO> list = jumunService.selectJumunListByCart(map);
		MemberVO memvo = memberService.selectMember(mem_id);
		
		
		model.addAttribute("memVO", memvo);
		model.addAttribute("jumun_list", list);
		
		return "jumun/jumunRegistForm";
	}
	
	@RequestMapping(value = "/jumun/jumunProcess")
	public String jumunProcess(JumunVO vo,Model model) throws Exception{
		int i = jumunService.insertJumun(vo);
		ResultMessageVO messageVO = new ResultMessageVO();			
		if(i > 0) {
			messageVO.setResult(true)
					   .setTitle("주문완료")
					   .setMessage("주문이 완료되었습니다.")
					   .setUrlTitle("주문정보확인")
					   .setUrl("#");
		}else {
			messageVO.setResult(false)
			   .setTitle("주문실패")
			   .setMessage("주문에 실패하였습니다.");
		}
		
		model.addAttribute("resultMessage",messageVO);
		return "common/message";
	}
	
}

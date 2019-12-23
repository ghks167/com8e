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

@Controller
public class JumunController {
	
	@Autowired
	private IJumunService jumunService;
	
	@RequestMapping(value = "/jumun/jumunRegist")
	public String xxx(Model model, int[] cart_prod, HttpSession session) {
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("prods", cart_prod);
	
		List<JumunListVO> list = jumunService.selectJumunListByCart(map);
		
		model.addAttribute("jumun_list", list);
		
		return "jumun/jumunRegistForm";
	}
}

package com.com8e.common.web;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com8e.cart.service.ICartService;
import com.com8e.cart.vo.CartVO;

@Controller
public class sideController {
	
	@Autowired
	ICartService cartService;
	
	@RequestMapping(value = "common/common_side")
	@ResponseBody
	public List<CartVO> commonSide(HttpSession session, Model model) throws Exception{ // String을 List로 
		
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		
		model.addAttribute("mem_id",mem_id);
		
		List<CartVO> list = null;
		
		if(mem_id!=null) {
		list = cartService.selectCartList(mem_id);
		model.addAttribute("cart_list",list);
		}
		
		return list;
		
		
		
	}
}
	



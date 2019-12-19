package com.com8e.cart.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.cart.service.ICartService;
import com.com8e.cart.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	ICartService cartService;
	
	@RequestMapping("cart/cartList")
	public String cartList(HttpSession session, Model model) throws Exception{
		
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		System.out.println(mem_id);
		if(mem_id == null) {
			return "redirect:/login/loginForm";
		}
		
		List<CartVO> list = cartService.selectCartList(mem_id);
		
		model.addAttribute("cart_list",list);
		
		return "cart/cartList";
	}
}

package com.com8e.cart.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com8e.cart.service.ICartService;
import com.com8e.cart.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	ICartService cartService;
	
	@RequestMapping(value = "cart/cartList")
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
	
	@RequestMapping(value = "cart/cartAdd")
	@ResponseBody
	public Map<String, Object> cartInsert(CartVO vo, HttpSession session) throws Exception{
		HashMap<String, Object> map = new HashMap<>();
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		vo.setCart_mem(mem_id);
		int i = cartService.insertCart(vo);
		if(i > 0) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	
	@RequestMapping(value = "cart/cartQtyChange")
	@ResponseBody
	public void cartQtyChage(CartVO vo) throws Exception{
		
		cartService.updateCartQty(vo);
	}
	
	@RequestMapping(value = "cart/cartJumun")
	public String cartJumun(int[] cart_no) {
		
		
		
		return "cart/cartJumun";
	}
	
	@RequestMapping(value = "cart/cartDelete")
	@ResponseBody
	public Map<String, Object> cartDelete(@RequestParam(value = "cart_no[]")List<Integer> cart_no) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		
		for(int i : cart_no) {
			System.out.println(i);
		}
		
		int i = cartService.deleteCart(cart_no);
		if(i > 0) {
			map.put("result", true);
		}
			
		return map;
	}
	
	
}

package com.com8e.cart.service;

import java.util.List;

import com.com8e.cart.vo.CartVO;


public interface ICartService {
	public List<CartVO> selectCartList(String cart_mem) throws Exception;
	
	public int insertCart(CartVO vo) throws Exception;
}

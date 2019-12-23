package com.com8e.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.cart.vo.CartVO;

@Mapper
public interface ICartDao {
	
	public List<CartVO> selectCartList(String cart_mem) throws Exception;
	
	public int insertCart(CartVO vo) throws Exception;
	
	public int updateCartQty(CartVO vo)throws Exception;
	
	public CartVO selectCart(int cart_no)throws Exception;
	
}

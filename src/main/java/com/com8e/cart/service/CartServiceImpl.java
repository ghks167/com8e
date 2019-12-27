package com.com8e.cart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.cart.dao.ICartDao;
import com.com8e.cart.vo.CartVO;
import com.com8e.image.dao.IImageDao;
import com.com8e.prod.dao.IProdDao;

@Service
public class CartServiceImpl implements ICartService{
	
	@Autowired
	ICartDao cartDao;
	@Autowired
	IImageDao imageDao;
	@Autowired
	IProdDao prodDao;
	
	
	@Override
	public List<CartVO> selectCartList(String cart_mem) throws Exception {
		// TODO Auto-generated method stub
		List<CartVO> list = cartDao.selectCartList(cart_mem);
		for(CartVO vo : list) {
			vo.setProd(prodDao.selectProd(vo.getCart_prod()));
			vo.setMain_image_name(imageDao.selectImage(vo.getCart_prod(),"PROD_M").getImage_file_name());
		}
		
		return list;
	}


	@Override
	public int insertCart(CartVO vo) throws Exception {
		// TODO Auto-generated method stub
		int i = cartDao.insertCart(vo);
		return i;
	}


	@Override
	public int updateCartQty(CartVO vo) throws Exception {
		// TODO Auto-generated method stub
		return cartDao.updateCartQty(vo);
	}


	@Override
	public List<CartVO> selectCart(int[] cart_no) throws Exception {
		ArrayList<CartVO> list = new ArrayList<>();	
		
		
		
		return list;
	}


	@Override
	public int deleteCart(List<Integer> list) throws Exception {
		
		return cartDao.deleteCart(list);
	}
	
}

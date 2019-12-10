package com.com8e.prod.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;

@Mapper
public interface IProdService {
	
	
	/** 상품 리스트 조회하기*/
	public List<ProdVO> selectProdList(ProdSearchVO searchVO) throws Exception;
	
	/** 선택 상품 조회하기*/
	public ProdVO selectProd(String prod_id) throws Exception;
	
	/** 상품 추가하기*/
	public int insertProd(ProdVO prod) throws Exception;
	
	/** 상품 수정하기*/
	public int updateProd(ProdVO prod) throws Exception;
	
	/** 상품 삭제하기*/
	public int deleteProd(ProdVO prod) throws Exception;
	
	/** 주문완료시 상품수량 감소*/
	public void decreaseQty(String prod_id)throws Exception;
	

}
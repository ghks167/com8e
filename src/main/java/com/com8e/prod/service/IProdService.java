package com.com8e.prod.service;

import java.util.List;

import com.com8e.board.vo.BoardVO;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;

public interface IProdService {
	
	
	/** 상품 리스트 조회하기*/
	public List<ProdVO> selectProdList(ProdSearchVO searchVO) throws Exception;
	
	/** 선택 상품 조회하기*/
	public ProdVO selectProd(int prod_no) throws Exception;
	
	/** 상품 추가하기*/
	public int insertProd(ProdVO prod) throws Exception;
	
	/** 상품 수정하기*/
	public int updateProd(ProdVO prod) throws Exception;
	
	/** 상품 삭제하기*/
	public int deleteProd(ProdVO prod) throws Exception;
	
	/** 주문완료시 상품수량 감소*/
	public void decreaseQty(int prod_no)throws Exception;
	
	/** 상품분류 조회 */
	public List<ProdVO> selectProdType() throws Exception;
	
	public ProdVO selectProdName(String prod_name) throws Exception;

	/** 메인화면 상품 타입별로 3개씩 보여주기*/
	public List<ProdVO> selectMainThreeList(ProdSearchVO searchVO) throws Exception;

	public List<ProdVO> selectProdLikeName(String keyword) throws Exception;

}

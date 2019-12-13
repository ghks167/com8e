package com.com8e.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;

@Mapper
public interface IProdDao {
	
	
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
	public void decreaseQty(String prod_id)throws Exception;
	
	/** 상품분류 조회 */
	public List<ProdVO> selectProdType() throws Exception;
	
	/** 이름으로 조회 */
	public ProdVO selectProdName(String prod_name) throws Exception;
	
	/** 데이터 카운터 **/
	public int selectProdCount(ProdSearchVO searchVO) throws Exception;
	
}

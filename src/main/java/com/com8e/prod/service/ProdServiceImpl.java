package com.com8e.prod.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.prod.dao.IProdDao;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;

@Service
public class ProdServiceImpl implements IProdService {

	@Autowired
	private IProdDao prodDao;
	
	@Override
	public List<ProdVO> selectProdList(ProdSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProdVO selectProd(int prod_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertProd(ProdVO prod) throws Exception {
		int cnt = prodDao.insertProd(prod);
		return cnt;
	}

	@Override
	public int updateProd(ProdVO prod) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProd(ProdVO prod) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void decreaseQty(int prod_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ProdVO> selectProdType() throws Exception {
		
		return prodDao.selectProdType();
	}
	
	

}

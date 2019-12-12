package com.com8e.prod.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.image.dao.IImageDao;
import com.com8e.image.vo.ImageVO;
import com.com8e.prod.dao.IProdDao;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;

@Service
public class ProdServiceImpl implements IProdService {

	@Autowired
	private IProdDao prodDao;
	
	@Autowired
	private IImageDao imageDao;
	
	@Override
	public List<ProdVO> selectProdList(ProdSearchVO searchVO) throws Exception {
		List<ProdVO> list = prodDao.selectProdList(searchVO);
		return list;
	}

	@Override
	public ProdVO selectProd(int prod_no) throws Exception {
		ProdVO vo = prodDao.selectProd(prod_no);
		return vo;
	}

	@Override
	public int insertProd(ProdVO prod) throws Exception {
		int cnt = prodDao.insertProd(prod);
		ProdVO pp = prodDao.selectProdName(prod.getProd_name());
		
		if(prod.getList() != null) {
			List<ImageVO> list = prod.getList();
			for(ImageVO vo : list) {
				vo.setImage_parent_no(pp.getProd_no());
				imageDao.insertImage(vo);
			}
		}
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

	@Override
	public ProdVO selectProdName(String prod_name) throws Exception {
		// TODO Auto-generated method stub
		
		
		return prodDao.selectProdName(prod_name);
	}
	
	

}

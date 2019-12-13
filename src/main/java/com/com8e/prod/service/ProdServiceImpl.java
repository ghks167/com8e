package com.com8e.prod.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Override
	public List<ProdVO> selectProdList(ProdSearchVO searchVO) throws Exception {
		
		int count = prodDao.selectProdCount(searchVO);
		searchVO.setTotalRowCount(count);
		searchVO.pageSetting();
		
		List<ProdVO> list = prodDao.selectProdList(searchVO);
		for(ProdVO vo : list) {
			
			ImageVO image = imageDao.selectImage(vo.getProd_no(), "PROD_M");
			if(image != null) {
				Map<String, ImageVO> map = new HashMap<>();
				map.put("PROD_M",image);
				vo.setMap(map);
			}	
		}
		
		return list;
	}

	@Override
	public ProdVO selectProd(int prod_no) throws Exception {
		ProdVO vo = prodDao.selectProd(prod_no);
		Map<String, ImageVO> map = new HashMap<>();
		ImageVO mainImage = imageDao.selectImage(prod_no, "PROD_M");
		ImageVO infoImage = imageDao.selectImage(prod_no, "PROD_I");
		if(mainImage != null) {
			map.put("PROD_M", mainImage);
		}
		if (infoImage != null) {
			map.put("PROD_I", infoImage);
		}
		vo.setMap(map);
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

package com.com8e.jumun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.jumun.dao.IJumunDao;
import com.com8e.jumun.dao.IJumunListDao;
import com.com8e.jumun.vo.JumunListVO;


@Service
public class JumunServiceImpl implements IJumunService{
	
	
	@Autowired
	private IJumunDao jumunDao;
	
	@Autowired
	private IJumunListDao jumunListDao;
	

	@Override
	public List<JumunListVO> selectJumunListByCart(Map<String, Object> map) {
		
		return jumunListDao.selectJumunListByCart(map);
	}

}

package com.com8e.jumun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.jumun.dao.IJumunDao;
import com.com8e.jumun.dao.IJumunListDao;
import com.com8e.jumun.vo.JumunListVO;
import com.com8e.jumun.vo.JumunVO;


@Service
public class JumunServiceImpl implements IJumunService{
	
	
	@Autowired
	private IJumunDao jumunDao;
	
	@Autowired
	private IJumunListDao jumunListDao;
	

	@Override
	public List<JumunListVO> selectJumunListByCart(Map<String, Object> map) throws Exception{
		
		return jumunListDao.selectJumunListByCart(map);
	}


	@Override
	public int insertJumun(JumunVO vo) throws Exception {
		// TODO Auto-generated method stub
		int i = 0;
				
		i += jumunDao.insertJumun(vo);
		
		List<JumunListVO> items = vo.getItems();
		for(JumunListVO listvo : items) {
			i += jumunListDao.insertJumunList(listvo);
		}
		
		
		return i;
	}

}

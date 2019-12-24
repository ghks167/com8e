package com.com8e.jumun.service;

import java.util.List;
import java.util.Map;

import com.com8e.jumun.vo.JumunListVO;
import com.com8e.jumun.vo.JumunVO;

public interface IJumunService {
	
	public List<JumunListVO> selectJumunListByCart(Map<String, Object> map)throws Exception;
	
	public int insertJumun(JumunVO vo) throws Exception; 
}

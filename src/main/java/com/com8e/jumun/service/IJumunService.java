package com.com8e.jumun.service;

import java.util.List;
import java.util.Map;

import com.com8e.jumun.vo.JumunListVO;

public interface IJumunService {
	
	public List<JumunListVO> selectJumunListByCart(Map<String, Object> map);
}

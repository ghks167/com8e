package com.com8e.jumun.dao;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.jumun.vo.JumunVO;

@Mapper
public interface IJumunDao {
	
	public int insertJumun(JumunVO vo) throws Exception;
	
}

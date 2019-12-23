package com.com8e.jumun.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.jumun.vo.JumunListVO;


@Mapper
public interface IJumunListDao {

	public List<JumunListVO> selectJumunListByCart(Map<String, Object> map);
}

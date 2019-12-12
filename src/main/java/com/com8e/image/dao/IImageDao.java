package com.com8e.image.dao;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.image.vo.ImageVO;

@Mapper
public interface IImageDao {
	
	public int insertImage(ImageVO vo) throws Exception;
	
	
}

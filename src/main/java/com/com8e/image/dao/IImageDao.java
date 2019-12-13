package com.com8e.image.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.com8e.image.vo.ImageVO;

@Mapper
public interface IImageDao {
	
	public int insertImage(ImageVO vo) throws Exception;
	
	public ImageVO selectImage(@Param("image_parent_no")int image_parent_no, @Param("image_category")String image_category) throws Exception;
	
	
}

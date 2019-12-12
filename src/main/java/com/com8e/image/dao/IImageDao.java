package com.com8e.image.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.image.vo.ImageVO;

@Mapper
public interface IImageDao {
	
	/** 첨부이미지 등록*/
	public int insertImage(ImageVO image) throws Exception;
	/** 부모번호에 따른 목록 조회 */
	public List<ImageVO> selectImageByParentNo(int parent_no) throws Exception;
	
}

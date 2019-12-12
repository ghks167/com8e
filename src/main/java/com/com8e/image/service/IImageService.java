package com.com8e.image.service;

import java.util.List;

import com.com8e.image.vo.ImageVO;

public interface IImageService {
	
	/** 첨부이미지 등록*/
	public int insertImage(ImageVO image) throws Exception;
	/** 부모번호에 따른 목록 조회 */
	public List<ImageVO> selectImageByParentNo(int parent_no) throws Exception;
	
}

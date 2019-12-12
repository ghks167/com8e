package com.com8e.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com8e.image.dao.IImageDao;
import com.com8e.image.vo.ImageVO;

@Service
public class ImageServiceImpl implements IImageService {

	@Autowired
	private IImageDao imageDao;

	@Override
	public int insertImage(ImageVO image) throws Exception {
		
		return imageDao.insertImage(image);
	}

	@Override
	public List<ImageVO> selectImageByParentNo(int parent_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

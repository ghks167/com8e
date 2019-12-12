package com.com8e.common.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.com8e.image.vo.ImageVO;

@Component
public class ImageUtils {
	@Value("#{app['file.upload.path']}")
	private String uploadPath;

	private Logger logger = LoggerFactory.getLogger(getClass());

	public ImageVO getImageByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			String save_name = UUID.randomUUID().toString();
			ImageVO vo = new ImageVO();
			
			
			vo.setImage_category(category);
			vo.setImage_file_name(save_name);
			vo.setImage_original_name(multipart.getOriginalFilename());
			vo.setImage_file_size(multipart.getSize());
			vo.setImage_fancy_size(IFileUtils.fancySize(multipart.getSize()));
			vo.setImage_content_type(multipart.getContentType());
			vo.setImage_path(path);
			
			
			String absoluteFileName = uploadPath + File.separatorChar + vo.getImage_path() + File.separatorChar
					+ vo.getImage_file_name();
			logger.debug("absoluteFileName = {}", absoluteFileName);
			// multipart.transferTo(new File(absoluteFileName));
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(absoluteFileName));
			return vo;
		} else {
			return null;
		}
	}

	public List<ImageVO> getImageListByMultiparts(MultipartFile[] multipartFiles, String category, String path) throws IOException {
		List<ImageVO> imageList = new ArrayList<ImageVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			ImageVO vo = this.getImageByMultipart(multipart, category, path);
			if (vo != null) {
				imageList.add(vo);
			}
		}
		return imageList;
	}
	
	public List<ImageVO> getOtherImageListByMultiparts(MultipartFile[] multipartFiles, String category, String[] path) throws IOException {
		List<ImageVO> imageList = new ArrayList<ImageVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			ImageVO vo = this.getImageByMultipart(multipart, category, path[i]);
			if (vo != null) {
				imageList.add(vo);
			}
		}
		return imageList;
	}
	
}

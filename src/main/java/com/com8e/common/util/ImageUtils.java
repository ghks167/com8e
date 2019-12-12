package com.com8e.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import com.com8e.image.vo.ImageVO;

public class ImageUtils {
Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("#{app['file.upload.path']}")
	private String uploadPath;
	
	public ImageVO getAttachByMultipart(MultipartFile multipart, String category,
	String path) throws IOException {
		
		if(! multipart.isEmpty() ){
				String save_name = UUID. randomUUID().toString();
				ImageVO vo = new ImageVO();
				vo.setImage_original_name(multipart.getOriginalFilename());
				vo.setImage_file_size(multipart.getSize());
				vo.setImage_content_type(multipart.getContentType());
				vo.setImage_file_name(save_name);
				vo.setImage_category(category);
				vo.setImage_path(path);
				vo.setAtch_fancy_size( ImageUtils. fancySize(multipart.getSize()));
				String absoluteFileName = uploadPath + File. separatorChar + vo.getAtch_path()
											+ File.separatorChar + vo.getAtch_file_name();
	
					logger.debug("absoluteFileName = {}", absoluteFileName);
				// transferTo 디렉토리가 존재하지 않으면 오류, commons-io 사용
				// multipart.transferTo(new File(absoluteFileName));
				FileUtils. copyInputStreamToFile( multipart.getInputStream(), new File(absoluteFileName));
				
			return vo;
			
		}else {
			
			return null;
		}
	}
				
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] multipartFiles, String category,
															String path) throws IOException {
				List<AttachVO> atchList = new ArrayList<AttachVO>();
			for (int i = 0; i < multipartFiles.length; i++) {
					MultipartFile multipart = multipartFiles[i];
					AttachVO vo = this.getAttachByMultipart(multipart, category, path);
				if(vo != null) {
					atchList.add(vo);
				}
			}
				return atchList;
		}
	}

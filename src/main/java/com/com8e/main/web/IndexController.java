package com.com8e.main.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.com8e.image.vo.ImageVO;
import com.com8e.prod.service.IProdService;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;


@Controller
public class IndexController {
	
	@Autowired
	private IProdService prodService;

	
	@RequestMapping(value = "/")
	public String home(ModelMap model,@ModelAttribute("searchVO") ProdSearchVO searchVO) throws Exception {
		
		List<ProdVO> list = prodService.selectMainThreeList(searchVO);
		List<ProdVO> vo = prodService.selectProdType();
		List<ImageVO> img = new ArrayList<ImageVO>();
		for(ProdVO aa : list) {
			System.out.println(aa.toString());
		}
		
		model.addAttribute("prodMainthreeList", list);
		model.addAttribute("prodMainLable", vo);
		model.addAttribute("pridMainIMage", img);
		
		
		return "index";
	}
	
}

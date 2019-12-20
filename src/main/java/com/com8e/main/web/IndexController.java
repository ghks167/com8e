package com.com8e.main.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		for(ProdVO aa : list) {
			
			System.out.println(aa.toString());
		}
		
		model.addAttribute("prodMainthreeList", list);
		model.addAttribute("prodMainLable", vo);
		
		
		
		return "index";
	}
	
}

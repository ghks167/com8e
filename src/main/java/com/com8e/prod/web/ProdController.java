package com.com8e.prod.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.prod.vo.ProdVO;


@Controller
public class ProdController {
	
	@RequestMapping(value = "/prod/prodView")
	public String ProdView(@ModelAttribute("prod") ProdVO prod) {
		String view ="prod/prodView";
		return view;
	}
	
	@RequestMapping(value = "/prod/prodForm")
	public String ProdRegist(@ModelAttribute("prod") ProdVO prod) {
		String view ="prod/prodForm";
		return view;
	}

	
	
}

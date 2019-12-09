package com.com8e.prod.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ProdController {
	
	@RequestMapping(value = "/prod/prodView")
	public String ProdView() {
		String view ="prod/prodView";
		return view;
	}
	
	@RequestMapping(value = "/prod/prodForm")
	public String ProdRegist() {
		String view ="prod/prodForm";
		return view;
	}

	
	
}

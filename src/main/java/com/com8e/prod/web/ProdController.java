package com.com8e.prod.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.com8e.common.vo.ResultMessageVO;
import com.com8e.prod.service.IProdService;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;

@Controller
public class ProdController {

	@Autowired
	private IProdService prodService;
	
	@ModelAttribute("prodTypeList")
	public List<ProdVO> getProdTypeList() throws Exception{
		
		List<ProdVO> list = prodService.selectProdType();
		
		return list;
	}

	@RequestMapping(value = "/prod/prodView" ,params = "prod_no")
	public String ProdView(@ModelAttribute("prod") ProdVO prod
								,Model model,@RequestParam("prod_no") int prod_no) throws Exception {
		String view = "prod/prodView";
		ProdVO vo = prodService.selectProd(prod_no);
		model.addAttribute("prod", vo);
		return view;
	}
	
	

	@RequestMapping(value = {"/prod/prodForm", "/prod/prodRegist"})
	public String ProdForm(@ModelAttribute("prod") ProdVO prod) throws Exception {
		String view = "prod/prodForm";
		
		return view;
	}
	
	@RequestMapping(value = "/prod/prodRegist" , method = RequestMethod.POST)
	public String ProdRegist(@ModelAttribute("prod")ProdVO prod
								,ModelMap model) throws Exception {
		String view = "common/message";
		
		prodService.insertProd(prod);
		         
		
		ResultMessageVO messageVO = new ResultMessageVO();
		messageVO.setResult(true)
				   .setTitle("상품 등록 성공")
				   .setMessage("해당 상품등록을 완료하였습니다.")
				   .setUrlTitle("등록상품확인")
				   .setUrl("/prod/prodView?prod_no="+prod.getProd_no());
		
		model.addAttribute("resultMessage",messageVO);
		return view;
	}
	
	@RequestMapping(value = "/prod/prodList")
	public String prodList(@ModelAttribute("prod")ProdVO prod
									, HttpServletRequest req) throws Exception{
		
		String view = "/prod/prodList";
		ProdSearchVO searchVO = new ProdSearchVO();	
		List<ProdVO> list = prodService.selectProdList(searchVO);
	
		req.setAttribute("prodList", list);
		
		return view;
		
		
	}

}

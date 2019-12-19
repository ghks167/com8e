package com.com8e.common.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.com8e.board.service.IBoardService;
import com.com8e.board.vo.BoardSearchVO;
import com.com8e.board.vo.BoardVO;
import com.com8e.common.vo.ResultMessageVO;
import com.com8e.prod.service.IProdService;
import com.com8e.prod.vo.ProdVO;

@Controller
public class indexIcludeController {
	
	@Autowired
	IBoardService boardService;
	
	
	@Autowired
	IProdService prodService;
	
	@ModelAttribute("typeList")
	public List<ProdVO> getProdTypeList() throws Exception{
		List<ProdVO> list = prodService.selectProdType();
		return list;
	}
	
	
	
	@RequestMapping(value="/indexInclude/category")
	public String category(ModelMap model) {
		
		
		
		return "../../indexInclude/category";
	}
	

}

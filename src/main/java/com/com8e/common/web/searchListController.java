package com.com8e.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.com8e.board.service.IBoardService;
import com.com8e.board.vo.BoardVO;
import com.com8e.notice.vo.NoticeVO;
import com.com8e.prod.service.IProdService;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;
	
@Controller
public class searchListController {
	
	@Autowired
	IBoardService boardService;
	
	@Autowired
	IProdService prodService;
	
	@ModelAttribute("typeList")
	public List<ProdVO> getProdTypeList() throws Exception{
		List<ProdVO> list = prodService.selectProdType();
		return list;
	}
	
	
	
	@RequestMapping(value="common/searchList")
	public String searchList(@ModelAttribute("prod")ProdVO prod, @ModelAttribute("searchVO") ProdSearchVO searchVO 
								,@RequestParam("keyword") String keyword,ModelMap model
								,@ModelAttribute("board")BoardVO board
								,@ModelAttribute("notice")NoticeVO notice) throws Exception {
		
		
		List<ProdVO> plist = prodService.selectProdLikeName(keyword);
		List<BoardVO> blist = boardService.searchBoardList(keyword);
		
		
		model.addAttribute("prodList",plist);
		model.addAttribute("boardList",blist);
		model.addAttribute("searchVO",searchVO);
		
		return "common/searchList";
	}
	

}

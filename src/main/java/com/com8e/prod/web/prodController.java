package com.com8e.prod.web;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.com8e.common.utils.ImageUtils;
import com.com8e.common.vo.ResultMessageVO;
import com.com8e.image.vo.ImageVO;
import com.com8e.prod.service.IProdService;
import com.com8e.prod.vo.ProdSearchVO;
import com.com8e.prod.vo.ProdVO;


@Controller
public class prodController {
	
	@Autowired
	private IProdService prodService;
	
	@Autowired
	private ImageUtils imageUtils;
	
	
	@ModelAttribute("prodTypeList")
	public List<ProdVO> getProdTypeList() throws Exception{
		List<ProdVO> list = prodService.selectProdType();
		return list;
	}
	
	@RequestMapping(value = "/prod/prodForm")
	public String prodForm(Model model) {	
		ProdVO vo = new ProdVO();
		model.addAttribute("prod", vo);
		
		
		return "prod/prodForm";
	}
	
	@RequestMapping(value = "/prod/prodView" ,params = "prod_no")
	public String ProdView(@ModelAttribute("prod") ProdVO prod
								,Model model,@RequestParam("prod_no") int prod_no) throws Exception {
		String view = "prod/prodView";
		ProdVO vo = prodService.selectProd(prod_no);
		model.addAttribute("prod", vo);
		return view;
	}
	
	@RequestMapping(value = "/prod/prodRegist" , method = RequestMethod.POST)
	public String ProdRegist(@ModelAttribute("prod")ProdVO prod, 
			@RequestParam(name = "prod_main_image",required = false) MultipartFile mainFile ,
			@RequestParam(name = "prod_info_image",required = false) MultipartFile infoFile ,
			ModelMap model) throws Exception {
		
		List<ImageVO> list = new ArrayList<ImageVO>();
		
		if(mainFile != null && infoFile != null) {
			
			MultipartFile[] multipartFiles = {mainFile,infoFile};
			String[] paths = {"PROD_MAIN","PROD_INFO"};		
			String[] category = {"PROD_M","PROD_I"};
			list = imageUtils.getOtherImageListByMultiparts(multipartFiles, category,paths);
			prod.setList(list);
		}else if (mainFile != null) {
			 list.add(imageUtils.getImageByMultipart(mainFile, "PROD_M", "PROD_MAIN"));
			 prod.setList(list);
		}else if (infoFile != null) {
			list.add(imageUtils.getImageByMultipart(infoFile, "PROD_I", "PROD_INFO"));
			prod.setList(list);
		}
		
		int cnt = prodService.insertProd(prod);
		ProdVO vo = prodService.selectProdName(prod.getProd_name());
		
		ResultMessageVO messageVO = new ResultMessageVO();
		messageVO.setResult(true)
				   .setTitle("상품 등록 성공")
				   .setMessage("해당 상품등록을 완료하였습니다.")
				   .setUrlTitle("등록상품확인")
				   .setUrl("prod/prodView?prod_no="+vo.getProd_no());
		
		model.addAttribute("resultMessage",messageVO);
		return "common/message";
	}
	
	@RequestMapping(value = "/prod/prodList")
	public String prodList(@ModelAttribute("prod")ProdVO prod, @ModelAttribute("searchVO") ProdSearchVO searchVO
									, Model model) throws Exception{
		
		String view = "/prod/prodList";	
		List<ProdVO> list = prodService.selectProdList(searchVO);
		
		
		model.addAttribute("prodList", list);
		model.addAttribute("searchVO", searchVO);
		
		return view;
		
		
	}
	
	@RequestMapping(value = "/prod/prodEdit")
	public String prodEdit(@ModelAttribute("prod")ProdVO prod,@RequestParam("prod_no") int prod_no, ModelMap model) throws Exception{
		String view = "prod/prodEdit"; 
		
		ProdVO vo = prodService.selectProd(prod_no);
		model.addAttribute("prod",vo);
		return view;
		
	}
	
	@RequestMapping(value = "/prod/prodModify")
	public String prodModify(@ModelAttribute("prod")ProdVO prod,
								 @RequestParam(name = "prod_main_image",required = false) MultipartFile mainFile ,
								 @RequestParam(name = "prod_info_image",required = false) MultipartFile infoFile ,
								 ModelMap model)throws Exception{
		
		String view = "common/message";
		
		List<ImageVO> list = new ArrayList<ImageVO>();
		
		if(mainFile != null && infoFile != null) {
			
			MultipartFile[] multipartFiles = {mainFile,infoFile};
			String[] paths = {"PROD_MAIN","PROD_INFO"};		
			String[] category = {"PROD_M","PROD_I"};
			list = imageUtils.getOtherImageListByMultiparts(multipartFiles, category,paths);
			prod.setList(list);
		}else if (mainFile != null) {
			 list.add(imageUtils.getImageByMultipart(mainFile, "PROD_M", "PROD_MAIN"));
			 prod.setList(list);
		}else if (infoFile != null) {
			list.add(imageUtils.getImageByMultipart(infoFile, "PROD_I", "PROD_INFO"));
			prod.setList(list);
		}
		
		int cnt = prodService.updateProd(prod);
		ProdVO vo = prodService.selectProdName(prod.getProd_name());
		
		ResultMessageVO messageVO = new ResultMessageVO();
		messageVO.setResult(true)
				   .setTitle("상품 수정 완료")
				   .setMessage("해당 상품수정이 완료되었습니다.")
				   .setUrlTitle("등록수정확인")
				   .setUrl("prod/prodView?prod_no="+vo.getProd_no());
		
		model.addAttribute("resultMessage",messageVO);
		return view;
	}
	
	
}

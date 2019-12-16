package com.com8e.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.board.service.IBoardService;
import com.com8e.board.vo.BoardVO;
import com.com8e.common.vo.ResultMessageVO;

@Controller
public class boardController {
	
	@Autowired
	IBoardService boardService;
	
	
	@RequestMapping(value = "board/boardList")
	public String boardList(Model model){
			
		List<BoardVO> list = boardService.selectBoardList();
		model.addAttribute("boardList", list);
		return "board/boardList";			
	}
	
	
	@RequestMapping(value = "board/boardEdit")
	public String boardEdit() {
		
		return "board/boardEdit";
	}
	
	@RequestMapping(value = "board/boardView", params = "bo_no")
	public String boardView(int bo_no, Model model) {
		BoardVO vo = boardService.selectBoard(bo_no);
		model.addAttribute("board", vo);
		return "board/boardView";
	}
	
	
	@RequestMapping(value = "board/boardForm")
	public String boardForm(Model model, HttpSession session, @ModelAttribute("board")BoardVO board) {
		
		String mem_id = (String)session.getAttribute("LOGIN_INFO");
		
		if(mem_id == null) {
			return "login/loginForm";
			
		}
		
		
		board.setBo_mem(mem_id);
		
		
		model.addAttribute("board",board);
		
		return "board/boardForm";
	}
	
	
	@RequestMapping(value = "board/boardRegist")
	public String boardRegist(BoardVO board, Model model) {
		
		int i = boardService.insertBoard(board);
		ResultMessageVO messageVO = new ResultMessageVO();
		
		if(i>0) {			
			messageVO.setResult(true).setMessage("성공적으로 등록되었습니다.").setTitle("등록 성공").setUrlTitle("글보기").setUrl("#");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}else {
			messageVO.setResult(false).setMessage("글등록에 실패하였습니다.").setTitle("등록 실패").setUrlTitle("뒤로가기").setUrl("board/boardForm");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
		
	}
	

}

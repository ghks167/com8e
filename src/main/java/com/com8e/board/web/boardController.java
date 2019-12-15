package com.com8e.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.com8e.board.service.BoardServiceImpl;
import com.com8e.board.vo.BoardVO;

@Controller
public class boardController {
	
	@Autowired
	BoardServiceImpl boardService;
	
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

}

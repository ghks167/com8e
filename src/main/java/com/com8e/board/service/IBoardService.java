package com.com8e.board.service;

import java.util.List;

import com.com8e.board.vo.BoardVO;

public interface IBoardService {
	
	public List<BoardVO> selectBoardList();
	
	public BoardVO selectBoard(int bo_no);

}

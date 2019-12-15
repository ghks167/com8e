package com.com8e.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.board.vo.BoardVO;

@Mapper
public interface IBoardDao {
	
	public List<BoardVO> selectBoardList();
	
	public BoardVO selectBoard(int bo_no);
}

package com.com8e.boardpr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.boardpr.vo.BoardPrVO;


@Mapper
public interface IBoardPrDao {
	public int insertBoardPr(BoardPrVO vo) throws Exception; 

	public List<BoardPrVO> selectBoardPr(int bp_bo_no);
}

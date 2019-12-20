package com.com8e.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.board.vo.BoardSearchVO;
import com.com8e.board.vo.BoardVO;

@Mapper
public interface IBoardDao {
	
	public List<BoardVO> selectBoardList(BoardSearchVO searchVO);
	
	public BoardVO selectBoard(int bo_no);
	
	public int insertBoard(BoardVO vo); 
	
	public int updateBoard(BoardVO vo);
	
	/** 카운트 */
	public int selectBoardCount(BoardSearchVO searchVO) throws Exception;
	
	public int updateReplyCnt(int bo_no) throws Exception;
	
}

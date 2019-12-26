package com.com8e.board.service;

import java.util.List;

import com.com8e.board.vo.BoardSearchVO;
import com.com8e.board.vo.BoardVO;

public interface IBoardService {
	
	public BoardVO selectBoard(int bo_no , boolean incrementHit)throws Exception;
	
	public int insertBoard(BoardVO vo) throws Exception;
	
	public int updateBoard(BoardVO vo)throws Exception;
	
	public int selectBoardCount(BoardSearchVO searchVO) throws Exception;

	List<BoardVO> selectBoardList(BoardSearchVO searchVO) throws Exception;
	
	public int updateReplyCnt(int bo_no) throws Exception;
	
	/** 통합검색을 통한 상품 리스트 조회하기*/
	public List<BoardVO> searchBoardList(String keyword) throws Exception;

}

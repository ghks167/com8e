package com.com8e.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.board.vo.BoardSearchVO;
import com.com8e.board.vo.BoardVO;

@Mapper
public interface IBoardDao {

	public List<BoardVO> selectBoardList(BoardSearchVO searchVO)throws Exception;

	public BoardVO selectBoard(int bo_no)throws Exception;

	public int insertBoard(BoardVO vo) throws Exception;

	public int updateBoard(BoardVO vo)throws Exception;

	/** 카운트 */
	public int selectBoardCount(BoardSearchVO searchVO) throws Exception;

	public int updateReplyCnt(int bo_no) throws Exception;

	
	/** 통합검색을 통한 자유게시판 리스트 조회하기*/
	public List<BoardVO> searchBoardList(String keyword) throws Exception;

}

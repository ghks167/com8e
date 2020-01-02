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
	
	/** 통합검색을 통한 자유게시판 리스트 조회하기*/
	public List<BoardVO> searchBoardList(String keyword) throws Exception;
	
	/**공지사항*/
	public BoardVO selectNoticeBoard (int bo_no, boolean incrementHit)throws Exception;
	
	public int insertNoticeBoard (BoardVO vo) throws Exception;
	
	public List<BoardVO> selectNoticeBoardList(BoardSearchVO searchVO)throws Exception;
	
	public int updateNotice(BoardVO vo)throws Exception;

	public int selectNoticeCount(BoardSearchVO searchVO) throws Exception;
	
	/** 통합검색을 통한 공지사항 리스트 조회하기*/
	public List<BoardVO> searchNoticeList(String keyword) throws Exception;


	

}

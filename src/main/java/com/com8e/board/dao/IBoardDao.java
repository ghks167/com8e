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
	
	/** 조회수 증가*/
	public void increaseBoardCount(int bo_no) throws Exception;

	/** 통합검색을 통한 자유게시판 리스트 조회하기*/
	public List<BoardVO> searchBoardList(String keyword) throws Exception;
	
	/** 공지사항*/
	public BoardVO selectNoticeBoard (int no_bo_no)throws Exception;
	
	public int insertNoticeBoard (BoardVO vo) throws Exception;
	
	public List<BoardVO> selectNoticeBoardList(BoardSearchVO searchVO)throws Exception;
	
	public int updateNotice(BoardVO vo)throws Exception;
	
	public int selectNoticeCount(BoardSearchVO searchVO) throws Exception;

	public void increaseNoticeCount(int no_bo_no) throws Exception;
	
	/** 통합검색을 통한 공지사항게시판 리스트 조회하기*/
	public List<BoardVO> searchNoticeList(String keyword) throws Exception;
	


}

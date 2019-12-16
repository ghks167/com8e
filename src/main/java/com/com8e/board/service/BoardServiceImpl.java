package com.com8e.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.com8e.board.dao.IBoardDao;
import com.com8e.board.vo.BoardSearchVO;
import com.com8e.board.vo.BoardVO;


@Component
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	IBoardDao boardDao;
	
	@Override
	public List<BoardVO> selectBoardList(BoardSearchVO searchVO) throws Exception {
		int cnt = boardDao.selectBoardCount(searchVO);
		searchVO.setTotalRowCount(cnt);
		searchVO.pageSetting();
		
		List<BoardVO> list = boardDao.selectBoardList(searchVO);
		return list;
	}

	@Override
	public BoardVO selectBoard(int bo_no) {
		BoardVO vo = boardDao.selectBoard(bo_no);
		
		return vo;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		int i = boardDao.insertBoard(vo);
		return i;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		int i = boardDao.updateBoard(vo);
		return i;
	}

	@Override
	public int selectBoardCount(BoardSearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReplyCnt(int bo_no) throws Exception {
		
		return boardDao.updateReplyCnt(bo_no);
	}

}

package com.com8e.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.com8e.board.dao.IBoardDao;
import com.com8e.board.vo.BoardVO;


@Component
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	IBoardDao boardDao;
	
	@Override
	public List<BoardVO> selectBoardList() {
		
		List<BoardVO> list = boardDao.selectBoardList();
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

}

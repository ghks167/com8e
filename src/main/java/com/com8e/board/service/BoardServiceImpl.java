package com.com8e.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.com8e.board.dao.IBoardDao;
import com.com8e.board.vo.BoardSearchVO;
import com.com8e.board.vo.BoardVO;
import com.com8e.boardpr.dao.IBoardPrDao;
import com.com8e.boardpr.vo.BoardPrVO;
import com.com8e.prod.dao.IProdDao;
import com.com8e.prod.vo.ProdVO;


@Component
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	IBoardDao boardDao;
	@Autowired
	IBoardPrDao boardPrDao;
	@Autowired
	IProdDao prodDao;
	
	@Override
	public List<BoardVO> selectBoardList(BoardSearchVO searchVO) throws Exception {
		int cnt = boardDao.selectBoardCount(searchVO);
		searchVO.setTotalRowCount(cnt);
		searchVO.pageSetting();
		
		List<BoardVO> list = boardDao.selectBoardList(searchVO);
		return list;
	}

	@Override
	public BoardVO selectBoard(int bo_no, boolean incrementHit) throws Exception {
		BoardVO vo = boardDao.selectBoard(bo_no);
		List<BoardPrVO> list = boardPrDao.selectBoardPr(bo_no);
		ArrayList<ProdVO> list2 = new ArrayList<ProdVO>();
		for(BoardPrVO prVO : list) {
			ProdVO prodVO = prodDao.selectProd(prVO.getBp_prod_no());
			list2.add(prodVO);
		}
		vo.setProd_list(list2);
		
		if (incrementHit) {
			boardDao.increaseBoardCount(vo.getBo_no());
		}
		
		return vo;
	}

	@Override
	public int insertBoard(BoardVO vo) throws Exception{
		int[] prod_list = vo.getBo_prod_list();
		int i = boardDao.insertBoard(vo);
		
		for(int j : prod_list) {
			BoardPrVO prVO = new BoardPrVO();
			prVO.setBp_prod_no(j);
			boardPrDao.insertBoardPr(prVO);
		}
		
		return i;
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception{
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

	@Override
	public List<BoardVO> searchBoardList(String keyword) throws Exception {
		
		List<BoardVO> list = boardDao.searchBoardList(keyword);
		return list;

	}
	
	
	
	
	@Override
	public BoardVO selectNoticeBoard(int bo_no, boolean incrementHit) throws Exception {
		BoardVO vo = boardDao.selectNoticeBoard(bo_no);
		
		if (incrementHit) {
			boardDao.increaseNoticeCount(vo.getBo_no());
		}
	
		return vo;
	}
	
	
	@Override
	public int insertNoticeBoard(BoardVO vo) throws Exception {
		int i = boardDao.insertNoticeBoard(vo);
		return i;
	}



	@Override
	public int updateNotice(BoardVO vo) throws Exception {
		int i = boardDao.updateNotice(vo);
		return i;
	}

	@Override
	public List<BoardVO> selectNoticeBoardList(BoardSearchVO searchVO) throws Exception {
		int cnt = boardDao.selectNoticeCount(searchVO);
		searchVO.setTotalRowCount(cnt);
		searchVO.pageSetting();
		
		List<BoardVO> list = boardDao.selectNoticeBoardList(searchVO);
		return list;
	
	}

	@Override
	public int selectNoticeCount(BoardSearchVO searchVO) throws Exception {
		
		return 0;
	}

	@Override
	public List<BoardVO> searchNoticeList(String keyword) throws Exception {
		List<BoardVO> list = boardDao.searchNoticeList(keyword);
		return list;
		
	}


}

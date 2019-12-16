package com.com8e.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.com8e.reply.dao.IReplyDao;
import com.com8e.reply.vo.ReplyVO;


@Component
public class ReplyServiceImpl implements IReplyService{
	
	
	@Autowired
	IReplyDao replyDao;
	
	@Override
	public int insertReply(ReplyVO vo) throws Exception {
		
		int i = replyDao.insertReply(vo);
		
		return i;
	}

	@Override
	public List<ReplyVO> selectReplyList(int re_bo_no) throws Exception {
		List<ReplyVO> list = replyDao.selectReplyList(re_bo_no);
		for(ReplyVO vo : list) {
			List<ReplyVO> coment = replyDao.selectReply(vo.getRe_no());
			vo.setComment(coment);
		}
		
		return list;
	}

	@Override
	public int insertComment(ReplyVO vo) throws Exception {
		
		return replyDao.insertComment(vo);
	}

}

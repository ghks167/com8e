package com.com8e.reply.service;

import java.util.List;

import com.com8e.reply.vo.ReplyVO;

public interface IReplyService {
	
	public int insertReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> selectReplyList(int re_bo_no) throws Exception;
		
	public int insertComment(ReplyVO vo) throws Exception;
}

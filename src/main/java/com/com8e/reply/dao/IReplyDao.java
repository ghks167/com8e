package com.com8e.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.com8e.reply.vo.ReplyVO;


@Mapper
public interface IReplyDao {
	
	public int insertReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> selectReplyList(int re_bo_no)throws Exception;
	
	public List<ReplyVO> selectReply(int re_parent_no) throws Exception;
	
	public int insertComment(ReplyVO vo) throws Exception;
	
}

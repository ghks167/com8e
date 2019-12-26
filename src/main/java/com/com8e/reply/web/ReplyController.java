package com.com8e.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.com8e.board.service.IBoardService;
import com.com8e.reply.service.IReplyService;
import com.com8e.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	
	@Autowired
	IReplyService replyService;
	@Autowired
	IBoardService boardService;
	
	
	@RequestMapping(value = "reply/replyRegist")
	@ResponseBody
	public Map<String, Object> replyRegist(ReplyVO vo) throws Exception{
		int i = replyService.insertReply(vo);
		boardService.updateReplyCnt(vo.getRe_bo_no());
		Map<String, Object> map = new HashMap<String, Object>();
		if(i > 0) {
			map.put("result", true);
			map.put("msg", "등록되었습니다.");
		}else {
			map.put("result", false);
			map.put("msg", "등록에 실패하였습니다.");
		}

		return map;
	}
	
	@RequestMapping(value = "reply/replyList")
	public String replyList(int re_bo_no, Model model) throws Exception{
		List<ReplyVO> list = replyService.selectReplyList(re_bo_no);
		model.addAttribute("replyList",list);
		return "reply/replyForm";
	}
	
	@RequestMapping(value = "reply/commentRegist")
	@ResponseBody
	public Map<String, Object> commentRegist(ReplyVO vo) throws Exception{
		int i = replyService.insertComment(vo);
		boardService.updateReplyCnt(vo.getRe_bo_no());
		Map<String, Object> map = new HashMap<String, Object>();
		if(i > 0) {
			map.put("result", true);
			map.put("msg", "등록되었습니다.");
		}else {
			map.put("result", false);
			map.put("msg", "등록에 실패하였습니다.");
		}
		return map;
	}
	
	
	
}

package com.com8e.reply.vo;

import java.util.List;

public class ReplyVO {
	
	private int re_no;
	private String re_mem = "";
	private int re_bo_no;
	private String re_content = "";
	private String re_date = "";
	private int re_parent_no;
	private List<ReplyVO> comment;
	
	
	
	
	public List<ReplyVO> getComment() {
		return comment;
	}
	public void setComment(List<ReplyVO> comment) {
		this.comment = comment;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getRe_mem() {
		return re_mem;
	}
	public void setRe_mem(String re_mem) {
		this.re_mem = re_mem;
	}
	public int getRe_bo_no() {
		return re_bo_no;
	}
	public void setRe_bo_no(int re_bo_no) {
		this.re_bo_no = re_bo_no;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public int getRe_parent_no() {
		return re_parent_no;
	}
	public void setRe_parent_no(int re_parent_no) {
		this.re_parent_no = re_parent_no;
	}
	
	
}

package com.com8e.notice.vo;

import java.util.List;

import com.com8e.prod.vo.ProdVO;

public class NoticeVO {
	private int no_bo_no;
	private String no_bo_title = "";
	private String no_bo_content = "";
	private String no_bo_date = "";
	private int no_bo_hit;
	private int no_bo_re_cnt;
	private String no_bo_mem = "";
	private int[] no_bo_prod_list;
	private List<ProdVO> no_prod_list;
	
	private String no_bo_category = "";

	
	
	
	public String getNo_bo_category() {
		return no_bo_category;
	}
	public void setNo_bo_category(String no_bo_category) {
		this.no_bo_category = no_bo_category;
	}
	public String getBo_category() {
		return bo_category;
	}
	public void setBo_category(String bo_category) {
		this.bo_category = bo_category;
	}
	private String bo_category = "";


	public int getNo_bo_no() {
		return no_bo_no;
	}
	public void setNo_bo_no(int no_bo_no) {
		this.no_bo_no = no_bo_no;
	}
	public String getNo_bo_title() {
		return no_bo_title;
	}
	public void setNo_bo_title(String no_bo_title) {
		this.no_bo_title = no_bo_title;
	}
	public String getNo_bo_content() {
		return no_bo_content;
	}
	public void setNo_bo_content(String no_bo_content) {
		this.no_bo_content = no_bo_content;
	}
	public String getNo_bo_date() {
		return no_bo_date;
	}
	public void setNo_bo_date(String no_bo_date) {
		this.no_bo_date = no_bo_date;
	}
	public int getNo_bo_hit() {
		return no_bo_hit;
	}
	public void setNo_bo_hit(int no_bo_hit) {
		this.no_bo_hit = no_bo_hit;
	}
	public int getNo_bo_re_cnt() {
		return no_bo_re_cnt;
	}
	public void setNo_bo_re_cnt(int no_bo_re_cnt) {
		this.no_bo_re_cnt = no_bo_re_cnt;
	}
	public String getNo_bo_mem() {
		return no_bo_mem;
	}
	public void setNo_bo_mem(String no_bo_mem) {
		this.no_bo_mem = no_bo_mem;
	}
	public int[] getNo_bo_prod_list() {
		return no_bo_prod_list;
	}
	public void setNo_bo_prod_list(int[] no_bo_prod_list) {
		this.no_bo_prod_list = no_bo_prod_list;
	}
	public List<ProdVO> getNo_prod_list() {
		return no_prod_list;
	}
	public void setNo_prod_list(List<ProdVO> no_prod_list) {
		this.no_prod_list = no_prod_list;
	}
	
	
	
	
	
}

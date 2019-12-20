package com.com8e.board.vo;

import java.util.List;

import com.com8e.prod.vo.ProdVO;

public class BoardVO {
	private int bo_no;
	private String bo_title = "";
	private String bo_content = "";
	private String bo_date = "";
	private int bo_hit;
	private int bo_re_cnt;
	private String bo_mem = "";
	private int[] bo_prod_list;
	private List<ProdVO> prod_list;
	
	
	public List<ProdVO> getProd_list() {
		return prod_list;
	}
	public void setProd_list(List<ProdVO> prod_list) {
		this.prod_list = prod_list;
	}
	public int[] getBo_prod_list() {
		return bo_prod_list;	
	}
	public void setBo_prod_list(int[] bo_prod_list) {
		this.bo_prod_list = bo_prod_list;
	}
	public int getBo_no() {
		return bo_no;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_date() {
		return bo_date.substring(0, 10);
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}
	public int getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(int bo_hit) {
		this.bo_hit = bo_hit;
	}
	public int getBo_re_cnt() {
		return bo_re_cnt;
	}
	public void setBo_re_cnt(int bo_re_cnt) {
		this.bo_re_cnt = bo_re_cnt;
	}
	public String getBo_mem() {
		return bo_mem;
	}
	public void setBo_mem(String bo_mem) {
		this.bo_mem = bo_mem;
	}
	public String getBo_category() {
		return bo_category;
	}
	public void setBo_category(String bo_category) {
		this.bo_category = bo_category;
	}
	private String bo_category = "";
}

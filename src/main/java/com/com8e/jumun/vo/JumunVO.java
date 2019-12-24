package com.com8e.jumun.vo;

import java.util.List;

public class JumunVO {
	private int jumun_no;
	private String jumun_mem = "";
	private int jumun_post_code;
	private String jumun_addr = "";
	private String jumun_addr_det = "";
	private String jumun_addr_ref = "";
	private List<JumunListVO> items;
	
	
	public List<JumunListVO> getItems() {
		return items;
	}
	public void setItems(List<JumunListVO> items) {
		this.items = items;
	}
	public int getJumun_no() {
		return jumun_no;
	}
	public void setJumun_no(int jumun_no) {
		this.jumun_no = jumun_no;
	}
	public String getJumun_mem() {
		return jumun_mem;
	}
	public void setJumun_mem(String jumun_mem) {
		this.jumun_mem = jumun_mem;
	}
	public int getJumun_post_code() {
		return jumun_post_code;
	}
	public void setJumun_post_code(int jumun_post_code) {
		this.jumun_post_code = jumun_post_code;
	}
	public String getJumun_addr() {
		return jumun_addr;
	}
	public void setJumun_addr(String jumun_addr) {
		this.jumun_addr = jumun_addr;
	}
	public String getJumun_addr_det() {
		return jumun_addr_det;
	}
	public void setJumun_addr_det(String jumun_addr_det) {
		this.jumun_addr_det = jumun_addr_det;
	}
	public String getJumun_addr_ref() {
		return jumun_addr_ref;
	}
	public void setJumun_addr_ref(String jumun_addr_ref) {
		this.jumun_addr_ref = jumun_addr_ref;
	}
	@Override
	public String toString() {
		return "JumunVO [jumun_no=" + jumun_no + ", jumun_mem=" + jumun_mem + ", jumun_post_code=" + jumun_post_code
				+ ", jumun_addr=" + jumun_addr + ", jumun_addr_det=" + jumun_addr_det + ", jumun_addr_ref="
				+ jumun_addr_ref+ "]";
	}
}

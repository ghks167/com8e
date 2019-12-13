package com.com8e.prod.vo;

import java.util.List;
import java.util.Map;

import com.com8e.image.vo.ImageVO;

public class ProdVO {
	
	private int prod_no;
	private String prod_name = "";
	private int prod_price ;
	private String prod_com = "";
	private int prod_qty ;
	private String prod_type = "";
	private String prod_date = "";
	
	private List<ImageVO> list;
	private Map<String, ImageVO> map;
	
	public Map<String, ImageVO> getMap() {
		return map;
	}
	public void setMap(Map<String, ImageVO> map) {
		this.map = map;
	}
	public int getProd_no() {
		return prod_no;
	}
	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_com() {
		return prod_com;
	}
	public void setProd_com(String prod_com) {
		this.prod_com = prod_com;
	}
	public int getProd_qty() {
		return prod_qty;
	}
	public void setProd_qty(int prod_qty) {
		this.prod_qty = prod_qty;
	}
	public String getProd_type() {
		return prod_type;
	}
	public void setProd_type(String prod_type) {
		this.prod_type = prod_type;
	}
	public String getProd_date() {
		return prod_date;
	}
	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}
	
	public List<ImageVO> getList() {
		return list;
	}
	public void setList(List<ImageVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "ProdVO [prod_id=" + prod_no + ", prod_name=" + prod_name + ", prod_price=" + prod_price + ", prod_com="
				+ prod_com + ", prod_qty=" + prod_qty + ", prod_type=" + prod_type + ", prod_date=" + prod_date + "]";
	}

}
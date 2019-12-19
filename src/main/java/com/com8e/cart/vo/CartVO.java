package com.com8e.cart.vo;

import com.com8e.prod.vo.ProdVO;

public class CartVO {
	private int cart_no;
	private String cart_mem = "";
	private int cart_prod;
	private int cart_qty;
	private String main_image_name;
	private ProdVO prod;
	
	
	
	public ProdVO getProd() {
		return prod;
	}
	public void setProd(ProdVO prod) {
		this.prod = prod;
	}
	public String getMain_image_name() {
		return main_image_name;
	}
	public void setMain_image_name(String main_image_name) {
		this.main_image_name = main_image_name;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getCart_mem() {
		return cart_mem;
	}
	public void setCart_mem(String cart_mem) {
		this.cart_mem = cart_mem;
	}
	public int getCart_prod() {
		return cart_prod;
	}
	public void setCart_prod(int cart_prod) {
		this.cart_prod = cart_prod;
	}
}

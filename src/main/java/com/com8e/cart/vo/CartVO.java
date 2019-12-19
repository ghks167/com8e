package com.com8e.cart.vo;

public class CartVO {
	private int cart_no;
	private String cart_mem = "";
	private int cart_prod;
	private int cart_qty;
	private int cart_prod_price;
	
	
	
	public int getCart_prod_price() {
		return cart_prod_price;
	}
	public void setCart_prod_price(int cart_prod_price) {
		this.cart_prod_price = cart_prod_price;
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

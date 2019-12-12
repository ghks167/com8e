package com.com8e.image.vo;

public class ImageVO {
	
	private int image_no;
	private int image_parent_no;
	private String image_category = "";
	private String image_file_name = "";
	private String image_original_name = "";
	private int image_file_size;
	private String image_fancy_size = "";
	private String image_content_type = "";
	private String image_path = "";
	private int image_down_cnt;
	private String image_del_yn = "";
	private String image_reg_date = "";
	
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getImage_parent_no() {
		return image_parent_no;
	}
	public void setImage_parent_no(int image_parent_no) {
		this.image_parent_no = image_parent_no;
	}
	public String getImage_category() {
		return image_category;
	}
	public void setImage_category(String image_category) {
		this.image_category = image_category;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public String getImage_original_name() {
		return image_original_name;
	}
	public void setImage_original_name(String image_original_name) {
		this.image_original_name = image_original_name;
	}
	public int getImage_file_size() {
		return image_file_size;
	}
	public void setImage_file_size(long image_file_size) {
		this.image_file_size = image_file_size;
	}
	public String getImage_fancy_size() {
		return image_fancy_size;
	}
	public void setImage_fancy_size(String image_fancy_size) {
		this.image_fancy_size = image_fancy_size;
	}
	public String getImage_content_type() {
		return image_content_type;
	}
	public void setImage_content_type(String image_content_type) {
		this.image_content_type = image_content_type;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public int getImage_down_cnt() {
		return image_down_cnt;
	}
	public void setImage_down_cnt(int image_down_cnt) {
		this.image_down_cnt = image_down_cnt;
	}
	public String getImage_del_yn() {
		return image_del_yn;
	}
	public void setImage_del_yn(String image_del_yn) {
		this.image_del_yn = image_del_yn;
	}
	public String getImage_reg_date() {
		return image_reg_date;
	}
	public void setImage_reg_date(String image_reg_date) {
		this.image_reg_date = image_reg_date;
	}
	
	@Override
	public String toString() {
		return "ImageVO [image_no=" + image_no + ", image_parent_no=" + image_parent_no + ", image_category="
				+ image_category + ", image_file_name=" + image_file_name + ", image_original_name="
				+ image_original_name + ", image_file_size=" + image_file_size + ", image_fancy_size="
				+ image_fancy_size + ", image_content_type=" + image_content_type + ", image_path=" + image_path
				+ ", image_down_cnt=" + image_down_cnt + ", image_del_yn=" + image_del_yn + ", image_reg_date="
				+ image_reg_date + ", getImage_no()=" + getImage_no() + ", getImage_parent_no()=" + getImage_parent_no()
				+ ", getImage_category()=" + getImage_category() + ", getImage_file_name()=" + getImage_file_name()
				+ ", getImage_original_name()=" + getImage_original_name() + ", getImage_file_size()="
				+ getImage_file_size() + ", getImage_fancy_size()=" + getImage_fancy_size()
				+ ", getImage_content_type()=" + getImage_content_type() + ", getImage_path()=" + getImage_path()
				+ ", getImage_down_cnt()=" + getImage_down_cnt() + ", getImage_del_yn()=" + getImage_del_yn()
				+ ", getImage_reg_date()=" + getImage_reg_date() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}

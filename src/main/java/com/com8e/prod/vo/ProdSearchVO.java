package com.com8e.prod.vo;

import com.com8e.common.vo.PagingVO;

public class ProdSearchVO extends PagingVO{
	
	private String searchType = "";
	private String searchWord = ""; 
	private String searchClass = "";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchClass() {
		return searchClass;
	}
	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
	}
	@Override
	public String toString() {
		return "ProdSearchVO [searchType=" + searchType + ", searchWord=" + searchWord + ", searchClass=" + searchClass
				+ "]";
	} 

	
	
}

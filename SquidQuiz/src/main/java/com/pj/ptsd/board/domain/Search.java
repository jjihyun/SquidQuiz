package com.pj.ptsd.board.domain;

public class Search {
	
	private String searchCondition;
	private String searchValue;
	
	public Search() {}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "Search [검색조건=" + searchCondition + ", 검색키워드=" + searchValue + "]";
	}
	
	

}

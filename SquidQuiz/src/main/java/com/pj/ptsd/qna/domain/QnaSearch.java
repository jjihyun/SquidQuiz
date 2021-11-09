package com.pj.ptsd.qna.domain;

public class QnaSearch {
	private String searchCondition;
	private String searchValue;
	
	public QnaSearch() {}

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
		return "QnaSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}
	
}
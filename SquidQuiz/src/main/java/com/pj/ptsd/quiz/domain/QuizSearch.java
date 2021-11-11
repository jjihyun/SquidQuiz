package com.pj.ptsd.quiz.domain;

public class QuizSearch {
	private String searchCondition; //검색조건
	private String searchValue; //키워드
	
	public QuizSearch() {
		
	}

	public QuizSearch(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

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
		return "QuizSearch [검색조건=" + searchCondition + ", 키워드=" + searchValue + "]";
	}
	
	
}

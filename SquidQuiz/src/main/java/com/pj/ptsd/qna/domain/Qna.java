package com.pj.ptsd.qna.domain;

import java.util.Date;

public class Qna {
	private int qnaNo;
	private String userId;
	private String qnaTitle;
	private String qnaContents;
	private Date qCreateDate;
	private String qnaAnswer;
	private Date qAnswerDate;

	
	//default constructor
	public Qna() {}
	
	
	//setter/getter
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	
	
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public Date getqCreateDate() {
		return qCreateDate;
	}
	public void setqCreateDate(Date qCreateDate) {
		this.qCreateDate = qCreateDate;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public Date getqAnswerDate() {
		return qAnswerDate;
	}
	public void setqAnswerDate(Date qAnswerDate) {
		this.qAnswerDate = qAnswerDate;
	}

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}




	//toString
	
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", userId=" + userId + ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents
				+ ", qCreateDate=" + qCreateDate + ", qnaAnswer=" + qnaAnswer + ", qAnswerDate=" + qAnswerDate + "]";
	}
	
	
	
}

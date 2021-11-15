package com.pj.ptsd.board.domain;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private int bNo;
	private String replyContents;
	private String userId;
	private Date rCreateDate;
	private Date rUpdateDate;
	
	
	public Reply()  {}

	
	

	public Reply(int replyNo, int bNo, String replyContents, String userId, Date rCreateDate, Date rUpdateDate) {
		super();
		this.replyNo = replyNo;
		this.bNo = bNo;
		this.replyContents = replyContents;
		this.userId = userId;
		this.rCreateDate = rCreateDate;
		this.rUpdateDate = rUpdateDate;
	}




	public int getReplyNo() {
		return replyNo;
	}


	public int getbNo() {
		return bNo;
	}


	public String getReplyContents() {
		return replyContents;
	}


	public String getUserId() {
		return userId;
	}


	public Date getrCreateDate() {
		return rCreateDate;
	}


	public Date getrUpdateDate() {
		return rUpdateDate;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}


	public void setrUpdateDate(Date rUpdateDate) {
		this.rUpdateDate = rUpdateDate;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", bNo=" + bNo + ", replyContents=" + replyContents + ", userId=" + userId
				+ ", rCreateDate=" + rCreateDate + ", rUpdateDate=" + rUpdateDate + "]";
	}
}

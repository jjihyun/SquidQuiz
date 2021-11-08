package com.pj.ptsd.board.domain;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private int BoardNo;
	private String replyContents;
	private String replyWriter;
	private Date rCreateDate;
	private Date rUpdateDate;
	private String rStatus;
	
	public Reply()  {}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return BoardNo;
	}

	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrUpdateDate() {
		return rUpdateDate;
	}

	public void setrUpdateDate(Date rUpdateDate) {
		this.rUpdateDate = rUpdateDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", BoardNo=" + BoardNo + ", replyContents=" + replyContents
				+ ", replyWriter=" + replyWriter + ", rCreateDate=" + rCreateDate + ", rUpdateDate=" + rUpdateDate
				+ ", rStatus=" + rStatus + "]";
	}
}

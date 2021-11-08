package com.pj.ptsd.board.domain;

import java.sql.Date;

public class reply_report {

	private int rReportNo;
	private int replyNo;
	private int boardNo;
	private String rReportId;
	private Date rDate;
	
	public reply_report() {}

	public int getrReportNo() {
		return rReportNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public String getrReportId() {
		return rReportId;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrReportNo(int rReportNo) {
		this.rReportNo = rReportNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public void setrReportId(String rReportId) {
		this.rReportId = rReportId;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	@Override
	public String toString() {
		return "reply_report [rReportNo=" + rReportNo + ", replyNo=" + replyNo + ", boardNo=" + boardNo + ", rReportId="
				+ rReportId + ", rDate=" + rDate + "]";
	}
	
	
	
	
	
	
	
	
}

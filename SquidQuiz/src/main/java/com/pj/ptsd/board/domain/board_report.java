package com.pj.ptsd.board.domain;

import java.sql.Date;

public class board_report {
   
	private int bReportNo;
	private int boardNo;
	private String userId;
	private Date bReport_Date;
	
	public board_report() {}

	public int getbReportNo() {
		return bReportNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public Date getbReport_Date() {
		return bReport_Date;
	}

	public void setbReportNo(int bReportNo) {
		this.bReportNo = bReportNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setbReport_Date(Date bReport_Date) {
		this.bReport_Date = bReport_Date;
	}

	@Override
	public String toString() {
		return "board_report [bReportNo=" + bReportNo + ", boardNo=" + boardNo + ", userId=" + userId
				+ ", bReport_Date=" + bReport_Date + "]";
	}
}

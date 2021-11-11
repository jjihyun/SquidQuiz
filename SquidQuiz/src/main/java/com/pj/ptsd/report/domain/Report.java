package com.pj.ptsd.report.domain;

import java.util.Date;

public class Report {
	private int reportNo;
	private String reportedUserId;
	private String boardTitle;
	private String boardWriter;
	private Date boardReportDate;
	
	public Report() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportedUserId() {
		return reportedUserId;
	}

	public void setReportedUserId(String reportedUserId) {
		this.reportedUserId = reportedUserId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public Date getBoardReportDate() {
		return boardReportDate;
	}

	public void setBoardReportDate(Date boardReportDate) {
		this.boardReportDate = boardReportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportedUserId=" + reportedUserId + ", boardTitle=" + boardTitle
				+ ", boardWriter=" + boardWriter + ", boardReportDate=" + boardReportDate + "]";
	}
	
	
	
}

package com.pj.ptsd.report.domain;

import java.util.Date;

public class ReplyReport {
	private int replyReportNo;
	private int replyNo;
	private int boardNo;
	private String reportedUserId;
	private String replyContents;
	private String replyWriter;
	private Date replyReportDate;
	
	public ReplyReport() {}
	
	//getter/setter
	
	
	public int getBoardNo() {
		return boardNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReplyReportNo() {
		return replyReportNo;
	}
	public void setReplyReportNo(int replyReportNo) {
		this.replyReportNo = replyReportNo;
	}
	public String getReportedUserId() {
		return reportedUserId;
	}
	public void setReportedUserId(String reportedUserId) {
		this.reportedUserId = reportedUserId;
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
	public Date getReplyReportDate() {
		return replyReportDate;
	}
	public void setReplyReportDate(Date replyReportDate) {
		this.replyReportDate = replyReportDate;
	}
	@Override
	public String toString() {
		return "ReplyReport [replyReportNo=" + replyReportNo + ", reportedUserId=" + reportedUserId + ", replyContents="
				+ replyContents + ", replyWriter=" + replyWriter + ", replyReportDate=" + replyReportDate + "]";
	}
	
}

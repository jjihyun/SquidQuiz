package com.pj.ptsd.report.domain;

import java.util.Date;

public class ReplyReport {
	private int replyReportNo;
	private String reportedUserId;
	private String replyContents;
	private String replyWriter;
	private Date replyReportDate;
	
	public ReplyReport() {}

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

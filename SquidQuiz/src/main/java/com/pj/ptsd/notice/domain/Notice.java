package com.pj.ptsd.notice.domain;

import java.sql.Date;

public class Notice {
	private int NoticeNo;
	private String NoticeTitle;
	private String NoticeContents;
	private Date noticeDate;
	
	public Notice() {}

	public int getNoticeNo() {
		return NoticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		NoticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return NoticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		NoticeTitle = noticeTitle;
	}

	public String getNoticeContents() {
		return NoticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		NoticeContents = noticeContents;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	@Override
	public String toString() {
		return "Notice [NoticeNo=" + NoticeNo + ", NoticeTitle=" + NoticeTitle + ", NoticeContents=" + NoticeContents
				+ ", noticeDate=" + noticeDate + "]";
	}
	
	
	
	
}

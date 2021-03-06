package com.pj.ptsd.board.domain;

import java.sql.Date;

public class Board {

	
	private int bNo;
	private int rownum;
	private String bTitle;
	private String bContents;
	private String userId;
	private String bFileName;
	private String bFileRename;
	private String bFilePath;
	private Date bCreateDate;
	private Date bUpdateDate;
	//게시판 목록 제목옆에 댓글수 보여기	
	//private int recnt;  
	
	
	public Board() {}


	public int getbNo() {
		return bNo;
	}


	public int getRownum() {
		return rownum;
	}


	public String getbTitle() {
		return bTitle;
	}


	public String getbContents() {
		return bContents;
	}


	public String getUserId() {
		return userId;
	}


	public String getbFileName() {
		return bFileName;
	}


	public String getbFileRename() {
		return bFileRename;
	}


	public String getbFilePath() {
		return bFilePath;
	}


	public Date getbCreateDate() {
		return bCreateDate;
	}


	public Date getbUpdateDate() {
		return bUpdateDate;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public void setbContents(String bContents) {
		this.bContents = bContents;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public void setbFileName(String bFileName) {
		this.bFileName = bFileName;
	}


	public void setbFileRename(String bFileRename) {
		this.bFileRename = bFileRename;
	}


	public void setbFilePath(String bFilePath) {
		this.bFilePath = bFilePath;
	}


	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}


	public void setbUpdateDate(Date bUpdateDate) {
		this.bUpdateDate = bUpdateDate;
	}


	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", rownum=" + rownum + ", bTitle=" + bTitle + ", bContents=" + bContents
				+ ", userId=" + userId + ", bFileName=" + bFileName + ", bFileRename=" + bFileRename + ", bFilePath="
				+ bFilePath + ", bCreateDate=" + bCreateDate + ", bUpdateDate=" + bUpdateDate + "]";
	}	
	
}

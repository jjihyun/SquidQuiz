package com.pj.ptsd.board.domain;

import java.sql.Date;

public class Board {

	
	private int bNo;
	private String bTitle;
	private String bContents;
	private int userNo;
	private String bFileName;
	private String bFileRename;
	private int bFileSize;
	private String bFilePath;
	private Date bCreateDate;
	private Date bUpdateDate;
	
	
	public Board() {}


	public int getbNo() {
		return bNo;
	}


	public String getbTitle() {
		return bTitle;
	}


	public String getbContents() {
		return bContents;
	}


	public int getUserNo() {
		return userNo;
	}


	public String getbFileName() {
		return bFileName;
	}


	public String getbFileRename() {
		return bFileRename;
	}


	public int getbFileSize() {
		return bFileSize;
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


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public void setbContents(String bContents) {
		this.bContents = bContents;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public void setbFileName(String bFileName) {
		this.bFileName = bFileName;
	}


	public void setbFileRename(String bFileRename) {
		this.bFileRename = bFileRename;
	}


	public void setbFileSize(int bFileSize) {
		this.bFileSize = bFileSize;
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
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContents=" + bContents + ", userNo=" + userNo
				+ ", bFileName=" + bFileName + ", bFileRename=" + bFileRename + ", bFileSize=" + bFileSize
				+ ", bFilePath=" + bFilePath + ", bCreateDate=" + bCreateDate + ", bUpdateDate=" + bUpdateDate + "]";
	}


}

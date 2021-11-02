package com.pj.ptsd.board.domain;

import java.sql.Date;

public class Board {

	
	private int boardNo;
	private String boardTitle;
	private String boardContents;
	private int userNo;
	private String boardFilename;
	private int boardFilesize;
	private String boardFilepath;
	private Date bdate;
	private Date bFiledate;
	
	
	public Board() {}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContents() {
		return boardContents;
	}


	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getBoardFilename() {
		return boardFilename;
	}


	public void setBoardFilename(String boardFilename) {
		this.boardFilename = boardFilename;
	}


	public int getBoardFilesize() {
		return boardFilesize;
	}


	public void setBoardFilesize(int boardFilesize) {
		this.boardFilesize = boardFilesize;
	}


	public String getBoardFilepath() {
		return boardFilepath;
	}


	public void setBoardFilepath(String boardFilepath) {
		this.boardFilepath = boardFilepath;
	}


	public Date getBdate() {
		return bdate;
	}


	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}


	public Date getbFiledate() {
		return bFiledate;
	}


	public void setbFiledate(Date bFiledate) {
		this.bFiledate = bFiledate;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContents=" + boardContents
				+ ", userNo=" + userNo + ", boardFilename=" + boardFilename + ", boardFilesize=" + boardFilesize
				+ ", boardFilepath=" + boardFilepath + ", bdate=" + bdate + ", bFiledate=" + bFiledate + "]";
	}
	
	
	
	
	
}

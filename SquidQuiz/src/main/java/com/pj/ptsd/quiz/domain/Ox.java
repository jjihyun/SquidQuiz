package com.pj.ptsd.quiz.domain;

import java.util.Date;

public class Ox {
	private int oxNo;
	private String oxTitle;
	private String oxContents;
	private String oxCommentary; //해설
	private String oxAnswer; //정답
//	private String oxQuestion1;
//	private String oxQuestion2;
	private Date oxEnrollDate;
	private String oxFileName;
	private String oxFileRename;
	
	public Ox() {
		super();
	}

	public int getOxNo() {
		return oxNo;
	}

	public void setOxNo(int oxNo) {
		this.oxNo = oxNo;
	}

	public String getOxTitle() {
		return oxTitle;
	}

	public void setOxTitle(String oxTitle) {
		this.oxTitle = oxTitle;
	}

	public String getOxContents() {
		return oxContents;
	}

	public void setOxContents(String oxContents) {
		this.oxContents = oxContents;
	}
	
	public String getOxCommentary() {
		return oxCommentary;
	}

	public void setOxCommentary(String oxCommentary) {
		this.oxCommentary = oxCommentary;
	}

	public String getOxAnswer() {
		return oxAnswer;
	}

	public void setOxAnswer(String oxAnswer) {
		this.oxAnswer = oxAnswer;
	}

//	public String getOxQuestion1() {
//		return oxQuestion1;
//	}
//
//	public void setOxQuestion1(String oxQuestion1) {
//		this.oxQuestion1 = oxQuestion1;
//	}
//
//	public String getOxQuestion2() {
//		return oxQuestion2;
//	}
//
//	public void setOxQuestion2(String oxQuestion2) {
//		this.oxQuestion2 = oxQuestion2;
//	}

	public Date getOxEnrollDate() {
		return oxEnrollDate;
	}

	public void setOxEnrollDate(Date oxEnrollDate) {
		this.oxEnrollDate = oxEnrollDate;
	}
	
	public String getOxFileName() {
		return oxFileName;
	}

	public void setOxFileName(String oxFileName) {
		this.oxFileName = oxFileName;
	}

	public String getOxFileRename() {
		return oxFileRename;
	}
	
	public void setOxFileRename(String oxFileRename) {
		this.oxFileRename = oxFileRename;
	}

	@Override
	public String toString() {
		return "Ox [ox번호=" + oxNo + ", ox제목=" + oxTitle + ", ox내용=" + oxContents +",ox해설"+oxCommentary+", ox정답=" + oxAnswer+", ox등록일=" + oxEnrollDate
				+ ", 이미지이름=" + oxFileName + ", 새이미지이름=" + oxFileRename + "]";
	}
	
	
	
	
}

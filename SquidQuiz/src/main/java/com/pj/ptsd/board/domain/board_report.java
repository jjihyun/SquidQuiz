package com.pj.ptsd.board.domain;

public class board_report {
   
	private int rReportNo;
	private int replyNo;
	private int boardNo;
	private String rReportId;
	private int userNo;
	
	public board_report() {}

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

	public int getUserNo() {
		return userNo;
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

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "board_report [rReportNo=" + rReportNo + ", replyNo=" + replyNo + ", boardNo=" + boardNo + ", rReportId="
				+ rReportId + ", userNo=" + userNo + "]";
	}
	
	
	
	
}

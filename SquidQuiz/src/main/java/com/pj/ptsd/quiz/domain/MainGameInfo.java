package com.pj.ptsd.quiz.domain;

import java.util.Date;

public class MainGameInfo {
//	private int oxNo; //ox퀴즈번호
//	private String fileName; //파일이름
//	private String oxContents; //ox퀴즈 문제
//	private String oxCommentary; //ox퀴즈 해설
//	private String oxAnswer; //ox퀴즈 정답
	private int turnNo; //게임회차
	private int participantTotal; //참가자 수
	private int moneyTotal; //총 상금
	private int moneyReceive; //
	private String winnerId; // 우승자
	private Date openDate; // 시작한 날짜 
	private String quizGameStatus; // 게임 시작/종료
	

	public MainGameInfo(int turnNo, int participantTotal, int moneyTotal, int moneyReceive, String winnerId,
			Date openDate, String quizGameStatus) {
		super();
		this.turnNo = turnNo;
		this.participantTotal = participantTotal;
		this.moneyTotal = moneyTotal;
		this.moneyReceive = moneyReceive;
		this.winnerId = winnerId;
		this.openDate = openDate;
		this.quizGameStatus = quizGameStatus;
	}


	public int getTurnNo() {
		return turnNo;
	}


	public void setTurnNo(int turnNo) {
		this.turnNo = turnNo;
	}


	public int getParticipantTotal() {
		return participantTotal;
	}


	public void setParticipantTotal(int participantTotal) {
		this.participantTotal = participantTotal;
	}


	public int getMoneyTotal() {
		return moneyTotal;
	}


	public void setMoneyTotal(int moneyTotal) {
		this.moneyTotal = moneyTotal;
	}


	public int getMoneyReceive() {
		return moneyReceive;
	}


	public void setMoneyReceive(int moneyReceive) {
		this.moneyReceive = moneyReceive;
	}


	public String getWinnerId() {
		return winnerId;
	}


	public void setWinnerId(String winnerId) {
		this.winnerId = winnerId;
	}


	public Date getOpenDate() {
		return openDate;
	}


	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}


	public String getQuizGameStatus() {
		return quizGameStatus;
	}


	public void setQuizGameStatus(String quizGameStatus) {
		this.quizGameStatus = quizGameStatus;
	}


	@Override
	public String toString() {
		return "MainGameInfo [turnNo=" + turnNo + ", participantTotal=" + participantTotal + ", moneyTotal="
				+ moneyTotal + ", moneyReceive=" + moneyReceive + ", winnerId=" + winnerId + ", openDate=" + openDate
				+ ", quizGameStatus=" + quizGameStatus + "]";
	}

	
	
	
}


package com.pj.ptsd.quiz.domain;

import java.util.Date;

public class MainGameInfo {
	private int turnNo;
	private int participantTotal;
	private int moneyTotal;
	private int moneyReceive;
	private String winnerId;
	private Date openDate;
	
	
	public MainGameInfo(int turnNo, int participantTotal, int moneyTotal, int moneyReceive, String winnerId,
			Date openDate) {
		super();
		this.turnNo = turnNo;
		this.participantTotal = participantTotal;
		this.moneyTotal = moneyTotal;
		this.moneyReceive = moneyReceive;
		this.winnerId = winnerId;
		this.openDate = openDate;
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


	@Override
	public String toString() {
		return "MainGameInfo [turnNo=" + turnNo + ", participantTotal=" + participantTotal + ", moneyTotal="
				+ moneyTotal + ", moneyReceive=" + moneyReceive + ", winnerId=" + winnerId + ", openDate=" + openDate
				+ "]";
	}
	
	
}


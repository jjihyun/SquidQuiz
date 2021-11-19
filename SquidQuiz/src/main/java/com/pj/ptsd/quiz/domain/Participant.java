package com.pj.ptsd.quiz.domain;

import java.util.Date;

public class Participant {
	
	private String participantId;
	private int turnNo;
	private int cottectAnswers;
	private Date entryDate;
	
	public Participant() {}
	
	
	

	public Participant(String participantId, int turnNo, int cottectAnswers, Date entryDate) {
		super();
		this.participantId = participantId;
		this.turnNo = turnNo;
		this.cottectAnswers = cottectAnswers;
		this.entryDate = entryDate;
	}




	public String getParticipantId() {
		return participantId;
	}

	public void setParticipantId(String participantId) {
		this.participantId = participantId;
	}

	public int getTurnNo() {
		return turnNo;
	}

	public void setTurnNo(int turnNo) {
		this.turnNo = turnNo;
	}

	public int getCottectAnswers() {
		return cottectAnswers;
	}

	public void setCottectAnswers(int cottectAnswers) {
		this.cottectAnswers = cottectAnswers;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	@Override
	public String toString() {
		return "Participant [participantId=" + participantId + ", turnNo=" + turnNo + ", cottectAnswers="
				+ cottectAnswers + ", entryDate=" + entryDate + "]";
	}
	
	
	

}
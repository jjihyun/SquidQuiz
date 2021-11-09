package com.pj.ptsd.quiz.domain;

public class Participant {
	
	private String participantNo;
	private int turnNo;
	private int cottectAnswers;
	
	public Participant() {}
	
	

	public Participant(String participantNo, int turnNo, int cottectAnswers) {
		super();
		this.participantNo = participantNo;
		this.turnNo = turnNo;
		this.cottectAnswers = cottectAnswers;
	}



	public String getParticipantNo() {
		return participantNo;
	}

	public void setParticipantNo(String participantNo) {
		this.participantNo = participantNo;
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

	@Override
	public String toString() {
		return "Participant [participantNo=" + participantNo + ", turnNo=" + turnNo + ", cottectAnswers="
				+ cottectAnswers + "]";
	}
	
	

}

package com.pj.ptsd.mypage.domain;

import java.util.Date;

public class ChargePoint {
	
	private int pointNo;
	private int userName;
	private int chargePoint;
	private Date pointDate;
	
	public ChargePoint() {}
	
	

	public ChargePoint(int pointNo, int userName, int chargePoint, Date pointDate) {
		super();
		this.pointNo = pointNo;
		this.userName = userName;
		this.chargePoint = chargePoint;
		this.pointDate = pointDate;
	}



	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getUserName() {
		return userName;
	}

	public void setUserName(int userName) {
		this.userName = userName;
	}

	public int getChargePoint() {
		return chargePoint;
	}

	public void setChargePoint(int chargePoint) {
		this.chargePoint = chargePoint;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	@Override
	public String toString() {
		return "ChargePoint [pointNo=" + pointNo + ", userName=" + userName + ", chargePoint=" + chargePoint
				+ ", pointDate=" + pointDate + "]";
	}
	
	
	

}

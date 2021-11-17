package com.pj.ptsd.user.domain;

import java.util.Date;

public class ChargePoint {
		private int pointNo;
		private int userNo;
		private int chargePoint;
		private Date pointDate;
		
		
		public ChargePoint() {}
		
		


		public ChargePoint(int pointNo, int userNo, int chargePoint, Date pointDate) {
			super();
			this.pointNo = pointNo;
			this.userNo = userNo;
			this.chargePoint = chargePoint;
			this.pointDate = pointDate;
		}




		public int getPointNo() {
			return pointNo;
		}


		public void setPointNo(int pointNo) {
			this.pointNo = pointNo;
		}


		public int getUserNo() {
			return userNo;
		}


		public void setUserNo(int userNo) {
			this.userNo = userNo;
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
			return "ChargePoint [pointNo=" + pointNo + ", userNo=" + userNo + ", chargePoint=" + chargePoint
					+ ", pointDate=" + pointDate + "]";
		}
		
		

}

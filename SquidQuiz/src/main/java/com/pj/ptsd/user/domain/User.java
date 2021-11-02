package com.pj.ptsd.user.domain;

public class User {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String bankName;
	private int bankAccount;
	private String userAddr;
	private int point;
	private char adminType;
	private char gameType;
	
	public User() {}
	
	

	public User(int userNo, String userId, String userPwd, String userName, String userEmail, String userPhone,
			String bankName, int bankAccount, String userAddr, int point, char adminType, char gameType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
		this.userAddr = userAddr;
		this.point = point;
		this.adminType = adminType;
		this.gameType = gameType;
	}



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public int getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(int bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public char getAdminType() {
		return adminType;
	}

	public void setAdminType(char adminType) {
		this.adminType = adminType;
	}

	public char getGameType() {
		return gameType;
	}

	public void setGameType(char gameType) {
		this.gameType = gameType;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", bankName=" + bankName + ", bankAccount="
				+ bankAccount + ", userAddr=" + userAddr + ", point=" + point + ", adminType=" + adminType
				+ ", gameType=" + gameType + "]";
	}
	
	

}

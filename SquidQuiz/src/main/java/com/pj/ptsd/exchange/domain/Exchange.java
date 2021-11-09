package com.pj.ptsd.exchange.domain;

import java.sql.Date;

public class Exchange {
	private int exchangeNo;
	private int userNo;
	private Date exchangeEnrollDate;
	private Date exchangeDate;
	private String exchangeStatus;
	private int exchangeMoney;
	private int account;
	private String exchangeBank;
	private String userName;
	
	public Exchange() {}
	
	public String getExchangeBank() {
		return exchangeBank;
	}

	public void setExchangeBank(String exchangeBank) {
		this.exchangeBank = exchangeBank;
	}

	public int getExchangeNo() {
		return exchangeNo;
	}

	public void setExchangeNo(int exchangeNo) {
		this.exchangeNo = exchangeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getExchangeEnrollDate() {
		return exchangeEnrollDate;
	}

	public void setExchangeEnrollDate(Date exchangeEnrollDate) {
		this.exchangeEnrollDate = exchangeEnrollDate;
	}

	public Date getExchangeDate() {
		return exchangeDate;
	}

	public void setExchangeDate(Date exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public String getExchangeStatus() {
		return exchangeStatus;
	}

	public void setExchangeStatus(String exchangeStatus) {
		this.exchangeStatus = exchangeStatus;
	}

	public int getExchangeMoney() {
		return exchangeMoney;
	}

	public void setExchangeMoney(int exchangeMoney) {
		this.exchangeMoney = exchangeMoney;
	}

	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Exchange [exchangeNo=" + exchangeNo + ", userNo=" + userNo + ", exchangeEnrollDate="
				+ exchangeEnrollDate + ", exchangeDate=" + exchangeDate + ", exchangeStatus=" + exchangeStatus
				+ ", exchangeMoney=" + exchangeMoney + ", account=" + account + ", userName=" + userName + "]";
	}
	
}

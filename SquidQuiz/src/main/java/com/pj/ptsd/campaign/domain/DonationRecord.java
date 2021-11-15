package com.pj.ptsd.campaign.domain;

import java.util.Date;

//고정 기부처 관련 도메인
public class DonationRecord {
	
	private int donationNo;  //회차별 번호
	private int donationPrice;  //회차별 기부금
	private int donationSumPrice;  //전체 기부금 합
	private Date donationDate; //회차별 기부날짜
	
	public DonationRecord() {}

	public DonationRecord(int donationNo, int donationPrice, int donationSumPrice, Date donationDate) {
		super();
		this.donationNo = donationNo;
		this.donationPrice = donationPrice;
		this.donationSumPrice = donationSumPrice;
		this.donationDate = donationDate;
	}

	public int getDonationNo() {
		return donationNo;
	}

	public void setDonationNo(int donationNo) {
		this.donationNo = donationNo;
	}

	public int getDonationPrice() {
		return donationPrice;
	}

	public void setDonationPrice(int donationPrice) {
		this.donationPrice = donationPrice;
	}

	public int getDonationSumPrice() {
		return donationSumPrice;
	}

	public void setDonationSumPrice(int donationSumPrice) {
		this.donationSumPrice = donationSumPrice;
	}

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}

	@Override
	public String toString() {
		return "DonationRecord [고정기부 번호=" + donationNo + ", 기부금액=" + donationPrice + ", 총 기부금액="
				+ donationSumPrice + ", 기부날짜=" + donationDate + "]";
	}
	
	
}

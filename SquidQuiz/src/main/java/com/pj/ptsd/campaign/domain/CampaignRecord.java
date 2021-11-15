package com.pj.ptsd.campaign.domain;

import java.util.Date;

//유저가 캠페인에 기부 관련 도메인
public class CampaignRecord {

	private int cRecordNo;
	private String userId;
	private int campaignNo;
	private int cRecordPoint;
	private Date cRecordDate;
	private String campaignName;
	
	public CampaignRecord() {}

	public int getcRecordNo() {
		return cRecordNo;
	}

	public void setcRecordNo(int cRecordNo) {
		this.cRecordNo = cRecordNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCampaignNo() {
		return campaignNo;
	}

	public void setCampaignNo(int campaignNo) {
		this.campaignNo = campaignNo;
	}

	public int getcRecordPoint() {
		return cRecordPoint;
	}

	public void setcRecordPoint(int cRecordPoint) {
		this.cRecordPoint = cRecordPoint;
	}

	public Date getcRecordDate() {
		return cRecordDate;
	}

	public void setcRecordDate(Date cRecordDate) {
		this.cRecordDate = cRecordDate;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	@Override
	public String toString() {
		return "CampaignRecord [cRecordNo=" + cRecordNo + ", userId=" + userId + ", campaignNo=" + campaignNo
				+ ", cRecordPoint=" + cRecordPoint + ", cRecordDate=" + cRecordDate + ", campaignName=" + campaignName
				+ "]";
	}
}

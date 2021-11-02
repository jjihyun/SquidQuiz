package com.pj.ptsd.campaign.domain;

import java.util.Date;

public class Campaign {
	private int campaignNo;
	private String campaignName;
	private String campaignType;
	private String campaignTitle;
	private String campaignContents;
	private String campaignLink;
	private int campaignTargetAmount;
	private int campaignNowAmout;
	private Date campaignEndDate;
	private String campaignFileName;
	private String campaignFileRename;
	private Date campaignEnrollDate;
	
	public Campaign() {}

	public int getCampaignNo() {
		return campaignNo;
	}

	public void setCampaignNo(int campaignNo) {
		this.campaignNo = campaignNo;
	}

	public String getCampaignName() {
		return campaignName;
	}

	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}

	public String getCampaignType() {
		return campaignType;
	}

	public void setCampaignType(String campaignType) {
		this.campaignType = campaignType;
	}

	public String getCampaignTitle() {
		return campaignTitle;
	}

	public void setCampaignTitle(String campaignTitle) {
		this.campaignTitle = campaignTitle;
	}

	public String getCampaignContents() {
		return campaignContents;
	}

	public void setCampaignContents(String campaignContents) {
		this.campaignContents = campaignContents;
	}

	public String getCampaignLink() {
		return campaignLink;
	}

	public void setCampaignLink(String campaignLink) {
		this.campaignLink = campaignLink;
	}

	public int getCampaignTargetAmount() {
		return campaignTargetAmount;
	}

	public void setCampaignTargetAmount(int campaignTargetAmount) {
		this.campaignTargetAmount = campaignTargetAmount;
	}

	public int getCampaignNowAmout() {
		return campaignNowAmout;
	}

	public void setCampaignNowAmout(int campaignNowAmout) {
		this.campaignNowAmout = campaignNowAmout;
	}

	public Date getCampaignEndDate() {
		return campaignEndDate;
	}

	public void setCampaignEndDate(Date campaignEndDate) {
		this.campaignEndDate = campaignEndDate;
	}

	public String getCampaignFileName() {
		return campaignFileName;
	}

	public void setCampaignFileName(String campaignFileName) {
		this.campaignFileName = campaignFileName;
	}

	public String getCampaignFileRename() {
		return campaignFileRename;
	}

	public void setCampaignFileRename(String campaignFileRename) {
		this.campaignFileRename = campaignFileRename;
	}

	public Date getCampaignEnrollDate() {
		return campaignEnrollDate;
	}

	public void setCampaignEnrollDate(Date campaignEnrollDate) {
		this.campaignEnrollDate = campaignEnrollDate;
	}

	@Override
	public String toString() {
		return "Campaign [번호=" + campaignNo + ", 캠페인명=" + campaignName + ", 종류="
				+ campaignType + ", 제목=" + campaignTitle + ", 내용=" + campaignContents
				+ ", 링크=" + campaignLink + ", 목표금액=" + campaignTargetAmount
				+ ", 현재모금액=" + campaignNowAmout + ", 종료일=" + campaignEndDate
				+ ", 파일업로드이름=" + campaignFileName + ", 파일재업로드이름=" + campaignFileRename
				+ ", 등록일=" + campaignEnrollDate + "]";
	}
	
	
	
}

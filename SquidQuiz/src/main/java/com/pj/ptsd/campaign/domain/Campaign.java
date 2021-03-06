package com.pj.ptsd.campaign.domain;

import java.util.Date;

public class Campaign {
	private int campaignNo;
	private String campaignName;
	private String campaignType;
	private String campaignTitle;
	private String campaignContents;
	private String cLink;
	private int cTargetAmount;
	private int cNowAmount;
	private Date cEndDate;
	private String cFileName;
	private String cFileRename;
	private Date cEnrollDate;
	
	public Campaign() {}

	public Campaign(int campaignNo, String campaignName, String campaignType, String campaignTitle,
			String campaignContents, String cLink, int cTargetAmount, int cNowAmount, Date cEndDate, String cFileName,
			String cFileRename, Date cEnrollDate) {
		super();
		this.campaignNo = campaignNo;
		this.campaignName = campaignName;
		this.campaignType = campaignType;
		this.campaignTitle = campaignTitle;
		this.campaignContents = campaignContents;
		this.cLink = cLink;
		this.cTargetAmount = cTargetAmount;
		this.cNowAmount = cNowAmount;
		this.cEndDate = cEndDate;
		this.cFileName = cFileName;
		this.cFileRename = cFileRename;
		this.cEnrollDate = cEnrollDate;
	}

	
	

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



	public String getcLink() {
		return cLink;
	}



	public void setcLink(String cLink) {
		this.cLink = cLink;
	}



	public int getcTargetAmount() {
		return cTargetAmount;
	}



	public void setcTargetAmount(int cTargetAmount) {
		this.cTargetAmount = cTargetAmount;
	}



	public int getcNowAmount() {
		return cNowAmount;
	}



	public void setcNowAmount(int cNowAmount) {
		this.cNowAmount = cNowAmount;
	}



	public Date getcEndDate() {
		return cEndDate;
	}



	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}



	public String getcFileName() {
		return cFileName;
	}



	public void setcFileName(String cFileName) {
		this.cFileName = cFileName;
	}



	public String getcFileRename() {
		return cFileRename;
	}



	public void setcFileRename(String cFileRename) {
		this.cFileRename = cFileRename;
	}



	public Date getcEnrollDate() {
		return cEnrollDate;
	}



	public void setcEnrollDate(Date cEnrollDate) {
		this.cEnrollDate = cEnrollDate;
	}


	@Override
	public String toString() {
		return "Campaign [??????=" + campaignNo + ", ????????????=" + campaignName + ", ??????="
				+ campaignType + ", ??????=" + campaignTitle + ", ??????=" + campaignContents
				+ ", ??????=" + cLink + ", ????????????=" + cTargetAmount + ", ???????????????=" + cNowAmount + ", ?????????="
				+ cEndDate + ", ?????????????????????=" + cFileName + ", ????????????????????????=" + cFileRename + ", ?????????="
				+ cEnrollDate + "]";
	}

}

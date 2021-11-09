package com.pj.ptsd.campaign.service;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;


public interface CampaignService {

	public int getListCount();  //캠페인 게시글 전체 개수
	public List<Campaign> printAll(PageInfo pi); //캠페인 게시글 리스트(전체) 조회
	public Campaign printCampaignDetail(int campaignNo);
	public int registerCampaign(Campaign campaign);
	public int removeCampaign(int campaignNo);
	public int modifyCampaign(Campaign campaign);
	public int printAllDonationRecord(); //고정 기부처에 기부된적이 한번이라도 있었는지 체크를 위해서
	public int printDonationRecord();  //고정 기부처의 누적 기부금액
	
}

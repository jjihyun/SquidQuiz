package com.pj.ptsd.campaign.service;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;


public interface CampaignService {

	public List<Campaign> printAll();

	public int getListCount();  //고정기부처 기부 개수
	public List<DonationRecord> printStaticRecord(PageInfo pi); //고정기부처 기부 리스트 조회
	public int getListCount(String type);  //캠페인 게시글 개수
	public List<Campaign> printAll(PageInfo pi); //캠페인 게시글 리스트(전체) 조회
	
	public Campaign printCampaignDetail(int campaignNo);
	public int registerCampaign(Campaign campaign);
	public int removeCampaign(int campaignNo);
	public int modifyCampaign(Campaign campaign);
	
	public int printAllDonationRecord(); //메인게임테이블에 값이 있는지 체크
	public int printDonationRecord();  //고정 기부처의 누적 기부금액
	public int printOneDonationRecord(); //고정 기부처의 현재 회차 금액


	
}

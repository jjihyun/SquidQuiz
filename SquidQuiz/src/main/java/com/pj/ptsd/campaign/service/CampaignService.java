package com.pj.ptsd.campaign.service;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;


public interface CampaignService {

	public int getListCount();  //캠페인 게시글 전체 개수
	public int getListTypeCount(String type);
	public List<Campaign> printAll(PageInfo pi); //캠페인 게시글 리스트(전체) 조회
	public List<Campaign> printAllType(PageInfo pi, String type); //임시
	
	public Campaign printCampaignDetail(int campaignNo);
	public int registerCampaign(Campaign campaign);
	public int removeCampaign(int campaignNo);
	public int modifyCampaign(Campaign campaign);
	
	public int printAllDonationRecord(); //메인게임테이블에 값이 있는지 체크
	public int printDonationRecord();  //고정 기부처의 누적 기부금액
	public int printOneDonationRecord(); //고정 기부처의 현재 회차 금액
	
}

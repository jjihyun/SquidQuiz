package com.pj.ptsd.campaign.service;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.PageInfo;


public interface CampaignService {

	public int getListCount();  //캠페인 게시글 전체 개수
	public List<Campaign> printAll(PageInfo pi);
	public Campaign printCampaignDetail(int campaignNo);
	public int registerCampaign(Campaign campaign);
	public int removeCampaign(int campaignNo);
	
	
}

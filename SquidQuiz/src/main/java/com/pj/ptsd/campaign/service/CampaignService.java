package com.pj.ptsd.campaign.service;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;


public interface CampaignService {

	public List<Campaign> printAll();
	public Campaign printCampaignDetail(int campaignNo);
	
}

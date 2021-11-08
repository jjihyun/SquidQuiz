package com.pj.ptsd.campaign.store;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;

public interface CampaignStore {

	public List<Campaign> selectAll();
	public Campaign selectDetail(int campaignNo);
	public int insertCampaign(Campaign campaign);
	public int deleteCampaign(int campaignNo);

}

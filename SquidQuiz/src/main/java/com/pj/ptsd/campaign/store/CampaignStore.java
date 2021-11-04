package com.pj.ptsd.campaign.store;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;

public interface CampaignStore {

	public List<Campaign> selectAll();
	public Campaign selectDetail(int campaignNo);

}

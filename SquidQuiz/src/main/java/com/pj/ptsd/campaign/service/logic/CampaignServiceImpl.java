package com.pj.ptsd.campaign.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.service.CampaignService;
import com.pj.ptsd.campaign.store.CampaignStore;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignStore store;
	
	//캠페인 목록 조회
	@Override
	public List<Campaign> printAll() {
		List<Campaign> cList = store.selectAll();
		return cList;
	}

	//캠페인 상세조회
	@Override
	public Campaign printCampaignDetail(int campaignNo) {
		Campaign camp = store.selectDetail(campaignNo);
		return camp;
	}

	//캠페인 글 등록
	@Override
	public int registerCampaign(Campaign campaign) {
		int result = store.insertCampaign(campaign);
		return result;
	}

	//캠페인 글 삭제
	@Override
	public int removeCampaign(int campaignNo) {
		int result = store.deleteCampaign(campaignNo);
		return result;
	}

}

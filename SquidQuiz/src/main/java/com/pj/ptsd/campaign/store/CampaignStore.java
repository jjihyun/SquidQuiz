package com.pj.ptsd.campaign.store;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;

public interface CampaignStore {

	public int selectListCount();  //캠페인 게시글 총 개수
	public List<Campaign> selectAll(PageInfo pi);
	public Campaign selectDetail(int campaignNo);
	public int insertCampaign(Campaign campaign);
	public int deleteCampaign(int campaignNo);
	public int updateCampaign(Campaign campaign);

	public int selectAllDonation();	//고정 기부처에 기부 최소 한번 유무 체크
	public int selectDonationSumPrice(); //고정 기부처의 누적 기부금액

}

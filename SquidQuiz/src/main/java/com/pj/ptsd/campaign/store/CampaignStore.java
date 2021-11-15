package com.pj.ptsd.campaign.store;

import java.util.List;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.quiz.domain.MainGameInfo;

public interface CampaignStore {

	public List<Campaign> selectAll();

	public int selectListStaticCount(); //고정기부처 기부 개수
	public List<DonationRecord> selectListStatic(PageInfo pi); 	//고정기부처 기부 리스트 조회
	
	public int selectListCount(String type);    //캠페인 게시글 개수
	public List<Campaign> selectAll(PageInfo pi);

	public Campaign selectDetail(int campaignNo);
	public int insertCampaign(Campaign campaign);
	public int deleteCampaign(int campaignNo);
	public int updateCampaign(Campaign campaign);

	public int selectAllDonation();  	//메인게임테이블에 값이 있는지 체크
	public int selectDonationSumPrice();   //고정 기부처의 누적 기부금액
	public int selectDonationPrice();  //고정 기부처의 현재 회차 금액

	public int insertCampaignRecord(CampaignRecord cRecord); //캠페인 기부하기

	public int selectPointCount(String userId);

	public int updateCampaignMoney(int moneySum);



}

package com.pj.ptsd.campaign.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.campaign.service.CampaignService;
import com.pj.ptsd.campaign.store.CampaignStore;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignStore store;

	//캠페인 게시글 전체 개수
	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}
	//캠페인 목록 조회
	@Override
	public List<Campaign> printAll(PageInfo pi) {
		List<Campaign> cList = store.selectAll(pi);
		return cList;
	}
	//고정 기부처에 기부 최소 한번 유무 체크
	@Override
	public int printAllDonationRecord() {
		int dRecord = store.selectAllDonation();
		return dRecord;
	}
	//고정 기부처의 누적 기부금, 회자 기부금 조회
	@Override
	public int printDonationRecord() {
		int donationSumPrice = store.selectDonationSumPrice();
		return donationSumPrice;
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
	
	//캠페인 글 수정
	@Override
	public int modifyCampaign(Campaign campaign) {
		int result = store.updateCampaign(campaign);
		return result;
	}


}

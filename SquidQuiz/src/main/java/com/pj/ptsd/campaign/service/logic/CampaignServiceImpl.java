package com.pj.ptsd.campaign.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.campaign.service.CampaignService;
import com.pj.ptsd.campaign.store.CampaignStore;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignStore store;

	@Override
	public List<Campaign> printAll() {
		List<Campaign> cList = store.selectAll();
		return cList;
	}
	
	//고정기부처 기부 개수
	@Override
	public int getListCount() {
		int totalCount = store.selectListStaticCount();
		return totalCount;
	}
	//고정기부처 기부 리스트 조회
	@Override
	public List<DonationRecord> printStaticRecord(PageInfo pi) {
		List<DonationRecord> dRList = store.selectListStatic(pi);
		return dRList;
	}
	
	//캠페인 게시글 개수
	@Override
	public int getListCount(String type) {
		int totalCount = store.selectListCount(type);
		//System.out.println("service의 totalCount : "+totalCount);
		return totalCount;
	}

	//캠페인 목록 조회
	@Override
	public List<Campaign> printAll(PageInfo pi) {
		List<Campaign> cList = store.selectAll(pi);
		return cList;
	}

	//메인게임테이블에 값이 있는지 체크
	@Override
	public int printAllDonationRecord() {
		int dRecord = store.selectAllDonation();
		return dRecord;
	}
	//고정 기부처의 누적 기부금
	@Override
	public int printDonationRecord() {
		int donationSumPrice = store.selectDonationSumPrice();
		return donationSumPrice;
	}
	// 회자 기부금 조회
	@Override
	public int printOneDonationRecord() {
		int dPrice = store.selectDonationPrice();
		return dPrice;
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

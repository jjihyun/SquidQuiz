package com.pj.ptsd.campaign.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.store.CampaignStore;

@Repository
public class CampaignStoreLogic implements CampaignStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//캠페인 목록 조회
	@Override
	public List<Campaign> selectAll() {
		List<Campaign> cList = sqlSession.selectList("campaignMapper.selectCampaignList");
		return cList;
	}

	//캠페인 상세조회
	@Override
	public Campaign selectDetail(int campaignNo) {
		Campaign campaign = sqlSession.selectOne("campaignMapper.selectOneCampaign", campaignNo);
		return campaign;
	}

}

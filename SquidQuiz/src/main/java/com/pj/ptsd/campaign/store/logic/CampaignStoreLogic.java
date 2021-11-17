package com.pj.ptsd.campaign.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.campaign.store.CampaignStore;
import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.user.domain.User;

@Repository
public class CampaignStoreLogic implements CampaignStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//다른 후원보기(기부 디테일 페이지에서)
	@Override
	public List<Campaign> selectAll() {
		List<Campaign> cList = sqlSession.selectList("campaignMapper.selectCampaignRandomList");
		return cList;
	}
	
	//고정기부처 기부 개수
	@Override
	public int selectListStaticCount() {
		int count = sqlSession.selectOne("campaignMapper.selectListStaticCount");
		return count;
	}
	//고정기부처 기부 리스트 조회
	@Override
	public List<DonationRecord> selectListStatic(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getCampaignLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getCampaignLimit());
		List<DonationRecord> dRList = sqlSession.selectList("campaignMapper.selectCampaignStaticList", pi, rowBounds);
		return dRList;
	}
	
	//캠페인 게시글 개수
	@Override
	public int selectListCount(String type) {
		int count = sqlSession.selectOne("campaignMapper.selectListCount", type);
		//System.out.println("store의 count : "+count);
		return count;
	}
	
	//캠페인 목록 조회
	@Override
	public List<Campaign> selectAll(PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getCampaignLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getCampaignLimit());
		List<Campaign> cList = sqlSession.selectList("campaignMapper.selectCampaignList", pi, rowBounds);
		return cList;
	}
	
	//메인게임테이블에 값이 있는지 체크
	@Override
	public int selectAllDonation() {
		int dRecord = sqlSession.selectOne("campaignMapper.selectAllDonation");
		return dRecord;
	}
	//고정 기부처의 누적 기부금액 조회
	@Override
	public int selectDonationSumPrice() {
		int sumPrice = sqlSession.selectOne("campaignMapper.selectSumPrice");
		return sumPrice;
	}
	//회차 기부금액 조회
	@Override
	public int selectDonationPrice() {
		int dPrice = sqlSession.selectOne("campaignMapper.selectPrice");
		return dPrice;
	}
	

	//캠페인 상세조회
	@Override
	public Campaign selectDetail(int campaignNo) {
		Campaign campaign = sqlSession.selectOne("campaignMapper.selectOneCampaign", campaignNo);
		return campaign;
	}

	//캠페인 글 등록
	@Override
	public int insertCampaign(Campaign campaign) {
		int result = sqlSession.insert("campaignMapper.insertCampaign", campaign);
		return result;
	}

	//캠페인 글 삭제
	@Override
	public int deleteCampaign(int campaignNo) {
		int result = sqlSession.delete("campaignMapper.deleteCampaign", campaignNo);
		return result;
	}
	
	//캠페인 글 수정
	@Override
	public int updateCampaign(Campaign campaign) {
		int result = sqlSession.update("campaignMapper.updateCampaign", campaign);
		return result;
	}

	//캠페인 기부하기
	@Override
	public int insertCampaignRecord(CampaignRecord cRecord) {
		int result = sqlSession.insert("campaignMapper.insertCampaignRecord", cRecord);
		return result;
	}

	@Override
	public int selectPointCount(String userId) {
		int point = sqlSession.selectOne("campaignMapper.selectPointCount", userId);
		return point;
	}
	@Override
	public int updateMyPoint(User user) {
		int result = sqlSession.update("campaignMapper.updateMyPoint", user);
		return result;
	}
	@Override
	public int selectCampaignNowPoint(int cNo) {
		int nowPoint = sqlSession.selectOne("campaignMapper.selectCampaignPoint", cNo);
		return nowPoint;
	}
	@Override
	public int updateCampaignMoney(Campaign campaign) {
		int result = sqlSession.update("campaignMapper.updateCampaignMoney", campaign);
		return result;
	}


}

package com.pj.ptsd.mypage.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.mypage.domain.ChargePoint;
import com.pj.ptsd.mypage.domain.PageInfo;
import com.pj.ptsd.mypage.domain.Search;
import com.pj.ptsd.mypage.store.MypageStore;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.User;


@Repository
public class MypageStoreLogic implements MypageStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<User> selectUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> selectBoardList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChargePoint> selectChargePointListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Exchange> selectExchangeListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CampaignRecord> selectCampaignListAll(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CampaignRecord> selectSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CampaignRecord selectCampaignOne(int cName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Participant> selectParticipantListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId, int Point) {
		// TODO Auto-generated method stub
		return 0;
	}

}
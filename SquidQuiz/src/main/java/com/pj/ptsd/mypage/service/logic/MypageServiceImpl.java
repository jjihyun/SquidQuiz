package com.pj.ptsd.mypage.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.mypage.domain.ChargePoint;
import com.pj.ptsd.mypage.domain.PageInfo;
import com.pj.ptsd.mypage.domain.Search;
import com.pj.ptsd.mypage.service.MypageService;
import com.pj.ptsd.mypage.store.MypageStore;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.User;


@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageStore store;

	@Override
	public List<User> printUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> printBoardList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChargePoint> printChargePointListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Exchange> printExchangeListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CampaignRecord> printCampaignListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CampaignRecord> printSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CampaignRecord printCampaignOne(int cName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Participant> printParticipantListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeMember(String userId, int Point) {
		// TODO Auto-generated method stub
		return 0;
	}




	}



package com.pj.ptsd.mypage.service;

import java.awt.Point;
import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.mypage.domain.ChargePoint;
import com.pj.ptsd.mypage.domain.PageInfo;
import com.pj.ptsd.mypage.domain.Search;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.User;

public interface MypageService {
	public List<User> printUserList();
	public List<Board> printBoardList(PageInfo pi);
	public List<ChargePoint> printChargePointListAll();
	public List<Exchange> printExchangeListAll();
	public List<CampaignRecord> printCampaignListAll();
	public List<CampaignRecord> printSearchAll(Search search);
	public CampaignRecord printCampaignOne(int cName);
	public List<Participant> printParticipantListAll();
	public int modifyMember(User user);
	public int removeMember(String userId,int Point);

}

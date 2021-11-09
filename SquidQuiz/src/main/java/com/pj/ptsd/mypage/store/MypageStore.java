package com.pj.ptsd.mypage.store;

import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.mypage.domain.ChargePoint;
import com.pj.ptsd.mypage.domain.PageInfo;
import com.pj.ptsd.mypage.domain.Search;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.User;

public interface MypageStore {
	public List<User> selectUserList();
	public List<Board> selectBoardList(PageInfo pi);
	public List<ChargePoint> selectChargePointListAll();
	public List<Exchange> selectExchangeListAll();
	public List<CampaignRecord> selectCampaignListAll(PageInfo pi);
	public List<CampaignRecord> selectSearchAll(Search search);
	public CampaignRecord selectCampaignOne(int cName);
	public List<Participant> selectParticipantListAll();
	public int updateMember(User user);
	public int deleteMember(String userId,int Point);

}

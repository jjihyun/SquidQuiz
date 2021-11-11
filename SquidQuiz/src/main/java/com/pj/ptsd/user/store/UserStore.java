package com.pj.ptsd.user.store;

import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.user.domain.User;

public interface UserStore {
		public User selectMember(User userOne);
		public int checkIdDup(String userId);
		public int findId(User userOne);
		public int insertMember(User user);
		public int updateMember(User user);
		public int deleteMember(String userId);
		public List<CampaignRecord> selectCRList(PageInfo pi, int userNo);
		public List<Board> selectBoardList(PageInfo pi,int userNo);

}

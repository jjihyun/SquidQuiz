package com.pj.ptsd.user.store;

import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.user.domain.User;

public interface UserStore {
		public User selectMember(User userOne);
		public int checkIdDup(String userId);
		public String findId(User userOne);
		public String findPwd(User userOne);
		public int insertMember(User user);
		public int updateMember(User user);
		public int deleteMember(User user);
		public List<CampaignRecord> selectCRList(PageInfo pi, int userNo);
		public List<Board> selectBoardList(PageInfo pi,int userNo);
		
		public User selectOne(String uId);

}

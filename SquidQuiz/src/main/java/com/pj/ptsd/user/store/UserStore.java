package com.pj.ptsd.user.store;

import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.user.domain.PageInfo;
import com.pj.ptsd.user.domain.User;

public interface UserStore {
		public User selectMember(User userOne);
		public int checkIdDup(String userId);
		public String findId(User userOne);
		public String findPwd(User userOne);
		public int insertMember(User user);
		public int updateMember(User user);
		public int deleteMember(User user);
		public List<CampaignRecord> selectCRList(PageInfo pi, String userId);
		
		
		public List<Board> selectBoardList(PageInfo pi,String userId);
		//전체 게시물 개수 조회
		public int selectBListCount();
		
		public User selectOne(String uId);

}

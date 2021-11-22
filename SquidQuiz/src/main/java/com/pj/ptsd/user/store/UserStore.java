package com.pj.ptsd.user.store;

import java.util.List;
import java.util.Map;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.user.domain.Search;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.quiz.domain.Participant;
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
		//캠페인내역 검색기능
		public List<CampaignRecord> selectSearchAll(PageInfo pi, Map<String, Object> map);	
		//캠페인내역 게시물 개수 조회
		public int selectCListCount(String userId);
		
		public int selectCCount(String userId);
		
		public List<Participant> selectQList(PageInfo pi, String userId);
		
		//퀴즈내역 게시물 개수 
		public int selectQListCount(String userId);
		
		//퀴즈내역 참여수 조회
		public int selectQCount(String userId);
		
		//퀴즈내역 참여누적금조회
		public int selectGCount(String userId);
		
		public List<Board> selectBoardList(PageInfo pi,String userId);
		//자유게시판 상세 조회
		public Board selectbOne(int bNo);
		//자유게시판게시물 개수 조회
		public int selectBListCount(String userId);
		
		public User selectOne(String uId);
		
		//총 기부금 조회
		public int selectMyCPoint(String userId);

}

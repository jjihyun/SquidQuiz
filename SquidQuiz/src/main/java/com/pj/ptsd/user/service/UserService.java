package com.pj.ptsd.user.service;

import java.util.List;
import java.util.Map;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.user.domain.Search;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.PageInfo;
import com.pj.ptsd.user.domain.User;

public interface UserService {
	
	public User loginMember(User userOne);
	public int checkIdDup(String userId);
	public String findId(User userOne);
	public String findPwd(User userOne);
	public int registerMember(User user);
	public int modifyMember(User user);
	public int removeMember(User user);
	
	
	public List<CampaignRecord> printCRList(PageInfo pi, String userId);
	//캠페인내역 검색기능
	public List<CampaignRecord> printSearchAll(PageInfo pi,Map<String, Object> map);	
	//캠페인내역 게시물 개수 , 후원단체 수 조회
	public int getCListCount(String userId);
	
	public int getCCount(String userId);
	
	public int getSearchCount(Map<String, Object> map);
	
	public List<Participant> printQList(PageInfo pi, String userId);
	
	//퀴즈내역 게시물 개수 ,참여수 조회, 참여누적금조회
	public int getQCount(String userId);
	
	public int getGCount(String userId);
	
	
	public List<Board> printBoardList(PageInfo pi,String userId);
	//자유게시판 상세 조회
	public Board printbOne(int bNo);
	//자유게시판게시물 개수 조회
	public int getBCount(String userId);
	
	
	public User printOne(String uId);
	
	//회원정보수정 이메일,전화번호
	public User printEPList(String userId);
	
	
	//총 기부금 조회
	public int printMyCPoint(String userId);
	
	
}

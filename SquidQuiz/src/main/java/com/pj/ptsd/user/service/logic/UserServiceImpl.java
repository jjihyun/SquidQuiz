package com.pj.ptsd.user.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.user.domain.Search;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.PageInfo;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.user.service.UserService;
import com.pj.ptsd.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserStore store;

	@Override
	public User loginMember(User userOne) {
		User uOne = store.selectMember(userOne);
		return uOne;
	}

	@Override
	public int checkIdDup(String userId) {
		int result = store.checkIdDup(userId);
		return result;
	}

	@Override
	public String findId(User userOne) {
		String uOne = store.findId(userOne);
		return uOne;
	}

	@Override
	public String findPwd(User userOne) {
		String uOne = store.findPwd(userOne);
		return uOne;
	}
	
	@Override
	public int registerMember(User user) {
		int result = store.insertMember(user);
		return result;
	}

	@Override
	public int modifyMember(User user) {
		int result = store.updateMember(user);
		return result;
	}

	@Override
	public int removeMember(User user) {
		int result = store.deleteMember(user);
		return result;
	}

	@Override
	public List<CampaignRecord> printCRList(PageInfo pi, String userId) {
		List<CampaignRecord> cList = store.selectCRList(pi, userId);
		return cList;
	}
	//캠페인내역 검색기능
	@Override
	public List<CampaignRecord> printSearchAll(PageInfo pi, Map<String, Object> map) {
		List<CampaignRecord> serchList = store.selectSearchAll(pi, map);
		return serchList;
	}
	
	@Override
	public int getCListCount(String userId) {
		int result = store.selectCListCount(userId); 
		return result;
	}
	

	@Override
	public int getCCount(String userId) {
		int result = store.selectCCount(userId); 
		return result;
	}

	@Override
	public List<Board> printBoardList(PageInfo pi, String userId) {
		List<Board> bList = store.selectBoardList(pi, userId);
		return bList;
	}
	
	//자유게시판 상세
	@Override
	public Board printbOne(int bNo) {
		Board board = store.selectbOne(bNo);
		return board;
	}
	
	//자유게시판 게시물 개수
	@Override
	public int getBCount(String userId) {
		int result = store.selectBListCount(userId); 
		return result;
	}

	//포인트 출력
	@Override
	public User printOne(String uId) {
		User user = store.selectOne(uId);
		return user;
	}
	
	//퀴즈참여 리스트
	@Override
	public List<Participant> printQList(PageInfo pi, String userId) {
		List<Participant> qList = store.selectQList(pi, userId);
		return qList;
	}
	
	//퀴즈 참여글 갯수, 참여수 조회, 참여누적금조회
	@Override
	public int getQCount(String userId) {
		int result = store.selectQListCount(userId); 
		return result;
	}
	
	@Override
	public int getGCount(String userId) {
		int result = store.selectGCount(userId); 
		return result;
	}
	

	@Override
	public int printMyCPoint(String userId) {
		int point = store.selectMyCPoint(userId); 
		return point;
	}

	@Override
	public User printEPList(String userId) {
		User user = store.selectOne(userId);
		return user;
	}

	@Override
	public int getSearchCount(Map<String, Object> map) {
		int result = store.getSearchCount(map); 
		return result;
	}

	

	




	







}

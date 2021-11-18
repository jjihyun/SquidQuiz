package com.pj.ptsd.user.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.ChargePoint;
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
	public List<CampaignRecord> printCRList(PageInfo pi, int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> printBoardList(PageInfo pi, String userId) {
		List<Board> bList = store.selectBoardList(pi, userId);
		return bList;
	}

	//전체 게시물 개수
	@Override
	public int getBCount() {
		int result = store.selectBListCount(); 
		return result;
	}


	//포인트 출력
	@Override
	public User printOne(String uId) {
		User user = store.selectOne(uId);
		return user;
	}

	@Override
	public Board printbOne(int bNo) {
		Board board = store.selectbOne(bNo);
		return board;
	}


	







}

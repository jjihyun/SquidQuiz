package com.pj.ptsd.user.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
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
	public User findId(User userOne) {
		User uOne = store.findId(userOne);
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
	public int removeMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CampaignRecord> printCRList(PageInfo pi, int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> printBoardList(PageInfo pi, int userNo) {
		return null;
	}






}

package com.pj.ptsd.user.service;

import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.user.domain.User;

public interface UserService {
	
	public User loginMember(User userOne);
	public int checkIdDup(String userId);
	public String findId(User userOne);
	public String findPwd(User userOne);
	public int registerMember(User user);
	public int modifyMember(User user);
	public int removeMember(User user);
	public List<CampaignRecord> printCRList(PageInfo pi, int userNo);
	public List<Board> printBoardList(PageInfo pi,int userNo);
	
	public User printOne(String uId);
	
}

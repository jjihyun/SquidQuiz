package com.pj.ptsd.userManagement.service;

import java.util.List;

import com.pj.ptsd.common.PageInfo;
import com.pj.ptsd.common.Search;
import com.pj.ptsd.user.domain.User;

public interface ManagementService {
	//회원 리스트
	public List<User> printUserList(PageInfo pi);
	//search list
	public List<User> printSearchUserList(PageInfo pi, Search search);
	//count
	public int getUserCount(Search search );
	//회원 탈퇴 ( 삭제 )
	public int removeUser(int userNo);
}

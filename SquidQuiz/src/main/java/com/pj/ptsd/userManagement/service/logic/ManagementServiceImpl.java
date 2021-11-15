package com.pj.ptsd.userManagement.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.common.PageInfo;
import com.pj.ptsd.common.Search;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.userManagement.service.ManagementService;
import com.pj.ptsd.userManagement.store.ManagementStore;
@Service
public class ManagementServiceImpl implements ManagementService{
	@Autowired
	private ManagementStore store ;
	@Override
	public List<User> printUserList(PageInfo pi) {
		List<User> uList = store.selectUserList(pi);
		return uList;
	}

	@Override
	public List<User> printSearchUserList(PageInfo pi, Search search) {
		List<User> uList = store.selectSearchUserList(pi, search);
		return uList;
	}

	@Override
	public int removeUser(int userNo) {
		int result = store.deleteUser(userNo);
		return result;
	}

	@Override
	public int getUserCount(Search search) {
		int result = store.selectUserCount(search);
		return result;
	}
	
}

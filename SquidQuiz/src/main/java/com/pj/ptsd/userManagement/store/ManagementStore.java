package com.pj.ptsd.userManagement.store;

import java.util.List;

import com.pj.ptsd.common.PageInfo;
import com.pj.ptsd.common.Search;
import com.pj.ptsd.user.domain.User;

public interface ManagementStore {
		//회원 리스트
		public List<User> selectUserList(PageInfo pi);
		//search list
		public List<User> selectSearchUserList(PageInfo pi, Search search);
		//count
		public int selectUserCount(Search search);
		//회원 탈퇴 ( 삭제 )
		public int deleteUser(int userNo);
}

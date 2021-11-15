package com.pj.ptsd.userManagement.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.common.PageInfo;
import com.pj.ptsd.common.Search;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.userManagement.store.ManagementStore;
@Repository
public class ManagementStoreLogic implements ManagementStore {
	
	@Autowired
	private SqlSessionTemplate session;
	@Override
	public List<User> selectUserList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		List<User> uList = session.selectList("userManagementMapper.selectAllUser", pi, rowBounds);
		return uList;
	}

	@Override
	public List<User> selectSearchUserList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		List<User> uList = session.selectList("userManagementMapper.selectSearchUser", search, rowBounds);
		return uList;
	}

	@Override
	public int deleteUser(int userNo) {
		int result = session.delete("userManagementMapper.deleteUser", userNo);
		return result;
	}

	@Override
	public int selectUserCount(Search search) {
		int result = session.selectOne("userManagementMapper.selectUserCount", search);
		return result ;
	}

}

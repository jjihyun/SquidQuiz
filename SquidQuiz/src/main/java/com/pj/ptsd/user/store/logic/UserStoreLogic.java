package com.pj.ptsd.user.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public User selectMember(User userOne) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkIdDup(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMember(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}

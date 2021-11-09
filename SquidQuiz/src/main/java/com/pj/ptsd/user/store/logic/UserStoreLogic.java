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
		User uOne = sqlSession.selectOne("userMapper.selectLoginUser", userOne);
		return uOne;
	}
	@Override
	public User selectReadMember(User userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkIdDup(String userId) {
		int result = sqlSession.selectOne("userMapper.checkIdDup", userId);
		return result;
	}

	@Override
	public int insertMember(User user) {
		int result = sqlSession.insert("userMapper.insertUser", user);
		return result;
	}

	@Override
	public int updateMember(User user) {
		int result = sqlSession.update("userMapper.updateUser", user);
		return result;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}

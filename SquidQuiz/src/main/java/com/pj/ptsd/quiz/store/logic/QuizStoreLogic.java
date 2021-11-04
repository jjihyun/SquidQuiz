package com.pj.ptsd.quiz.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.store.QuizStore;
@Repository
public class QuizStoreLogic implements QuizStore{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertOxQuiz(Ox ox) {
		int result = sqlSession.insert("",ox);
		return result;
	}

	@Override
	public int updateOxQuiz(Ox ox) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOxQuiz(int oxNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}

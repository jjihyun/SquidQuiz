package com.pj.ptsd.quiz.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.store.QuizStore;
@Repository
public class QuizStoreLogic implements QuizStore{
	@Autowired
	private SqlSessionTemplate sqlSession;
	//OX퀴즈 등록
	@Override
	public int insertOxQuiz(Ox ox) {
		int result = sqlSession.insert("quizMapper.insertOx",ox);
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
	//OX퀴즈 갯수 조회
	@Override
	public int selectListCount() {
		int count=sqlSession.selectOne("quizMapper.selectListCount");
		return count;
	}
	//OX퀴즈 전체 조회
	@Override
	public List<Ox> selectAll(PageData pd) {
		int offset = (pd.getCurrentPage()-1)*pd.getPageLimit();
		RowBounds rowBounds =  new RowBounds(offset,pd.getPageLimit());
		List<Ox> oxList = sqlSession.selectList("quizMapper.selectAllList",pd,rowBounds);
		return oxList;
	}

	@Override
	public Ox selectOne(int oxNo) {
		// TODO Auto-generated method stub
		return null;
	}

}

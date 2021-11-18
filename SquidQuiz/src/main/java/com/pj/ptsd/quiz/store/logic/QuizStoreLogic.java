package com.pj.ptsd.quiz.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizSearch;
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
		int result = sqlSession.update("quizMapper.updateOx",ox);
		return result;
	}

	@Override
	public int deleteOxQuiz(int oxNo) {
		int result = sqlSession.delete("quizMapper.deleteOx",oxNo);
		return result;
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
		Ox ox = sqlSession.selectOne("quizMapper.selectOneOx",oxNo);
		return ox;
	}

	@Override
	public List<Ox> selectSearchAll(QuizSearch search) {
		List<Ox> oxSearchList = sqlSession.selectList("quizMapper.selectSearchList",search);
		return oxSearchList;
	}
	//---------------------------------게임---------------------------------------
	//퀴즈 시작
	@Override
	public int updatequizGameStatus(String quizGameStatus) {
		int result = sqlSession.update("gameMapper.updateGame",quizGameStatus);
		return result;
	}
	
	//게임모집
	@Override
	public int insertGameStart() {
		int result = sqlSession.insert("gameMapper.insertGame");
		return result;
	}
	//퀴즈 종료
	@Override
	public int updatequizGameEndStatus(String quizGameStatus) {
		int result = sqlSession.update("gameMapper.updateGame",quizGameStatus);
		return result;
	}
	//참여자 수 
	@Override
	public MainGameInfo selectParticpant() {
		MainGameInfo mgi = sqlSession.selectOne("gameMapper.selectParticpantCount");
		return mgi;
	}
	//참가 등록
	@Override
	public int insertParticipant() {
		int result = sqlSession.insert("");
		return result;
	}


}

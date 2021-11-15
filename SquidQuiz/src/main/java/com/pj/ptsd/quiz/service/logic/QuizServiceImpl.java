package com.pj.ptsd.quiz.service.logic;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizSearch;
import com.pj.ptsd.quiz.service.QuizService;
import com.pj.ptsd.quiz.store.QuizStore;
@Service
public class QuizServiceImpl implements QuizService{
	@Autowired
	private QuizStore store;
	
	@Override
	public int registerOxQuiz(Ox ox) {
		int result = store.insertOxQuiz(ox);
		return result;
	}

	@Override
	public int modifyOxQuiz(Ox ox) {
		int result = store.updateOxQuiz(ox);
		return result;
	}

	@Override
	public int removeOxQuiz(int oxNo) {
		int result = store.deleteOxQuiz(oxNo);
		return result;
	}

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}
	
	@Override
	public List<Ox> printAll(PageData pd) {
		List<Ox> oxList = store.selectAll(pd);
		return oxList;
	}

	@Override
	public Ox printOne(int oxNo) {
		Ox ox = store.selectOne(oxNo);
		return ox;
	}

	@Override
	public List<Ox> printSearchAll(QuizSearch search) {
		List<Ox> oxSearchList = store.selectSearchAll(search);
		return oxSearchList;
	}


	//--------------------------게임--------------------------
	
	//게임 시작
	@Override
	public int quizGameModify(String quizGameStatus) {
		int result = store.updatequizGameStatus(quizGameStatus);
		return result;
	}

	//게임등록


}

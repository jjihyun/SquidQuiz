package com.pj.ptsd.quiz.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.quiz.domain.Ox;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeOxQuiz(int oxNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}

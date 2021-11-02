package com.pj.ptsd.quiz.service;

import com.pj.ptsd.quiz.domain.Ox;

public interface QuizService {
	//ox 등록 수정 삭제 
	public int registerOxQuiz(Ox ox);
	public int modifyOxQuiz(Ox ox);
	public int removeOxQuiz(int oxNo);
}

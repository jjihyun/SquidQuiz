package com.pj.ptsd.quiz.service;

import java.util.List;

import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;

public interface QuizService {
	public int getListCount();
	
	//ox 등록 수정 삭제 조회 
	public int registerOxQuiz(Ox ox);
	public int modifyOxQuiz(Ox ox);
	public int removeOxQuiz(int oxNo);
	public List<Ox> printAll(PageData ox);
	public Ox printOne(int oxNo);
}

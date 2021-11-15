package com.pj.ptsd.quiz.service;

import java.util.List;

import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizSearch;
import com.pj.ptsd.user.domain.User;

public interface QuizService {
	public int getListCount();
	
	//ox 등록 수정 삭제 조회 
	public int registerOxQuiz(Ox ox);
	public int modifyOxQuiz(Ox ox);
	public int removeOxQuiz(int oxNo);
	public List<Ox> printAll(PageData ox);
	public Ox printOne(int oxNo);
	//퀴즈 검색
	public List<Ox> printSearchAll(QuizSearch search);
	//관리자 게임 시작/종료
	public int quizGameModify(String quizGameStatus);
	public int quizGameModifyEnd(String quizGameStatus);
	//퀴즈 게임 등록
	
	//퀴즈 게임 참가
	public int insertGameUser(User user);
	
	
}

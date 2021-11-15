package com.pj.ptsd.quiz.store;

import java.util.List;

import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizSearch;

public interface QuizStore {
	public int selectListCount();
	//ox 등록 수정 삭제 
		public int insertOxQuiz(Ox ox);
		public int updateOxQuiz(Ox ox);
		public int deleteOxQuiz(int oxNo);
		public List<Ox> selectAll(PageData ox);
		public Ox selectOne(int oxNo);
	//퀴즈 검색
		public List<Ox> selectSearchAll(QuizSearch search);
		//관리자 게임 시작/종료
		public int updatequizGameStatus(String quizGameStatus);
		//게임 등록
		
}

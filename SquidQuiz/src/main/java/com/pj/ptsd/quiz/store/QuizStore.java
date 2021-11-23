package com.pj.ptsd.quiz.store;

import java.util.List;

import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizSearch;
import com.pj.ptsd.user.domain.User;

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
		public int insertGameStart();
		public int updatequizGameEndStatus(String quizGameStatus);
		public MainGameInfo selectParticpant();
		//참가 등록
		public int insertParticipant(String participantNo);
		//참가자 머니조회
		public int selectUserPoint(User user);
		//참가자 머니 수정
		public int updateUserPoint(User user);
		//게임 머니,참가자수,기부머니 수정
		public int updateMoney(MainGameInfo mgi);
		//참가 취소
		public int removeParticipant(String participantNo);
		//유저 머니 환불
		public int updateUserPointMinus(User user);
		//게임 머니 환불
		public int updateMoneyMinus(MainGameInfo mgi);
		
		//게임 조회
		public Ox selectGame(Ox oxlist);
		//역대오징어조회
		public List<MainGameInfo> selectMgiAll(PageData pd);
		//오징어카운트
		public int selectMgiListCount();
		//오징어 검색
		public List<MainGameInfo> selectMgiSearchAll(QuizSearch search);
		
}

package com.pj.ptsd.quiz.service;

import java.util.List;

import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizSearch;
import com.pj.ptsd.user.domain.User;

public interface QuizService {
	public int getListCount();
	public int getMgiListCount();
	
	//ox 등록 수정 삭제 조회 
	public int registerOxQuiz(Ox ox);
	public int modifyOxQuiz(Ox ox);
	public int removeOxQuiz(int oxNo);
	public List<Ox> printAll(PageData ox);
	public Ox printOne(int oxNo);
	//퀴즈 검색
	public List<Ox> printSearchAll(QuizSearch search);
	//관리자 게임 시작/종료
//	public int quizGameModify(String quizGameStatus);
	public int registerGameStart();
	public int quizGameModifyStart(String quizGameStatus);
	public int quizGameModifyEnd(String quizGameStatus);
	public MainGameInfo printParticpant();
	//퀴즈 게임 등록
	//퀴즈 게임 참가
	public int registerParticipant(String participantNo);
	//유저 머니조회
	public int selectUserPoint(User user);
	//유저 머니 업데이트
	public int updateUserPoint(User user);
	//게임정보 업데이트
	public int updateMoney(MainGameInfo mgi);
	//참가 취소
	public int removeParticipant(String participantNo);
	//유저 머니 환불
	public int updateUserPointMinus(User user);
	//게임정보 환불
	public int updateMoneyMinus(MainGameInfo mgi);
	//게임 조회
	public Ox printGame(Ox oxlist);
	//o입력
	public Ox printAnswerO(int oxNo);
	//역대오징어조회
	public List<MainGameInfo> printMgiAll(PageData pd);
	//역대오징어 검색띠
	public List<MainGameInfo> printMgiSearchAll(QuizSearch search);
	

	

	
}

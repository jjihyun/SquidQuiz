package com.pj.ptsd.qna.service;

import java.util.List;

import com.pj.ptsd.qna.domain.Qna;

public interface QnaService {
	
	//전체 조회
	public List<Qna> printAllQna();
	//상세 조회 ( 1개 )
	public Qna printOneQna(int qnaNo);
	//아이디로 조회 
	public List<Qna> printQnaById(int userNo);
	//qna 작성(회원)
	public int registerQna(Qna qna);
	//삭제
	public int removeQna(int qnaNo);
	//답변 등록
	public int modifyAnswer(Qna qna);
	//게시물 전체 개수
	public int getListCount();
}

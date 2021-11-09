package com.pj.ptsd.qna.service;

import java.util.List;

import com.pj.ptsd.qna.domain.PageInfo;
import com.pj.ptsd.qna.domain.Qna;
import com.pj.ptsd.qna.domain.QnaSearch;

public interface QnaService {
	
	//전체 조회
	public List<Qna> printAllQna(PageInfo pi);
	//상세 조회 ( 1개 )
	public Qna printOneQna(int qnaNo);
	//아이디로 조회 
	public List<Qna> printQnaById(PageInfo pi, String userId);
	//search
	public List<Qna> printSearchQna(QnaSearch search);
	//qna 작성(회원)
	public int registerQna(Qna qna);
	//삭제
	public int removeQna(int qnaNo);
	//답변 등록
	public int modifyAnswer(Qna qna);
	//게시물 전체 개수
	public int getAllListCount();
	//회원 게시물 개수
	public int getOwnListCount(String userId);
}

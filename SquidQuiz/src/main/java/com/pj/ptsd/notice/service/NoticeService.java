package com.pj.ptsd.notice.service;

import java.util.List;

import com.pj.ptsd.notice.domain.Notice;
import com.pj.ptsd.qna.domain.Qna;

public interface NoticeService {
	
	//공지 조회
	public List<Notice> printAllNotice();
	//공지 상세 조회(1개조회)
	public Notice printOneNotice(int noticeNo);
	//공지 작성
	public int registerNotice(Notice notice);
	//공지 수정
	public int modifyNotice(Notice notice); 
	//공지 삭제
	public int removeNotice(int noticeNo);
	
	//(회원) 문의 목록 조회
	public List<Qna> printUserQna(int userNo);
	//(관리자) 전체 문의 목록 조회
	public List<Qna> printAllQna();
	//문의 상세 조회 (1개)
	public Qna printOneQna(int qnaNo);
	//문의 등록
	public int registerQna(Qna qna);
	//답변 등록
	public int registerAnswer(String answer);
	

}

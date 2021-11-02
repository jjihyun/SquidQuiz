package com.pj.ptsd.notice.store;

import java.util.List;

import com.pj.ptsd.notice.domain.Notice;
import com.pj.ptsd.qna.domain.Qna;

public interface NoticeStore {

	//공지 조회
	public List<Notice> selectAllNotice();
	//공지 상세 조회(1개조회)
	public Notice selectOneNotice(int noticeNo);
	//공지 작성
	public int insertNotice(Notice notice);
	//공지 수정
	public int updateNotice(Notice notice); 
	//공지 삭제
	public int deleteNotice(int noticeNo);
	
	//(회원) 문의 목록 조회
	public List<Qna> selectUserQna(int userNo);
	//(관리자) 전체 문의 목록 조회
	public List<Qna> selectAllQna();
	//문의 상세 조회 (1개)
	public Qna selectOneQna(int qnaNo);
	//문의 등록
	public int insertQna(Qna qna);
	//답변 등록
	public int updateAnswer(String answer);
}

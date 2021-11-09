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
	
	
	

}

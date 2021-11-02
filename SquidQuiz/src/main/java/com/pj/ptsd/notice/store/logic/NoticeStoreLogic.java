package com.pj.ptsd.notice.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.notice.domain.Notice;
import com.pj.ptsd.notice.store.NoticeStore;
import com.pj.ptsd.qna.domain.Qna;
@Repository
public class NoticeStoreLogic implements NoticeStore{
	
	private SqlSessionTemplate sqlSession;
	
	//공지 전체 조회
	@Override
	public List<Notice> selectAllNotice() {
		List<Notice> nList = sqlSession.selectList("");
		return nList;
	}
	//공지 상세 조회
		@Override
		public Notice selectOneNotice(int noticeNo) {
			Notice notice = sqlSession.selectOne("", noticeNo);
			return notice;
		}
	//공지 등록
	@Override
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("", notice);
		return result;
	}
	// 공지 수정
	@Override
	public int updateNotice(Notice notice) {
		int result = sqlSession.update("", notice);
		return result;
		
	}
	// 공지 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		int result = sqlSession.delete(null, noticeNo);
		return result;
	}
	//공지 목록 조회 ( 회원 )
	@Override
	public List<Qna> selectUserQna(int userNo) {
		List<Qna> qList = sqlSession.selectList("");
		return qList;
	}
	// 공지 목록 전체 조회 (관리자)
	@Override
	public List<Qna> selectAllQna() {
		List<Qna> qList = sqlSession.selectList("");
		return qList;
	}
	//문의 작성
	@Override
	public int insertQna(Qna qna) {
		int result = sqlSession.update("", qna);
		return result;
	}
	//문의 답변 작성
	@Override
	public int updateAnswer(String answer) {
		int result = sqlSession.update("", answer);
		return result;
	}
	
	//문의 상세 조회
	@Override
	public Qna selectOneQna(int qnaNo) {
		Qna qna = sqlSession.selectOne("", qnaNo);
		return qna;
	}

}

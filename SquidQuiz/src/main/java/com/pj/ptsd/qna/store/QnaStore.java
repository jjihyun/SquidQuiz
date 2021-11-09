package com.pj.ptsd.qna.store;

import java.util.List;

import com.pj.ptsd.qna.domain.PageInfo;
import com.pj.ptsd.qna.domain.Qna;
import com.pj.ptsd.qna.domain.QnaSearch;

public interface QnaStore {
		//전체 조회
		public List<Qna> selectAllQna(PageInfo pi);
		//상세 조회 ( 1개 )
		public Qna selectOneQna(int qnaNo);
		//리스트 조회(회원) 
		public List<Qna> selectQnaById(PageInfo pi, String userId);
		//search
		public List<Qna> selectSearchQna(QnaSearch search);
		//qna 작성(회원)
		public int insertQna(Qna qna);
		//삭제
		public int deleteQna(int qnaNo);
		//답변 등록
		public int updateAnswer(Qna qna);
		//게시물 전체 개수
		public int selectListCount();
		//회원 게시물 개수
		public int selectOwnListCount(String userId);
}

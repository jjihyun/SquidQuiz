package com.pj.ptsd.qna.store;

import java.util.List;

import com.pj.ptsd.qna.domain.Qna;

public interface QnaStore {
		//전체 조회
		public List<Qna> selectAllQna();
		//상세 조회 ( 1개 )
		public Qna selectOneQna(int qnaNo);
		//리스트 조회(회원) 
		public List<Qna> selectQnaById(int userNo);
		//qna 작성(회원)
		public int insertQna(Qna qna);
		//삭제
		public int deleteQna(int qnaNo);
		//답변 등록
		public int updateAnswer(Qna qna);
		//게시물 전체 개수
		public int selectListCount();
}

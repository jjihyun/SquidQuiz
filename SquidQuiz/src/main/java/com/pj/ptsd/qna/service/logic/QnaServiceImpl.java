package com.pj.ptsd.qna.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.qna.domain.Qna;
import com.pj.ptsd.qna.service.QnaService;
import com.pj.ptsd.qna.store.QnaStore;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaStore store;
	//전체조회
	@Override
	public List<Qna> printAllQna() {
		List<Qna> qList = store.selectAllQna();
		return qList;
	}
	//상세조회
	@Override
	public Qna printOneQna(int qnaNo) {
		Qna q = store.selectOneQna(qnaNo);
		return q;
	}
	//등록
	@Override
	public int registerQna(Qna qna) {
		int result = store.insertQna(qna);
		return result;
	}
	//삭제
	@Override
	public int removeQna(int qnaNo) {
		int result = store.deleteQna(qnaNo);
		return result;
	}
	//답변
	@Override
	public int modifyAnswer(Qna qna) {
		int result = store.updateAnswer(qna);
		return result;
	}
	//개수 조회
	@Override
	public int getListCount() {
		int result = store.selectListCount();
		return result;
	}
	//리스트 조회 (회원 )
	@Override
	public List<Qna> printQnaById(int userNo) {
		List<Qna> qList=store.selectQnaById(userNo);
		return qList;
	}
}

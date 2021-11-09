package com.pj.ptsd.quiz.store;

import java.util.List;

import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;

public interface QuizStore {
	public int selectListCount();
	//ox 등록 수정 삭제 
		public int insertOxQuiz(Ox ox);
		public int updateOxQuiz(Ox ox);
		public int deleteOxQuiz(int oxNo);
		public List<Ox> selectAll(PageData ox);
		public Ox selectOne(int oxNo);
}

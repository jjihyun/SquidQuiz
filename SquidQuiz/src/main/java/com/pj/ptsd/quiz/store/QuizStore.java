package com.pj.ptsd.quiz.store;

import com.pj.ptsd.quiz.domain.Ox;

public interface QuizStore {
	//ox 등록 수정 삭제 
		public int insertOxQuiz(Ox ox);
		public int updateOxQuiz(Ox ox);
		public int deleteOxQuiz(int oxNo);
}

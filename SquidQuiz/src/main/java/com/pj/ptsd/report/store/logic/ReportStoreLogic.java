package com.pj.ptsd.report.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.report.store.ReportStore;
@Repository
public class ReportStoreLogic implements ReportStore{
	@Autowired
	private SqlSessionTemplate session ;
	
	//신고 리스트 search
			//신고 게시물 삭제
			//신고 내역 삭제
			
			//신고 댓글 리스트
			//신고 댓글 search
			//신고 댓글 삭제
			//댓글 신고 내역 삭제
}

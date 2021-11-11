package com.pj.ptsd.report.service;

import java.util.List;

import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.Report;

public interface ReportService {
	
	//신고 게시물 전체조회
	public List<Report> printReportList(PageInfo pi);
	//신고 게시물 리스트
		//신고 리스트 search
		//신고 게시물 삭제
		//신고 내역 삭제
		
		//신고 댓글 리스트
		//신고 댓글 search
		//신고 댓글 삭제
		//댓글 신고 내역 삭제
}

package com.pj.ptsd.report.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.Report;
import com.pj.ptsd.report.service.ReportService;
import com.pj.ptsd.report.store.ReportStore;
@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportStore store ;
	
	//신고 게시물 리스트
	@Override
	public List<Report> printReportList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}
	
		//신고 리스트 search
		//신고 게시물 삭제
		//신고 내역 삭제
		
		//신고 댓글 리스트
		//신고 댓글 search
		//신고 댓글 삭제
		//댓글 신고 내역 삭제
}

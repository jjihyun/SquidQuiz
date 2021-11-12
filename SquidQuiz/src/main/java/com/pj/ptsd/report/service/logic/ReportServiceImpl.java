package com.pj.ptsd.report.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.ReplyReport;
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
		List<Report> rList = store.selectReportList(pi);
		return rList;
	}
	//게시물 개수 조회
	@Override
	public int getReportCount() {
		int result = store.selectReportCount();
		return result;
	}
	//SEARCH
	@Override
	public List<Report> printSearchList(PageInfo pi, Search search) {
		List<Report> rList=store.selectSearchList(pi, search);
		return rList;
	}
	//SEARCH COUNT
	@Override
	public int getSearchCount(Search search) {
		int result = store.selectSearchCount(search);
		return result;
	}
	//신고 게시물 삭제
	@Override
	public int removeReportBoard(int boardNo) {
		int result = store.deleteReportBoard(boardNo);
		return result;
	}
	//신고 내역 삭제
	@Override
	public int removeReport(int reportNo) {
		int result=store.deleteReport(reportNo);
		return result;
	}
	
//댓글

	//댓글신고내역 all list
	@Override
	public List<ReplyReport> printReplyReportList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}
	//댓글 신고 내역 search
	@Override
	public List<ReplyReport> printReplySearchList(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	//댓글 갯수 
	@Override
	public int getReplyReport(Search search) {
		// TODO Auto-generated method stub
		return 0;
	}
	//댓글 삭제
	@Override
	public int removeReply(int replyNo) {
		int result = 0;
		return result;
	}
	//댓글 신고 내역 삭제
	@Override
	public int removeReplyReport(int replyReportNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}

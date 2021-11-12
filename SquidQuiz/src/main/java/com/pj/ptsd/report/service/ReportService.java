package com.pj.ptsd.report.service;

import java.util.List;

import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;

public interface ReportService {
	
	//신고 게시물 전체조회
	public List<Report> printReportList(PageInfo pi);
	//신고 게시물 갯수 조회
	public int getReportCount();
	//신고 리스트 search
	public List<Report> printSearchList(PageInfo pi, Search search);
	
	//search 리스트 개수 조회
	public int getSearchCount(Search search);
	
	//신고 게시물 삭제
	public int removeReportBoard(int boardNo);
	//신고 내역 삭제
	public int removeReport(int reportNo);
	
	//댓글
	//신고 댓글 리스트
	public List<ReplyReport> printReplyReportList(PageInfo pi);
	//신고 댓글 search
	public List<ReplyReport> printReplySearchList(PageInfo pi, Search search);
	//신고 댓글 갯수 count
	public int getReplyReport(Search search);
	//신고 댓글 삭제
	public int removeReply(int replyNo);
	//댓글 신고 내역 삭제
	public int removeReplyReport(int replyReportNo);
}

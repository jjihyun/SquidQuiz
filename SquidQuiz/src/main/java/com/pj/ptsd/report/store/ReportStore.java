package com.pj.ptsd.report.store;

import java.util.List;

import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;

public interface ReportStore {
	
	//신고 게시물 리스트
	public List<Report> selectReportList(PageInfo pi);
	//신고 게시물 갯수 조회
	public int selectReportCount();
	//신고 리스트 search
	public List<Report> selectSearchList(PageInfo pi, Search search);
	
	//search 리스트 개수 조회
	public int selectSearchCount(Search search);
	//신고 게시물 삭제
	public int deleteReportBoard(int boardNo);
	//신고 내역 삭제
	public int deleteReport(int reportNo);
	
	//댓글
	//신고 댓글 리스트
	public List<ReplyReport> selectReplyReportList(PageInfo pi);
	//신고 댓글 search
	public List<ReplyReport> selectReplySearchList(PageInfo pi, Search search);
	//신고 댓글 갯수 count
	public int selectReplyReport(Search search);
	//신고 댓글 삭제
	public int deleteReply(int replyNo);
	//댓글 신고 내역 삭제
	public int deleteReplyReport(int replyReportNo);
}

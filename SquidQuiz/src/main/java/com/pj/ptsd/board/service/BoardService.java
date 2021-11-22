package com.pj.ptsd.board.service;

import java.util.List;


import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.RPageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;


public interface BoardService {
	
	//페이징,검색
	public List<Board> printAll(PageInfo pi);
	public List<Board> printSearchAll(Search search);	
	public Board printOne(int bNo);
	
	//게시판
	public int registerBoard(Board board);
	public int modifyBoard(Board board);
	public int removeBoard(int bNo);
	
	//댓글
	public List<Reply> printAllReply(int bNo);
	public int registerReply(Reply reply);
	public int modifyReply(Reply reply);
	public int removeReply(Reply reply);
	public int getListCount();

	//신고
	public int registerReportBoard(Report report);
	public int registerReportReply(ReplyReport replyreport);
	public Report doubleReport(Report report);
//	public int ListCount(RPageInfo rpageInfo);
//	public List<Reply> RPageInfoList(RPageInfo rpageInfo);
}

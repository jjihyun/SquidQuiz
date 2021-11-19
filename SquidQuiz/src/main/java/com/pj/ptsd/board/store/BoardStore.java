package com.pj.ptsd.board.store;

import java.util.List;


import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;

public interface BoardStore {
	
	//페이징,검색
	public int selectListCount();
	public List<Board> selectAll(PageInfo pi);
	public List<Board> selectSearchAll(Search search);	
	
	//게시판
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int bNo);
	
	//댓글 
	public List<Reply> selectAllReply(int bNo);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(Reply reply);
	public Board printOne(int bNo);
	
	//신고
	public int insertReportBoard(Report report);
	public int insertReportReply(ReplyReport replyreport);
	public Report doubleReport(Report report);
}

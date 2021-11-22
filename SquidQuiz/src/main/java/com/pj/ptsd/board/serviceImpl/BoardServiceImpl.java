package com.pj.ptsd.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.RPageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.service.BoardService;
import com.pj.ptsd.board.store.BoardStore;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardStore store;
	
	
	@Override
	public List<Board> printAll(PageInfo pi) {
		List<Board> bList = store.selectAll(pi);
		return bList;
	}
	
	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	@Override
	public Board printOne(int bNo) {
		Board board = store.printOne(bNo);
		return board;
	}
	
	@Override
	public List<Board> printSearchAll(Search search) {
		List<Board> searchList = store.selectSearchAll(search);
		return searchList;
	}

	@Override
	public int registerBoard(Board board) {
		int result = store.insertBoard(board);
		return result;
	}

	@Override
	public int modifyBoard(Board board) {
		int result = store.updateBoard(board);
		return result;
	}

	@Override
	public int removeBoard(int bNo) {
		int result = store.deleteBoard(bNo);
		return result;
	}

	@Override
	public List<Reply> printAllReply(int bNo) {
		List<Reply> rList = store.selectAllReply(bNo);
		return rList;
	}

	@Override
	public int registerReply(Reply reply) {
		int result = store.insertReply(reply);
		return result;
	}

	@Override
	public int modifyReply(Reply reply) {
		int result = store.updateReply(reply);
		return result;
	}

	@Override
	public int removeReply(Reply reply) {
		int result = store.deleteReply(reply);
		return result;
	}

	@Override
	public int registerReportBoard(Report report) {
		int result = store.insertReportBoard(report);
		return result;
	}

	@Override
	public int registerReportReply(ReplyReport replyreport) {
		int result = store.insertReportReply(replyreport);
		return result;
	}

	@Override
	public Report doubleReport(Report report) {
		Report report2 = store.doubleReport(report);
		return report2;
	}

//	@Override
//	public int ListCount(RPageInfo rpageInfo) {
//		int totalCount = store.selectListCount();
//		return totalCount;
//	}
//
//	@Override
//	public List<Board> RPageInfoList(RPageInfo rpageInfo) {
//		List<Reply> rList = store.RPageInfoList(rpageInfo);
//		return rList;
//	}
}

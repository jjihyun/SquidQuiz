package com.pj.ptsd.report.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;
import com.pj.ptsd.report.store.ReportStore;
@Repository
public class ReportStoreLogic implements ReportStore{
	@Autowired
	private SqlSessionTemplate session ;
	//신고 리스트
	@Override
	public List<Report> selectReportList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Report> rList = session.selectList("reportMapper.selectAllReport", pi, rowBounds);
		return rList;
	}
	//신고게시물 개수
	@Override
	public int selectReportCount() {
		int result = session.selectOne("reportMapper.selectReportCount");
		return result;
	}
	//search
	@Override
	public List<Report> selectSearchList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Report> rList = session.selectList("reportMapper.selectSearchList", search, rowBounds);
		return rList;
	}
	// search 개수 
	@Override
	public int selectSearchCount(Search search) {
		int result = session.selectOne("reportMapper.selectSearchCount",search);
		return result;
	}
	
	
	//신고 게시물 삭제
	@Override
	public int deleteReportBoard(int boardNo) {
		
		deleteBoardsReply(boardNo);
		deleteBoardsReports(boardNo);
		int result =session.delete("reportMapper.deleteReportBoard", boardNo);
		return result;
		
	}
	//삭제할 게시물의 신고내역들 삭제
	public int deleteBoardsReports(int boardNo) {
		int result = session.delete("reportMapper.deleteBoardsReports", boardNo);
		return result;
	}
	//삭제할 게시물의 댓글들 삭제
	public int deleteBoardsReply(int boardNo) {
		int result = session.delete("reportMapper.deleteBoardsReplys",boardNo);
		return result;
	}
	//신고 내역 삭제
	@Override
	public int deleteReport(int reportNo) {
		int result =session.delete("reportMapper.deleteReport", reportNo);
		return result;
	}
	
	//댓글 신고 내역 all list
	@Override
	public List<ReplyReport> selectReplyReportList(PageInfo pi) {
		int offset=(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<ReplyReport> rrList = session.selectList("reportMapper.selectReplyReportList", pi, rowBounds);
		return rrList;
	}
	//댓글 search list
	@Override
	public List<ReplyReport> selectReplySearchList(PageInfo pi, Search search) {
		int offset=(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<ReplyReport> rrList = session.selectList("reportMapper.selectSearchReplyReportCount", search, rowBounds);
		return rrList;
	}
	//댓글신고내역 count
	@Override
	public int selectReplyReport(Search search) {
		int result = session.selectOne("reportMapper.selectReplyReportCount", search);
		return result;
	}
	//신고된 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
//		int result = 0;
//		int result1= deleteReplyReports(replyNo);
//		if(result1>0) {
//			result = session.delete("reportMapper.deleteReply", replyNo);
//		}
//		return result;
		int result = 0;
		deleteReplyReports(replyNo);
		result = session.delete("reportMapper.deleteReply", replyNo);
		return  result;
	}
	//삭제할 댓글의 신고내역들 삭제
	public int deleteReplyReports(int replyNo) {
		
		int result = session.delete("reportMapper.deleteReplyReports", replyNo);

		return result;
	}
	//신고내역 삭제
	@Override
	public int deleteReplyReport(int replyReportNo) {
		int result = session.delete("reportMapper.deleteReplyReport", replyReportNo);
		return result;
	}

	
	
}

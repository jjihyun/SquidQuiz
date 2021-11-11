package com.pj.ptsd.report.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.report.domain.PageInfo;
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
	//신고 게시물 삭제
	@Override
	public int deleteReportBoard(int boardNo) {
		int result =session.delete("reportMapper.deleteReportBoard", boardNo);
		return result;
	}
	//신고 내역 삭제
	@Override
	public int deleteReport(int reportNo) {
		int result =session.delete("reportMapper.deleteReport", reportNo);
		return result;
	}
	
	//신고 리스트 search
			
			
			
			//신고 댓글 리스트
			//신고 댓글 search
			//신고 댓글 삭제
			//댓글 신고 내역 삭제
}

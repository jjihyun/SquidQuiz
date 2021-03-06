package com.pj.ptsd.board.storelogic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.RPageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.store.BoardStore;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;

@Repository
public class BoardStoreLogic implements BoardStore {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Board> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Board> bList 
			= sqlSession.selectList("boardMapper.selectAllList", pi, rowBounds);
		return bList;
	}

	//다르게 적용한  return 이렇게도 되는구나
	@Override
	public Board printOne(int bNo) {
		return  sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
		
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("boardMapper.selectListCount");
		return count;
	}
	
	@Override
	public List<Board> selectSearchAll(Search search) {
		List<Board> searchList 
		= sqlSession.selectList("boardMapper.selectSearchList", search);
	return searchList;
	}

	@Override
	public int insertBoard(Board board) {
		int result = sqlSession.insert("boardMapper.insertBoard",board);
		return result;
	}

	@Override
	public int updateBoard(Board board) {
		int result = sqlSession.update("boardMapper.updateBoard", board);
		return result;
	}

	@Override
	public int deleteBoard(int bNo) {
		int result = sqlSession.delete("boardMapper.deleteBoard", bNo);
		return result;
	}

	@Override
	public List<Reply> selectAllReply(int bNo) {
		List<Reply> rList = sqlSession.selectList("boardMapper.selectReplyList", bNo);
		return rList;
	}

	@Override
	public int insertReply(Reply reply) {
		int result = sqlSession.insert("boardMapper.insertReply", reply);
		return result;
	}

	@Override
	public int updateReply(Reply reply) {
		int result = sqlSession.update("boardMapper.updateReply", reply);
		return result;
	}

	@Override
	public int deleteReply(Reply reply) {
		int result = sqlSession.delete("boardMapper.deleteReply",reply);
		return result;
	}

	@Override
	public int insertReportBoard(Report report) {
		int result = sqlSession.insert("reportMapper.insertReport",report);
		return result;
	}
	
	@Override
	public int insertReportReply(ReplyReport replyreport) {
		int result = sqlSession.insert("reportMapper.insertReply",replyreport);
		return result;
	}

	@Override
	public Report doubleReport(Report report) {
		Report report2 = sqlSession.selectOne("reportMapper.checkReport",report);
		return report2;
	}

//	@Override
//	public List<Reply> selectAll(RPageInfo rpageInfo) {
//		List<RPageInfo> rList = sqlSession.selectList("boardMapper.selectAllRList",rpageInfo);
//		return rList;
//	}
//
//	@Override
//	public List<Reply> selectAll(RPageInfo rpageInfo) {
//		List<Board> rList = sqlSession.selectList("boardMapper.selectAllRList",rpageInfo);
//		return rList;
//	}
}
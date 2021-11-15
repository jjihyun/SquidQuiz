package com.pj.ptsd.board.storelogic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.store.BoardStore;

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

	@Override
	public Board printOne(int bNo) {
		Board board = sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
		return board;
	}

	@Override
	public int selectListCount() {
//		int count = sqlSession.selectOne("boardMapper.selectListCount");
		return 0;
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
		int result = sqlSession.update("boardMapper.deleteReply",reply);
		return result;
	}

}
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
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

}
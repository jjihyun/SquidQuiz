package com.pj.ptsd.board.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.service.BoardService;
import com.pj.ptsd.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService {
	
	private BoardStore store;
	

	@Override
	public List<Board> printAll(PageInfo pi) {
		List<Board> bList = store.selectAll(pi);
		return bList;
	}

	@Override
	public List<Board> printSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board printOne(int bNo) {
		Board board = store.printOne(bNo);
		return board;
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
	public Board printreply(int replyNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reply> printAllReply(int bNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	

}

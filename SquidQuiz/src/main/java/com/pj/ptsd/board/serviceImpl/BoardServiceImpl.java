package com.pj.ptsd.board.serviceImpl;

import java.util.List;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.service.BoardService;

public class BoardServiceImpl implements BoardService {

	@Override
	public List<Board> printAll(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Board> printSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board printOne(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board printreply(int replyNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reply> printAllReply(int boardNo) {
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
	
	
	
	
	

}

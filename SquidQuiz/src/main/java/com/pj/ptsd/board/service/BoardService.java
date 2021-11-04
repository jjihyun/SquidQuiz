package com.pj.ptsd.board.service;

import java.util.List;


import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;


public interface BoardService {
	
	public List<Board> printAll(PageInfo pi);
	public List<Board> selectSearchAll(Search search);	
	
	
	public Board printOne(int boardNo);
	public int registerBoard(Board board);
	public int modifyBoard(Board board);
	public int removeBoard(int boardNo);
	
	public Board printreply(int replyNo);
	public List<Reply> printAllReply(int boardNo);
	public int registerReply(Reply reply);
	public int modifyReply(Reply reply);
	public int removeReply(Reply reply);
	
}

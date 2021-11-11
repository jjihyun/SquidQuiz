package com.pj.ptsd.board.store;

import java.util.List;


import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;

public interface BoardStore {
	
	public int selectListCount();
	public List<Board> selectAll(PageInfo pi);
	public List<Board> selectSearchAll(Search search);	
	
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int bNo);
	
	public List<Reply> selectAllReply(int bNo);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(Reply reply);
	public Board printOne(int bNo);

}

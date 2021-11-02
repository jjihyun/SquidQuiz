package com.pj.ptsd.board.service;

import com.pj.ptsd.board.domain.Board;

public interface BoardService {

	
	public int registerBoard(Board board);
	public int modifyBoard(Board board);
	public int removeBoard(Board board);
	//removeBoard int boardNo 생각해보기
	
	
}

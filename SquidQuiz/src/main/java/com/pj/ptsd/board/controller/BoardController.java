package com.pj.ptsd.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pj.ptsd.board.service.BoardService;


@Controller
public class BoardController {
	
	//게시글 작성
	@RequestMapping(value="boardWrite",method=RequestMethod.GET)
	public String boardWrite() {
		return "board/boardWrie";
	}
	
	
	
	
	
	
	
}



















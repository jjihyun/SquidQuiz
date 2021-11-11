package com.pj.ptsd.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Pagination;
import com.pj.ptsd.board.service.BoardService;




@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	//게시글 작성
	@RequestMapping(value="boardWrite.ptsd",method=RequestMethod.GET)
	public String boardWrite() {
		return "board/userNo";
	}
	
	//게시글 등록
	@RequestMapping(value="boardRegister.ptsd",method=RequestMethod.POST)
	public String registerBoard(
			@ModelAttribute Board board
			,@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile
			,Model model
			,HttpServletRequest request) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String bFileName = saveFile(uploadFile,request);
			if(bFileName != null) {
				board.setbFileName(uploadFile.getOriginalFilename());
				board.setbFileRename(bFileName);
			}
		}
		int result = service.registerBoard(board);
		
				if(result > 0) {
					return "redirect:boardList.ptsd";
				}else {
					model.addAttribute("msg", "게시물 조회 실패");
					return "common/errorPage";
				}
	}
	
	//파일저장	
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = uploadFile.getOriginalFilename();
		String bFileName 
			= sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String bfilePath = folder + "\\" + bFileName;
		try {
			uploadFile.transferTo(new File(bfilePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bFileName;
	}
	
	//게시글 목록
	@RequestMapping(value="boardList.ptsd", method=RequestMethod.GET)
	public ModelAndView boardListView(
			ModelAndView mv
			, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Board> bList = service.printAll(pi);
		if(!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardList");
		}else {
			mv.addObject("msg", "게시물 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//게시글 상세 조회
	@RequestMapping(value="boardDetail.ptsd", method=RequestMethod.GET)
	public ModelAndView boardDetail(
				ModelAndView mv
				, @RequestParam("bNo") int bNo ) {
		Board board = service.printOne(bNo);
		if(board != null) {
			mv.addObject("board", board);
			mv.setViewName("board/boardListDetail");
		}else {
			mv.addObject("msg", "게시물 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//게시글 수정
	@RequestMapping(value="boardModify.ptsd")
	public ModelAndView boardModifyView(
			ModelAndView mv
			,@RequestParam("boardNo") int boardNo) {
		Board board = service.printOne(boardNo);
		if(board != null) {
			mv.addObject("board", board);
			mv.setViewName("board/boardUpdate");
		}else {
			mv.addObject("msg", "게시물 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	//게시글 수정후 업로드
	@RequestMapping(value="boardUpdate.ptsd", method=RequestMethod.POST)
	public ModelAndView boardUpdate(
				ModelAndView mv
				, HttpServletRequest request
				, @ModelAttribute Board board
				, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile) {
		if(reloadFile != null) {
			//기존 파일 삭제
			if(board.getbFileName() != "") {
				deleteFile(board.getbFileRename(), request);
			}
			//새파일 업로드
			String fileRename = saveFile(reloadFile, request);
			if(fileRename != null) {
				board.setbFileName(reloadFile.getOriginalFilename());
				board.setbFileRename(fileRename);
			}
		}
		int result = service.modifyBoard(board);
		if(result > 0) {
			mv.setViewName("redirect:boardList.ptsd");
		}else {
			mv.addObject("msg", "게시물 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession()
				.getServletContext().getRealPath("resources");
		String fullPath = root + "\\buploadFiles";
		File file = new File(fullPath + "\\" + fileName);
		if(file.exists()) {
			file.delete(); 
		}
	}

	//게시글 삭제
	@RequestMapping(value="boardDelete.ptsd", method=RequestMethod.GET)
	public String boardDelete(
			Model model
			,@RequestParam("bNo") int bNo
			,@RequestParam("fileName") String fileRename
			,HttpServletRequest request) {

		//DB에서 업데이트
		int result = service.removeBoard(bNo);
		if(result > 0) {
			if(fileRename != "") {
				//업로드 파일 삭제
				deleteFile(fileRename, request);
			}
			return "redirect:boardList.ptsd";
		}else {
			model.addAttribute("msg", "게시물 조회 실패");
			return "common/errorPage";
		}
	}
	
	
}
	
	
	
	
	




















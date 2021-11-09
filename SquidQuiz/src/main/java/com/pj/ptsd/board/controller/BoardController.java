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
import com.pj.ptsd.board.service.BoardService;
import com.pj.ptsd.campaign.Pagination;



@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	//게시글 작성
	@RequestMapping(value="boardWrite.ptsd",method=RequestMethod.GET)
	public String boardWrite() {
		return "board/boardWrite";
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
	
	//파일 저장	
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
	
//	@RequestMapping(value="boardList.ptsd", method=RequestMethod.GET)
//	public ModelAndView boardListView(
//			ModelAndView mv
//			, @RequestParam(value="page", required=false) Integer page) {
//		int currentPage = (page != null) ? page : 1;
//		int totalCount = service.getListCount();
//		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
//		List<Board> bList = service.printAll(pi);
//		if(!bList.isEmpty()) {
//			mv.addObject("bList", bList);
//			mv.addObject("pi", pi);
//			mv.setViewName("board/boardList");
//		}else {
//			mv.addObject("msg", "게시물 조회 실패");
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
	
	
}
	
	
	
	
	




















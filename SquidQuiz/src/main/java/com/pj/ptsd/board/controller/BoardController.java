package com.pj.ptsd.board.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.board.domain.PageInfo;
import com.pj.ptsd.board.domain.Pagination;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.service.BoardService;
import com.pj.ptsd.user.domain.User;





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
		System.out.println(board.getbTitle()+board.getUserId()+board.getbContents());
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
		String savePath = root + "\\boardloadFiles";
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
	
	//게시글 목록 / 페이징
	 @RequestMapping(value = "/board/boardList.ptsd")
	    public ModelAndView BoardList(HttpServletRequest request) throws Exception {
	        ModelAndView mv = new ModelAndView("/board/boardList");

	        try {
	            int currentPage = 1; // 현재 페이지 번호
	            // pageNum이 null이 아니면 현재 페이지를 받아온다.
	            if (request.getParameter("pageNum") != null) {
	                currentPage = Integer.parseInt(request.getParameter("pageNum"));
	            }

	            String select = request.getParameter("select");
	            String search = request.getParameter("search");

//	            // 페이지 정보를 담는다.
//	            PageInfo boardPage = new PageInfo();
//	            boardPage.setCurrentPage(currentPage); // 현재 페이지 번호 set
//	            boardPage.setTotalCount(BoardService.get(select, search));
//
//	            // 게시글을 불러온다.
//	            List<Map<String, Object>> boardList = BoardService.selectBoardList(boardPage.getStartRow(),
//	                                                                               boardPage.getEndRow(),
//	                                                                               select,
//	                                                                               search);

//	            // boardList를 넘겨준다.
//	            mv.addObject("list", boardList);
//	            // 페이징 정보를 넘긴다.
//	            mv.addObject("page", boardPage);
	            // select, search를 넘겨줘서 페이징을 했을때도 값이 남아있게 한다.
	            mv.addObject("select", select);
	            mv.addObject("search", search);

	        } catch (Exception e) {
	            e.printStackTrace();
	            mv = new ModelAndView("redirect:result/error.html");
	            mv.addObject("Exception", e.toString());
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
			mv.setViewName("board/boardDetail");
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
			,@RequestParam("bNo") int bNo) {
		Board board = service.printOne(bNo);
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
		String fullPath = root + "\boardloadFiles";
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
	
	//댓글 작성
	@ResponseBody
	@RequestMapping(value="addReply.ptsd", method=RequestMethod.POST)
	public String addReply(
			@ModelAttribute Reply reply , HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		int result = service.registerReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//댓글 목록
		@RequestMapping(value="replyList.ptsd", method=RequestMethod.GET)
		public void getReplyList(
				@RequestParam("bNo")int bNo, HttpServletResponse response) {
			List<Reply> rList = service.printAllReply(bNo);
			//JSONobject
			if(!rList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				try {
					gson.toJson(rList, response.getWriter());
				} catch (JsonIOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}else {
					System.out.println("데이터가 없습니다");
			}
		}
	
		//댓글 수정
		@ResponseBody
		@RequestMapping(value="modifyReply.ptsd", method=RequestMethod.POST)
		public String modifyReply(@ModelAttribute Reply reply) {
			int result = service.modifyReply(reply);
			if(result > 0 ) {
				return "success";
			}else {
				return "fail";
			}
		}
		
		//댓글 삭제
		@ResponseBody
		@RequestMapping(value = "deleteReply.ptsd", method=RequestMethod.GET)
		public String deleteReply(@ModelAttribute Reply reply) {
			int result = service.removeReply(reply);
			if(result > 0 ) {
				return "success";
			}else {
				return "fail";
			}
		}	
		//검색
		@RequestMapping(value="boardSearch.ptsd", method=RequestMethod.GET)
		public String noticeSearchList(
				@ModelAttribute Search search
				,Model model) {
			List<Board> searchList = service.printSearchAll(search);
			if(!searchList.isEmpty()) {
				model.addAttribute("bList", searchList);
				model.addAttribute("search", search);
				model.addAttribute("page", 1);
				return "board/boardList";
			}else {
				model.addAttribute("msg", "공지사항 검색 실패");
				return "common/errorPage";
			}
		}
		
}

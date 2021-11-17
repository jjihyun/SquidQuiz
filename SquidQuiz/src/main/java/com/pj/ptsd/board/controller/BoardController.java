package com.pj.ptsd.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
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
	public String boardWrite(HttpSession session,HttpServletRequest request) {
		User loginUser = (User)session.getAttribute("loginUser");
		request.setAttribute("loginUser",loginUser);
		return "board/boardWrite";
	}
	
	
	
	
	
	//게시글 등록
	@RequestMapping(value="boardRegister.ptsd",method=RequestMethod.POST)
	public String registerBoard(
			@ModelAttribute Board board
			,@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile
			,Model model
			,HttpServletRequest request,HttpSession session) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String bFileName = saveFile(uploadFile,request);
			if(bFileName != null) {
				board.setbFileName(uploadFile.getOriginalFilename());
				board.setbFileRename(bFileName);
			}
		}
		System.out.println(board.getbTitle()+board.getUserId()+board.getbContents());
		User loginUser = (User)session.getAttribute("loginUser");
		board.setUserId(loginUser.getUserId());
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
				ModelAndView mv, HttpSession session
				, @RequestParam("bNo") int bNo ) {
		Board board = service.printOne(bNo);
		User loginUser = (User)session.getAttribute("loginUser");
		if(board != null) {
			mv.addObject("loginUser",loginUser);
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
//			기존 파일 삭제
			if(board.getbFileName() != "") {
				deleteFile(board.getbFileRename(), request);
			}
//			새파일 업로드
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
				model.addAttribute("msg", "게시물 조회 실패");
				return "common/errorPage";
			}
		}
		
//		@RequestMapping(value = "boardck.ptsd", method = RequestMethod.POST)
//		public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, 
//				@RequestParam MultipartFile upload)throws Exception {
//		 
//		    OutputStream out = null;
//		    PrintWriter printWriter = null;
//		    response.setCharacterEncoding("utf-8");
//		    response.setContentType("text/html;charset=utf-8");
//		 
//		    try{
//		 
//		        String fileName = upload.getOriginalFilename();
//		        byte[] bytes = upload.getBytes();
//		        String uploadPath = "C:\\Users\\현종\\Desktop\\PTSDFinal\\SquidQuiz\\src\\main\\webapp\\resources\\boardloadFiles" + fileName;//저장경로
//		 
//		        out = new FileOutputStream(new File(uploadPath));
//		        out.write(bytes);
//		        String callback = request.getParameter("CKEditorFuncNum");
//		 
//		        printWriter = response.getWriter();
//		        String fileUrl = request.getContextPath()+"/images/" + fileName;//url경로
//		 
//		        printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//		                + callback
//		                + ",'"
//		                + fileUrl
//		                + "','이미지를 업로드 하였습니다.'"
//		                + ")</script>");
//		        printWriter.flush();
//		 
//		    }catch(IOException e){
//		        e.printStackTrace();
//		    } finally {
//		        try {
//		            if (out != null) {
//		                out.close();
//		            }
//		            if (printWriter != null) {
//		                printWriter.close();
//		            }
//		        } catch (IOException e) {
//		            e.printStackTrace();
//		        }
//		    }
//		 
//		    return;
//		}
}

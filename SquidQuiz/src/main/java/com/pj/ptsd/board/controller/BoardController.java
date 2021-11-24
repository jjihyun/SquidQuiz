package com.pj.ptsd.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.pj.ptsd.board.domain.RPageInfo;
import com.pj.ptsd.board.domain.Reply;
import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.board.service.BoardService;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;
import com.pj.ptsd.user.domain.User;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	// 게시글 작성
	@RequestMapping(value = "boardWrite.ptsd", method = RequestMethod.GET)
	public String boardWrite(HttpSession session, HttpServletRequest request) {
		User loginUser = (User) session.getAttribute("loginUser");
		request.setAttribute("loginUser", loginUser);
		return "board/boardWrite";
	}

	// 게시글 등록
	@RequestMapping(value = "boardRegister.ptsd", method = RequestMethod.POST)
	public String registerBoard(@ModelAttribute Board board
	// ,@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile
			, Model model, HttpServletRequest request, HttpSession session) {
		// if(!uploadFile.getOriginalFilename().equals("")) {
		// String bFileName = saveFile(uploadFile,request);
		// if(bFileName != null) {
		// board.setbFileName(uploadFile.getOriginalFilename());
		// board.setbFileRename(bFileName);
		// }
		// }
		System.out.println(board.getbTitle() + board.getUserId() + board.getbContents());
		User loginUser = (User) session.getAttribute("loginUser");
		board.setUserId(loginUser.getUserId());
		int result = service.registerBoard(board);
		if (result > 0) {
			return "redirect:boardList.ptsd";
		} else {
			model.addAttribute("msg", "게시물 조회 실패");
			return "common/errorPage";
		}
	}

	// 파일저장
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\boardloadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = uploadFile.getOriginalFilename();
		String bFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
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

	// 게시글 목록 / 페이징
	@RequestMapping(value = "boardList.ptsd", method = RequestMethod.GET)
	public ModelAndView boardListView(ModelAndView mv, HttpSession session,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		System.out.println(currentPage + totalCount);
		List<Board> bList = service.printAll(pi);
		User loginUser = (User) session.getAttribute("loginUser");

		if (!bList.isEmpty()) {
			mv.addObject("loginUser", loginUser);
			mv.addObject("bList", bList);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardList");
		} else {
			mv.addObject("msg", "게시물 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 상세 조회
	@RequestMapping(value = "boardDetail.ptsd", method = RequestMethod.GET)
	public ModelAndView boardDetail(ModelAndView mv, HttpSession session, @RequestParam("bNo") int bNo) {
		Board board = service.printOne(bNo);
		User loginUser = (User) session.getAttribute("loginUser");
		if (board != null) {
			mv.addObject("loginUser", loginUser);
			mv.addObject("board", board);
			mv.setViewName("board/boardDetail");
		} else {
			mv.addObject("msg", "게시물 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 수정
	@RequestMapping(value = "boardModify.ptsd")
	public ModelAndView boardModifyView(ModelAndView mv, @RequestParam("bNo") int bNo) {
		Board board = service.printOne(bNo);
		if (board != null) {
			mv.addObject("board", board);
			mv.setViewName("board/boardUpdate");
		} else {
			mv.addObject("msg", "게시물 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시글 수정후 업로드
	@RequestMapping(value = "boardUpdate.ptsd", method = RequestMethod.POST)
	public ModelAndView boardUpdate(ModelAndView mv, HttpServletRequest request, @ModelAttribute Board board,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
		if (reloadFile != null) {
			//기존 파일 삭제
			if (board.getbFileName() != "") {
				deleteFile(board.getbFileRename(), request);
			}
			//새파일 업로드
			String fileRename = saveFile(reloadFile, request);
			if (fileRename != null) {
				board.setbFileName(reloadFile.getOriginalFilename());
				board.setbFileRename(fileRename);
			}
		}
		int result = service.modifyBoard(board);
		if (result > 0) {
			mv.setViewName("redirect:boardList.ptsd");
		} else {
			mv.addObject("msg", "게시물 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root + "\boardloadFiles";
		File file = new File(fullPath + "\\" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}

	// 게시글 삭제
	@RequestMapping(value = "boardDelete.ptsd", method = RequestMethod.GET)
	public String boardDelete(Model model, @RequestParam("bNo") int bNo, @RequestParam("fileName") String fileRename,
			HttpServletRequest request) {

		// DB에서 업데이트
		int result = service.removeBoard(bNo);
		if (result > 0) {
			if (fileRename != "") {
				// 업로드 파일 삭제
//				deleteFile(fileRename, request);
			}
			return "redirect:boardList.ptsd";
		} else {
			model.addAttribute("msg", "게시물 조회 실패");
			return "common/errorPage";
		}
	}

	// 댓글 작성
	@ResponseBody
	@RequestMapping(value = "addReply.ptsd", method = RequestMethod.POST)
	public String addReply(@ModelAttribute Reply reply, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		int result = service.registerReply(reply);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 댓글 목록
	@RequestMapping(value = "replyList.ptsd", method = RequestMethod.GET)
	public void getReplyList(@RequestParam("bNo") int bNo, HttpServletResponse response) {
		List<Reply> rList = service.printAllReply(bNo);
		// JSONobject
		System.out.println(rList);
		if (!rList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
			try {
				gson.toJson(rList, response.getWriter());
			} catch (JsonIOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println("데이터가 없습니다");
		}
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping(value = "modifyReply.ptsd", method = RequestMethod.POST)
	public String modifyReply(@ModelAttribute Reply reply, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		int result = service.modifyReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "deleteReply.ptsd", method = RequestMethod.GET)
	public String deleteReply(@ModelAttribute Reply reply, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		int result = service.removeReply(reply);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 검색
	@RequestMapping(value = "boardSearch.ptsd", method = RequestMethod.GET)
	public String noticeSearchList(@ModelAttribute Search search, Model model) {
		List<Board> searchList = service.printSearchAll(search);
		if (!searchList.isEmpty()) {
			model.addAttribute("bList", searchList);
			model.addAttribute("search", search);
			model.addAttribute("page", 1);
			return "board/boardList";
		} else {
			model.addAttribute("msg", "게시물 조회 실패");
			return "common/errorPage";
		}
	}

	// HttpSession 매장
	// Attribute 가방 > () 괄호가 가방안 물건
	// 관리자페이지로 내용을 전달해야하는데....
	// 게시글 신고
	@ResponseBody
	@RequestMapping(value = "boardReport.ptsd", method = RequestMethod.GET)
	public String report(@ModelAttribute Report report, HttpSession session, Model model, @RequestParam("bNo") int bNo,
			@RequestParam("writer") String writer, @RequestParam("title") String title) {
		User loginUser = (User) session.getAttribute("loginUser");
		// 필통안에 여러가지 담김
		System.out.println(writer);
		report.setReportedUserId(loginUser.getUserId());
		report.setBoardNo(bNo);
		report.setBoardWriter(writer);
		report.setBoardTitle(title);
		// report 안에있는 bNo하고 현재 세션에 담겨있는 userId를 where에다 넣어서
		// 그값이 있는지 없는지 확인후 없으면 신고가 들어가게 값이 있으면 안들어가게.
		Report report2 = service.doubleReport(report);
		if (report2 == null) {
			int result = service.registerReportBoard(report);
			if (result > 0) {
				return "success";
			} else {
				return "common/errorPage";
			}
		} else {
			return "error";
		}
	}

	// 댓글 신고
	@ResponseBody
	@RequestMapping(value = "replyreport.ptsd", method = RequestMethod.GET)
	public String replyrepot(@ModelAttribute ReplyReport replyreport, HttpSession session, Model model,
			@RequestParam("bNo") int bNo, @RequestParam("replyNo") int replyNo,
			@RequestParam("contents") String contents,@RequestParam("writer") String writer) {
		User loginUser = (User) session.getAttribute("loginUser");
		// set 가져온다 get 보내준다 ()~에서 가져온다 라는 느낌
		replyreport.setReportedUserId(loginUser.getUserId());
		replyreport.setBoardNo(bNo);
		replyreport.setReplyNo(replyNo);
		replyreport.setReplyContents(contents);
		replyreport.setReplyWriter(writer);
		int result = service.registerReportReply(replyreport);
		if (result > 0) {
			return "success";
		} else {
			return "common/errorPage";
		}
	}
}

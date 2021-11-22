package com.pj.ptsd.report.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.report.domain.PageInfo;
import com.pj.ptsd.report.domain.ReplyReport;
import com.pj.ptsd.report.domain.Report;
import com.pj.ptsd.report.domain.ReportPagination;
import com.pj.ptsd.report.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService service;

	
	
	
	
	//신고 게시물 리스트
	@RequestMapping(value="reportListView.ptsd")
	public String reportListView(Model model,
			@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getReportCount();
		PageInfo pi = ReportPagination.getPageInfo(currentPage, totalCount);
		List<Report> rList = service.printReportList(pi);
		
		if (!rList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			return "report/reportListView";
		} else {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", null);
			return "report/reportListView";
		}
	}
	//신고 리스트 키워드로 search
	@RequestMapping(value="reportSearchView.ptsd")
	public String reportSearchView(Model model,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page != null) ? page : 1  ;  
		int totalCount = service.getSearchCount(search);
		PageInfo pi = ReportPagination.getPageInfo(currentPage, totalCount);
		List<Report> rList = service.printSearchList(pi, search);
		if(!rList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("search", search);
			return "report/reportListView";
		}else {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", null);
			model.addAttribute("search", search);
			return "report/reportListView";
		}
	}
	//신고 게시물 삭제
	@RequestMapping(value="reportBoardDelete.ptsd")
	public void reportBoardDelete (ModelAndView mv
			,@RequestParam("boardNo") int boardNo
			,@RequestParam("reportNo") int reportNo
			,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.removeReportBoard(boardNo);
			if(result>0) {
				out.println("<script>alert('게시물이 삭제되었습니다.');window.location=document.referrer;</script>");
			}else {
				out.println("<script>alert('게시물 삭제에 실패하였습니다. 다시 시도해주세요.');window.location=document.referrer;</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		
	
	}
	//게시물 신고 내역 삭제
	@RequestMapping(value="reportDelete.ptsd")
	public void reportDelete (ModelAndView mv,@RequestParam("reportNo") int reportNo,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.removeReport(reportNo);
			if(result>0) {
				out.println("<script>alert('신고 내역이 삭제되었습니다.');window.location=document.referrer;</script>");
			}else {
				out.println("<script>alert('신고 내역 삭제에 실패하였습니다.');window.location=document.referrer;</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		
	}
	//신고 댓글 리스트
	@RequestMapping(value="replyReportListView.ptsd")
	public String replyReportListView(Model model,
			@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		Search search = null;
		int totalCount = service.getReplyReport(search );
		PageInfo pi = ReportPagination.getPageInfo(currentPage, totalCount);
		List<ReplyReport> rList = service.printReplyReportList(pi);
//		System.out.println(totalCount);
		if (!rList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			return "report/reportReplyListView";
		} else {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", null);
			return "report/reportReplyListView";
		}
	}
	//신고 댓글 search
	
	
	@RequestMapping(value="replyReportSearchView.ptsd")
	public String replySearchView(Model model,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page != null) ? page : 1  ;  
		int totalCount = service.getReplyReport(search);
		PageInfo pi = ReportPagination.getPageInfo(currentPage, totalCount);
		List<ReplyReport> rList = service.printReplySearchList(pi, search);
		if(!rList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", rList);
			model.addAttribute("search", search);
			return "report/reportReplyListView";
		}else {
			model.addAttribute("pi", pi);
			model.addAttribute("rList", null);
			model.addAttribute("search", search);
			return "report/reportReplyListView";
		}
	}
	//신고 댓글 삭제
	
	@RequestMapping(value="replyDelete.ptsd")
	public void reportReplyDelete (ModelAndView mv
			,@RequestParam("replyNo") int replyNo
 			,@RequestParam("replyReportNo") int replyReportNo
			,HttpServletResponse response) {
		try {
			System.out.println("cont"+replyNo + replyReportNo);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			service.removeReplyReport(replyReportNo);
			int result = service.removeReply(replyNo);
			if(result>0) {
				out.println("<script>alert('해당 댓글을 삭제하였습니다.');window.location=document.referrer;</script>");
			}else {
				out.println("<script>alert('해당 댓글 삭제에 실패하였습니다.');window.location=document.referrer;</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		
	
	}
	//댓글 신고 내역 삭제
	@RequestMapping(value="replyReportDelete.ptsd")
	public void replyReportDelete (ModelAndView mv,@RequestParam("replyReportNo") int replyReportNo,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.removeReplyReport(replyReportNo);
			if(result>0) {
				out.println("<script>alert('해당 신고 내역을 삭제하였습니다.');window.location=document.referrer;</script>");
			}else {
				out.println("<script>alert('해당 신고 내역 삭제에 실패하였습니다.');window.location=document.referrer;</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		
	}
}

package com.pj.ptsd.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.report.domain.PageInfo;
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
			model.addAttribute("msg", "서치 실패");
			return "common/errorPage";
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
			model.addAttribute("msg", "서치 실패");
			return "common/errorPage";
		}
	}
	//신고 게시물 삭제
	@RequestMapping(value="reportBoardDelete.ptsd")
	public String reportBoardDelete (Model model
			,@RequestParam("boardNo") int boardNo
			,@RequestParam("reportNo") int reportNo) {
		try {
			service.removeReport(reportNo);
			int result = service.removeReportBoard(boardNo);
			if(result>0) {
				
				return "redirect:reportListView.ptsd";
			}else {
				model.addAttribute("msg","신고된 게시물 삭제 실패");
				return "common/errorPage"; 
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage"; 
		}
		
	
	}
	//신고 내역 삭제
	@RequestMapping(value="reportDelete.ptsd")
	public String reportDelete (Model model,@RequestParam("reportNo") int reportNo) {
		try {
			int result = service.removeReport(reportNo);
			if(result>0) {
				
				return "redirect:reportListView.ptsd";
			}else {
				model.addAttribute("msg","신고된 게시물 삭제 실패");
				return "common/errorPage"; 
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage"; 
		}
		
	}
	//신고 댓글 리스트
	@RequestMapping(value="replyReportListView.ptsd")
	public String replyReportListView(Model model,
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
			model.addAttribute("msg", "서치 실패");
			return "common/errorPage";
		}
	}
	//신고 댓글 search
	
	//신고 리스트 키워드로 search
	@RequestMapping(value="replyReportSearchView.ptsd")
	public String replySearchView(Model model,
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
			model.addAttribute("msg", "서치 실패");
			return "common/errorPage";
		}
	}
	//신고 댓글 삭제
	
	@RequestMapping(value="replyDelete.ptsd")
	public String reportReplyDelete (Model model
			,@RequestParam("replyReportNo") int replyReportNo
			,@RequestParam("replyNo") int replyNo) {
		try {
			//??????
			service.removeReplyReport(replyReportNo);
			int result = service.removeReply(replyNo);
			if(result>0) {
				
				return "redirect:reportListView.ptsd";
			}else {
				model.addAttribute("msg","신고된 게시물 삭제 실패");
				return "common/errorPage"; 
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage"; 
		}
		
	
	}
	//댓글 신고 내역 삭제
	@RequestMapping(value="replyReportDelete.ptsd")
	public String replyReportDelete (Model model,@RequestParam("replyReportNo") int replyReportNo) {
		try {
			int result = service.removeReport(replyReportNo);
			if(result>0) {
				
				return "redirect:reportListView.ptsd";
			}else {
				model.addAttribute("msg","신고된 게시물 삭제 실패");
				return "common/errorPage"; 
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage"; 
		}
		
	}
}

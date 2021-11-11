package com.pj.ptsd.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			model.addAttribute("rList", rList);
			return "report/reportListView";
		} else {

		}
		return "report/reportListView";
	}
	//신고 리스트 search
	//신고 게시물 삭제
	@RequestMapping(value="reportBoardDelete.ptsd")
	public String reportBoardDelete (Model model,@RequestParam("boardNo") int boardNo) {
		try {
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
	//신고 댓글 search
	//신고 댓글 삭제
	//댓글 신고 내역 삭제
}

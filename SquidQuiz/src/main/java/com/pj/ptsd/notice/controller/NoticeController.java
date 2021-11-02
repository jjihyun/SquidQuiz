package com.pj.ptsd.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.notice.domain.Notice;
import com.pj.ptsd.notice.service.NoticeService;
import com.pj.ptsd.qna.domain.Qna;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// 공지 / 문의 페이지 view
	@RequestMapping(value="noticeQnaListView.ptsd")
	public ModelAndView  noticeQnaListView(
			ModelAndView mv
//			, @RequestParam("adminType") String adminType
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String adminType = (String) session.getAttribute("adminType");
		int userNo = 0;
		List<Notice> nList=service.printAllNotice();
		List<Qna> qList = null;
		if (adminType=="Y") {
			qList = service.printAllQna();
			
			
		} else {
			qList = service.printUserQna(userNo);
			
		}
		mv.addObject("nList", nList);
		mv.addObject("qList", qList);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	//공지 작성 페이지로
	@RequestMapping(value="noticeWriteView.ptsd")
	public String noticeWriteView() {
		
		return "notice/noticeWriteForm";
	}
	//공지 작성
	@RequestMapping(value="noticeRegister.ptsd", method=RequestMethod.POST)
	public String registerNotice(
			@ModelAttribute Notice notice
			, Model model) {
		try {
			int result = service.registerNotice(notice);
			if(result>0) {
				return "redirect:noticeQnaListView.ptsd";
			}else {
				model.addAttribute("msg", "공지 등록 실패");
				return "notice/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "notice/errorPage";
		}
	}
	//공지 수정
	
	//공지 작성
	
}

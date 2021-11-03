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
	
	// 공지 리스트
	@RequestMapping(value="noticeListView.ptsd")
	public ModelAndView  noticeListView(
			ModelAndView mv
//			, @RequestParam("adminType") String adminType
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String adminType = (String) session.getAttribute("adminType");
		try {
			List<Notice> nList=service.printAllNotice();
			if(!nList.isEmpty()) {
				
				mv.addObject("nList", nList);
				mv.setViewName("notice/noticeList");
			}else {
				mv.setViewName("notice/noticeList");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("notice/noticeError");
		}
		return mv;
	}
	//공지 상세 조회 (1개 조회)
	@RequestMapping(value="noticeDetail.ptsd")
	public String noticeOneView(Model model, @RequestParam("noticeNo") int noticeNo) {
		
		return "";
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
				return "redirect:noticeListView.ptsd";
			}else {
				model.addAttribute("msg", "공지 등록 실패");
				return "notice/noticeError";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "notice/noticeError";
		}
	}
	//공지 삭제
	@RequestMapping(value="noticeRemove.ptsd", method=RequestMethod.GET)
	public String removeNotice(@RequestParam("noticeNo") int noticeNo,Model model) {
		
		try {
			int result = service.removeNotice(noticeNo);
			if (result>0) {
				
			} else {

			}
		} catch (Exception e) {

		}
		return "";
	}
	//공지 수정 페이지로
	@RequestMapping(value="noticeModifyView.ptsd", method=RequestMethod.GET)
	public String modifyNoticeView() {
		
		return "notice/noticeModifyForm";
	}
	//공지 수정하기
	@RequestMapping(value="noticeModify.ptsd", method=RequestMethod.POST)
	public String modifyNotice(@ModelAttribute Notice notice,
			Model model) {
		return "";
	}
}

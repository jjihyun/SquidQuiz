package com.pj.ptsd.notice.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// 공지 리스트
	@RequestMapping(value="noticeListView.ptsd")
	public String  noticeListView(
			Model model	) {

		try {
			List<Notice> nList=service.printAllNotice();
			if(!nList.isEmpty()) {
				
				model.addAttribute("nList", nList);
			}else {
				model.addAttribute("nList", null);
			}
			return "notice/noticeList";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "notice/noticeError";
		}
	}
	//공지 상세 조회 (1개 조회)
	@RequestMapping(value="noticeDetail.ptsd")
	public String noticeOneView(Model model, @RequestParam("noticeNo") int noticeNo) {
		
		try {
			Notice notice = service.printOneNotice(noticeNo);
			if(notice != null) {
				model.addAttribute("notice", notice);
				return "notice/noticeDetail";
			}else {
				model.addAttribute("msg", "공지사항 상세조회 실패");
				return "notice/noticeError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "notice/noticeError";
		}
	}
	
	//공지 작성 페이지로
	@RequestMapping(value="noticeWriteView.ptsd")
	public String noticeWriteView() {
		
		return "notice/noticeWriteForm";
	}
	//공지 작성
	@RequestMapping(value="noticeRegister.ptsd", method=RequestMethod.POST)
	public void registerNotice(
			@ModelAttribute Notice notice
			, ModelAndView mv
			, HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			int result = service.registerNotice(notice);
			if(result>0) {
				out.println("<script>alert('공지사항 작성이 완료되었습니다.');</script>");
			}else {
				out.println("<script>alert('공지사항 작성에 실패하였습니다. 다시 시도해주세요');</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
	//공지 삭제
	@RequestMapping(value="noticeRemove.ptsd", method=RequestMethod.GET)
	public void removeNotice(@RequestParam("noticeNo") int noticeNo
			,ModelAndView mv
			,HttpServletResponse response) {
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.removeNotice(noticeNo);
			if (result>0) {
				out.println("<script>alert('공지사항이 삭제되었습니다.');location.href='qnaListView.ptsd';</script>");
			} else {
				out.println("<script>alert('공지사항 삭제를 실패하였습니다. 다시 시도해주세요.');location.href = 'qnaListView.ptsd';</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
	//공지 수정 페이지로
	@RequestMapping(value="noticeModifyView.ptsd", method=RequestMethod.GET)
	public String modifyNoticeView(@RequestParam("noticeNo") int noticeNo,Model model) {
		Notice notice = service.printOneNotice(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/noticeUpdate";
	}
	//공지 수정하기
	@RequestMapping(value="noticeModify.ptsd", method=RequestMethod.POST)
	public void modifyNotice(@ModelAttribute Notice notice,
			ModelAndView mv
			,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.modifyNotice(notice);
			if (result > 0) {
				out.println("<script>alert('공지사항 수정이 완료되었습니다.');</script>");
			} else {
				out.println("<script>alert('공지사항 수정에 실패하였습니다.다시 시도해주세요.');</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
}

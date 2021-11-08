package com.pj.ptsd.qna.controller;

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

import com.pj.ptsd.qna.domain.Qna;
import com.pj.ptsd.qna.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;
	
	//전체조회 
	@RequestMapping(value="qnaListView.ptsd", method=RequestMethod.GET)
	public String qnaListView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String adminType =
		(String)session.getAttribute("adminType");
		int userNo = Integer.parseInt((String)(session.getAttribute("userNo")));
		
		try {
			List<Qna> qList = null;
			
			if (adminType == "Y") {
				qList = service.printAllQna();
			} else {
				qList = service.printQnaById(userNo);
			}
			if (!qList.isEmpty()) {
				model.addAttribute("qList", qList);
				return "qna/qnaList";
			} else {
				model.addAttribute("msg", "QnA 목록 가져오기 실패");
				return "qna/qnaError";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "qna/qnaError";
		}
		
	}

	//상세조회
	@RequestMapping(value="qnaDetailView.ptsd", method=RequestMethod.GET)
	public String printOneQna(Model model,@RequestParam("qnaNo") int qnaNo) {
		try {
			Qna qna = service.printOneQna(qnaNo);
			if (qna != null) {
				model.addAttribute("qna", qna);
				return "qna/qnaDetail";
			} else {
				model.addAttribute("msg", "문의 상세 조회 실패");
				return "qna/qnaError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "qna/qnaError";
		}
	}
	//문의등록(회원)
	@RequestMapping(value="qnaWriteView.ptsd")
	public String qnaWriteView() {
		return "qna/qnaWriteView";
	}
	@RequestMapping(value="registerQna.ptsd", method=RequestMethod.POST)
	public String registerQna(Model model,@ModelAttribute Qna qna) {
		try {
			
			int result = service.registerQna(qna);
			if (result > 0) {
				
				return "redirect:qnaListView.ptsd";
			} else {
				model.addAttribute("msg", "문의 상세 조회 실패");
				return "qna/qnaError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "qna/qnaError";
		}
		
	}
	//문의답변(관리자)
	@RequestMapping(value="modifyQnaView.ptsd")
	public String modifyQnaView(Model model,@RequestParam("qnaNo") int qnaNo) {
	
			Qna qna = service.printOneQna(qnaNo);
			model.addAttribute("qna", qna);
				return "qna/qnaUpdate";
	
	}
	@RequestMapping(value="modifyAnswer.ptsd", method=RequestMethod.POST)
	public String modifyQna(Model model,@ModelAttribute Qna qna) {
		try {
			int result = service.modifyAnswer(qna);
			if (result>0) {
				
				return "redirect:qnaDetailView.ptsd?qnaNo="+ qna.getQnaNo();
			} else {
				model.addAttribute("msg", "답변 달기 실패");
				return "qna/qnaError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "qna/qnaError";
		}
	}
	//문의 삭제 (회원)
	@RequestMapping(value="removeQna.ptsd", method=RequestMethod.GET)
	public String remove(Model model,HttpServletRequest request,@RequestParam("qnaNo") int qnaNo) {
		try {
			int result = service.removeQna(qnaNo);
			if (result > 0) {
				return "redirect:qnaListView.ptsd";
			} else {
				model.addAttribute("msg", "문의 삭제 실패");
				return "qna/qnaError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "qna/qnaError";
		}
	}
	
}

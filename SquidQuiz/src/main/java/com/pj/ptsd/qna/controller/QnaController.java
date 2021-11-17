package com.pj.ptsd.qna.controller;

import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.board.domain.Search;
import com.pj.ptsd.qna.domain.PageInfo;
import com.pj.ptsd.qna.domain.Qna;
import com.pj.ptsd.qna.domain.QnaPagination;
import com.pj.ptsd.qna.domain.QnaSearch;
import com.pj.ptsd.qna.service.QnaService;
import com.pj.ptsd.user.domain.User;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;
	
	//전체조회 
	@RequestMapping(value="qnaListView.ptsd", method=RequestMethod.GET)
	public String qnaListView(Model model
			, HttpServletRequest request
			, @RequestParam(value="page",required=false) Integer page) {
		int currentPage = (page!=null) ? page : 1 ;
		int totalCount = 0;
		List<Qna> qList = null;
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		//로그인 정보 없을시 문의사항 리스트는 없음
		if(loginUser==null) {
			model.addAttribute("qList", null);
			return "qna/qnaList";
		}
		String userId =	loginUser.getUserId();
		char adminType = loginUser.getAdminType();
		System.out.println(userId + adminType);
		if(adminType=='Y') {
			totalCount = service.getAllListCount();
		}else if(adminType=='N') {
			totalCount = service.getOwnListCount(userId);
		}else{
			model.addAttribute("qList", null);
			return "qna/qnaList";
		}
		PageInfo pi = QnaPagination.getPageInfo(currentPage, totalCount);
		try {
			
			
			if (adminType == 'Y') {
				qList = service.printAllQna(pi);
				
			} else {
				qList = service.printQnaById(pi,userId);
			}
			if (!qList.isEmpty()) {
				model.addAttribute("qList", qList);
				model.addAttribute("pi",pi);
			} else {
				model.addAttribute("qList", null);
			}
			return "qna/qnaList";
			
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
	//문의 키워드 검색 ( 회원 / 제목 )
	@RequestMapping(value="qnaSearch.ptsd")
	public String qnaSearchList(@ModelAttribute QnaSearch search, Model model) {
		try {
			List<Qna> qList = service.printSearchQna(search);
			if(!qList.isEmpty()) {
				model.addAttribute("qList", qList);
				model.addAttribute("search", search);
				model.addAttribute("page", 1);
				return "qna/qnaList";
			}else {
				model.addAttribute("msg","문의 아이디/검색 실패");
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
		return "qna/qnaWriteForm";
	}
	@RequestMapping(value="qnaRegister.ptsd", method=RequestMethod.POST)
	public void registerQna(ModelAndView mv,@ModelAttribute Qna qna
			,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.registerQna(qna);
			if (result > 0) {
				out.println("<script>alert('문의글이 게시되었습니다. 빠른 시일내에 답변드리겠습니다.\n 감사합니다.');location.href = 'qnaListView.ptsd';</script>");
			} else {
				out.println("<script>alert('문의글이 게시에 실패하였습니다. 다시 시도해주세요.');</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errerPage");
		}
		
	}
	//문의답변
	@RequestMapping(value="modifyAnswer.ptsd", method=RequestMethod.POST)
	public String modifyQna(Model model,@ModelAttribute Qna qna
			) {
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
	public void remove(ModelAndView mv,HttpServletRequest request
			,@RequestParam("qnaNo") int qnaNo
			,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.removeQna(qnaNo);
			if (result > 0) {
				out.println("<script>alert('문의글이 삭제되었습니다.');location.href = 'qnaListView.ptsd';</script>");
			} else {
				out.println("<script>alert('문의글 삭제 실패. 관리자에게 문의하세요.');location.href ='qnaListView.ptsd';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
	
}

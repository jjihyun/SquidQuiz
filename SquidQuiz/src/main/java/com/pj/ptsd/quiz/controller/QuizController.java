package com.pj.ptsd.quiz.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.campaign.Pagination;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizPagenation;
import com.pj.ptsd.quiz.service.QuizService;

@Controller
public class QuizController {
	
	@Autowired
	private QuizService service;
	
	//ox리스트
	@RequestMapping(value="oxList.ptsd",method=RequestMethod.GET)
	public ModelAndView oxListView(
			ModelAndView mv
			,@RequestParam(value="page",required = false)Integer page
			,HttpServletRequest request) {
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount();
		PageData pd = QuizPagenation.getPageData(currentPage, totalCount);
		HttpSession session = request.getSession();
		List<Ox> oxList = service.printAll(pd);
		if(!oxList.isEmpty()) {
			mv.addObject("oxList",oxList);
			mv.addObject("pd",pd);
			mv.setViewName("quiz/oxListView");
		}else {
			mv.addObject("msg","전체 조회 실패");
			mv.addObject("common/errorPage");
		}
		return mv;
	}
	
	//ox퀴즈 등록 폼으로 이동
	@RequestMapping(value="quizWriteView.ptsd",method=RequestMethod.GET)
	public String oxWriteView() {
		return "quiz/oxWriteForm";
	}
	//ox퀴즈 등록
	@RequestMapping(value="oxRegitser.ptsd",method = RequestMethod.POST)
	public String registerOx(
			@ModelAttribute Ox ox
			,@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile
			,HttpServletRequest request
			,Model model) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile,request);
			if(renameFileName != null) {
				ox.setOxFileName(uploadFile.getOriginalFilename());
				ox.setOxFileRename(renameFileName);
			}
		}
		
		int result = service.registerOxQuiz(ox);
		if(result > 0) {
			return "redirect:main.ptsd";
		}else {
			model.addAttribute("msg","ox퀴즈 등록 실패");
			return "common/errorPage";
		}
	}
	
	private String saveFile(
			MultipartFile uploadFile
			,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		//저장 폴더 선택
		String savePath = root+"\\oxuploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir(); //폴더 생성
		}
		//파일 저장
		String filePath = folder+"\\"+uploadFile.getOriginalFilename();
		try {
			uploadFile.transferTo(new File(filePath)); //파일 저장
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return filePath;
	}
}

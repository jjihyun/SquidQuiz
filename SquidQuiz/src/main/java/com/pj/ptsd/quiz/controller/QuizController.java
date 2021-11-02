package com.pj.ptsd.quiz.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.service.QuizService;

@Controller
public class QuizController {
	
	@Autowired
	private QuizService service;
	
	//퀴즈 등록 폼으로 이동
	@RequestMapping(value="quizWriteView.ptsd",method=RequestMethod.GET)
	public String oxWriteView() {
		return "quiz/oxWriteFomr";
	}
	//퀴즈 등록
	@RequestMapping(value="oxRegitser.ptsd",method = RequestMethod.POST)
	public String registerOx(
			@ModelAttribute Ox ox
			,@RequestParam(value="uploadfile",required=false) MultipartFile uploadFile
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
		return null;
	}
}

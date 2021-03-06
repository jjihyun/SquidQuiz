package com.pj.ptsd.quiz.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.campaign.Pagination;
import com.pj.ptsd.quiz.domain.MainGameInfo;
import com.pj.ptsd.quiz.domain.Ox;
import com.pj.ptsd.quiz.domain.PageData;
import com.pj.ptsd.quiz.domain.QuizPagenation;
import com.pj.ptsd.quiz.domain.QuizSearch;
import com.pj.ptsd.quiz.service.QuizService;
import com.pj.ptsd.user.domain.User;

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
	
	//ox퀴즈 상세 조회
	@RequestMapping(value="oxDetail.ptsd",method = RequestMethod.GET)
	public ModelAndView oxDetail(
			ModelAndView mv
			,@RequestParam("oxNo")int oxNo) {
		
		Ox ox=service.printOne(oxNo);
		if(ox!=null) {
			mv.addObject("ox",ox);
			mv.setViewName("quiz/oxDetail");
		}else {
			mv.addObject("msg","상세 조회 실패");
			mv.setViewName("common/errorPage");
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
			return "redirect:oxList.ptsd";
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
	@RequestMapping(value="oxModify.ptsd")
	public ModelAndView oxUpdateView(
			ModelAndView mv
			,@RequestParam("oxNo")int oxNo) {
		Ox ox = service.printOne(oxNo);
		if(ox !=null) {
			mv.addObject("ox",ox);
			mv.setViewName("quiz/oxUpdate");
		}else {
			mv.addObject("msg","상세 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="oxUpdate.ptsd",method=RequestMethod.POST)
	public ModelAndView oxUpdate(
			ModelAndView mv
			,HttpServletRequest request
			,@ModelAttribute Ox ox
			,@RequestParam(value="reloadFile",required = false)MultipartFile reloadFile){
		
		if(reloadFile !=null) {
			//기존 파일 삭제
			if(ox.getOxFileName()!="") {
				deleteFile(ox.getOxFileRename(),request);
			}
			String fileName = saveFile(reloadFile,request);
			if(fileName != null) {
				ox.setOxFileName(reloadFile.getOriginalFilename());
				ox.setOxFileRename(fileName);
			}
		}
		int result =service.modifyOxQuiz(ox);
		if(result >0) {
			mv.setViewName("redirect:oxList.ptsd");
		}else {
			mv.addObject("msg","수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	private void deleteFile(String oxFileRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root + "\\oxuploadFiles";
		File file = new File(fullPath+"\\"+oxFileRename);
		if(file.exists()) {
			file.delete();//파일 삭제
		}
	}
	
	//퀴즈 삭제
	@RequestMapping(value="oxDelete.ptsd",method=RequestMethod.GET)
	private String oxDelete(
			Model model
			,@RequestParam("oxNo")int oxNo
			,@RequestParam("oxFileName")String oxFileName
			,HttpServletRequest request) {
		int result =service.removeOxQuiz(oxNo);
		if(result > 0) {
			if(oxFileName != "") {
				deleteFile(oxFileName,request);
			}
			return "redirect:oxList.ptsd";
		}else {
			model.addAttribute("msg","삭제실패");
			return "common/errorPage";
		}
	}
	//퀴즈 검색
	@RequestMapping(value="quizSearch.ptsd",method=RequestMethod.GET)
	public String QuizSearchList(
			@ModelAttribute QuizSearch search
			,Model model) {
		List<Ox> oxSearchList = service.printSearchAll(search);
		if(!oxSearchList.isEmpty()) {
			model.addAttribute("oxList",oxSearchList);
			model.addAttribute("search",search);
			return"quiz/oxListView";
		}else {
			model.addAttribute("msg","검색 실패");
			return "common/errorPage";
		}
	}
	
//	---------------------------게임 servlet-----------------------------------
	
	//퀴즈 게임 모집
	@RequestMapping(value="quizProgressStart.ptsd",method = RequestMethod.POST)
	public ModelAndView quizGameStart(
			ModelAndView mv
			,HttpServletRequest request) {
		int result = service.registerGameStart();
		if(result > 0) {
			MainGameInfo mgi = service.printParticpant();
			mv.addObject("mgi",mgi);
			mv.setViewName("quiz/quizProgress");
		}else {
			mv.addObject("msg", "게임 시작 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//퀴즈 게임 시작
	@RequestMapping(value="quizProgreStarting.ptsd",method=RequestMethod.POST)
	public ModelAndView quizGameStart(
			ModelAndView mv
			,HttpServletRequest request
			,@RequestParam(value="quizGameStatusStart")String quizGameStatus) {
		int result = service.quizGameModifyStart(quizGameStatus);
		if(result > 0) {
			mv.setViewName("redirect:quizStart.ptsd");
		}else {
			mv.addObject("msg", "게임 시작 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//퀴즈 게임 종료
	@RequestMapping(value="quizProgressEnd.ptsd",method = RequestMethod.POST)
	public ModelAndView quizGameEnd(
			ModelAndView mv
			,HttpServletRequest request
			,@RequestParam(value="quizGameStatusEnd")String quizGameStatus) {
		int result = service.quizGameModifyEnd(quizGameStatus);
		if(result>0) {
			mv.setViewName("redirect:quizStart.ptsd");
		}else {
			mv.addObject("msg", "게임 종료 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping(value="quizStart.ptsd",method=RequestMethod.GET)
	public ModelAndView gameStartView(ModelAndView mv
			) {
		mv.setViewName("quiz/quizProgress");
		return mv;
	}
	
//	-------------------------게임 참가--------------------------------------------
	
	//메인화면으로 이동
	@RequestMapping(value="mainView.ptsd",method=RequestMethod.GET)
	public String mainView(
			ModelAndView mv) {
		return "main";
	}
	
	//참가자 등록/게임 머니 수정/유저 머니 수정/유저 머니 조회
	@RequestMapping(value="participant.ptsd",method=RequestMethod.POST)
	public ModelAndView registerParticipant(
			ModelAndView mv
			,HttpServletRequest request
			,@RequestParam(value="participant")String participantNo
			,@ModelAttribute MainGameInfo mgi) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		int point= service.selectUserPoint(user);
		if(point >= 10000) {
			System.out.println("참가신청완료");
			int pointUpdate = service.updateUserPoint(user);
			int moneyUpdate =service.updateMoney(mgi);
			int result = service.registerParticipant(participantNo);
			if(result > 0 && moneyUpdate > 0 && pointUpdate > 0) {
				session.setAttribute("loginUser", user);
				mv.setViewName("redirect:mainView.ptsd");
			}else {
				mv.addObject("msg", "게임 참가 실패").setViewName("common/errorPage");
			}
		}else {
			 mv.addObject("msg", "게임 참가 금액 부족").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//참가 취소
	@RequestMapping(value="participantRemove.ptsd",method=RequestMethod.POST)
	public ModelAndView removeParticipant(
			ModelAndView mv
			,HttpServletRequest request
			,@RequestParam(value="participant")String participantNo
			,@ModelAttribute MainGameInfo mgi) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
			int pointUpdate = service.updateUserPointMinus(user);
			int moneyUpdate = service.updateMoneyMinus(mgi);
			int result = service.removeParticipant(participantNo);
			if(result > 0 && moneyUpdate > 0 && pointUpdate > 0) {
				session.setAttribute("loginUser", user);
				mv.setViewName("redirect:mainView.ptsd");
			}else {
				mv.addObject("msg", "게임 참가 취소 실패").setViewName("common/errorPage");
			}
		return mv;
	}
	
	@RequestMapping(value="gameInfoSelect.ptsd",method=RequestMethod.GET)
	public ModelAndView gameInfoSelect(
			ModelAndView mv
			,@ModelAttribute Ox oxlist) {
		Ox ox = service.printGame(oxlist);
		if(ox!=null) {
			mv.addObject("ox",ox);
			mv.setViewName("main");
		}
		return mv;		
	}
	
	//ox퀴즈 상세 조회
	@RequestMapping(value="gameAnswerSelect.ptsd",method = RequestMethod.GET)
	public ModelAndView gameAnswerSelect(
			ModelAndView mv
			,@RequestParam("oxNo")int oxNo) {
		
		Ox ox = service.printAnswerO(oxNo);
		if(ox!=null) {
			mv.addObject("ox",ox);
			mv.setViewName("main");
		}else {
			mv.addObject("msg","상세 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//-----------------------역대 오징어------------------------------------------
	
	@RequestMapping(value="rankListView.ptsd",method=RequestMethod.GET)
	public ModelAndView rankListView(
			ModelAndView mv,@RequestParam(value="page",required = false)Integer page
			,HttpServletRequest request) {
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getMgiListCount();
		PageData pd = QuizPagenation.getPageData(currentPage, totalCount);
		HttpSession session = request.getSession();
		List<MainGameInfo> mgi = service.printMgiAll(pd);
		System.out.println(mgi);
		if(!mgi.isEmpty()) {
			mv.addObject("mgi",mgi);
			mv.addObject("pd",pd);
			mv.setViewName("rank/rankList");
		}else {
			mv.addObject("msg","오징어 조회 실패");
			mv.addObject("common/errorPage");
		}
		return mv;
	}
	//오징어 검색~
	@RequestMapping(value="mgiSearch.ptsd",method=RequestMethod.GET)
	public String mgiSearchList(
			
			@ModelAttribute QuizSearch search
			,Model model) {
		List<MainGameInfo> mgiSearchList = service.printMgiSearchAll(search);
		if(!mgiSearchList.isEmpty()) {
			model.addAttribute("mgi",mgiSearchList);
			model.addAttribute("search",search);
			return"rank/rankList";
		}else {
			model.addAttribute("msg","검색 실패");
			return "common/errorPage";
		}
	}
	
}

package com.pj.ptsd.user.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.PageInfo;
import com.pj.ptsd.user.domain.Pagination;
import com.pj.ptsd.user.domain.Search;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.user.service.UserService;



@Controller
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	JavaMailSender mailSender; //root-context에서 생성한 google mailsender 빈




	//로그인 페이지
	@RequestMapping(value = "/login.ptsd", method = RequestMethod.GET)
	public String MemberLogin() {
		return "user/userLogin";
	}

	// 로그인
	@RequestMapping(value="/login.ptsd", method=RequestMethod.POST)
	public void MemberLogin(HttpServletRequest request, @RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd
			, HttpServletResponse response) {
		User userOne = new User();
		userOne.setUserId(userId);
		userOne.setUserPwd(userPwd);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			User loginUser = service.loginMember(userOne);
			out = response.getWriter();
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				out.println("<script>location.href='/main.ptsd'</script>");
//				return "redirect:main.ptsd"; 
			}else {
				out.println("<script>alert('아이디 비밀번호를 확인해주세요.');location.href='/login.ptsd'</script>");
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
//			return "common/errorPage";
		}
	}

	// 로그아웃
	@RequestMapping(value="/logout.ptsd", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			return "redirect:main.ptsd";
		}else {
			request.setAttribute("msg", "로그아웃 실패!");
			return "common/errorPage";
		}
	}

	//회원가입 페이지
	@RequestMapping(value="/join.ptsd", method=RequestMethod.GET)
	public String userJoin() {
		return "user/userJoin";
	}

	//회원가입
	@RequestMapping(value="join.ptsd", method=RequestMethod.POST)
	public void memberRegister(HttpServletRequest request
			,HttpServletResponse response
			,@ModelAttribute User user
			,@RequestParam("post") String post
			,@RequestParam("address1") String address1
			,@RequestParam("address2") String address2) {
		user.setUserAddr(post+","+address1+","+address2);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			System.out.println(user.toString());
			int result = service.registerMember(user);
			out = response.getWriter();
			if(result > 0) {
				out.println("<script>alert('오징어퀴즈에 오신걸 환영합니다! 다시 로그인 해주세요');location.href='/main.ptsd'</script>");
			}else {
				request.setAttribute("msg", "회원가입 실패");
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
//			return "common/errorPage";
		}
	}


	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value ="checkDupId.ptsd", method=RequestMethod.GET)
	public String idDuplicateCheck(HttpServletRequest request, @RequestParam("userId") String userId) {
		int result = service.checkIdDup(userId);
		return String.valueOf(result);
	}

	//아이디 찾기 페이지 이동
	@RequestMapping(value = "/findIdView.ptsd", method = RequestMethod.GET)
	public String findId() {
		return "user/findIdForm";
	}

	//아이디 찾기실행
	@RequestMapping(value="/findId.ptsd", method=RequestMethod.POST)
	public void findId(HttpServletRequest request
			, @RequestParam("userName") String userName
			, @RequestParam("userEmail") String userEmail
			, Model model
			, HttpServletResponse response) {
		User userOne = new User();
		userOne.setUserName(userName);
		userOne.setUserEmail(userEmail);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			String foundOne = service.findId(userOne);
			out = response.getWriter();
			if(foundOne != null) {
				out.println("<script>alert('회원 아이디는"+foundOne+"입니다!');location.href='/login.ptsd'</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		//		   return "user/findIdForm";
	}



	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/findPwdView.ptsd", method = RequestMethod.GET)
	public String findPwd() {
		return "user/findPwdForm";
	}


	//비밀번호 메일로 전송
	@RequestMapping(value="/findPwd.ptsd", method=RequestMethod.POST)
	public void findPwd(HttpServletRequest request
			, @RequestParam("userId") String userId
			, @RequestParam("userEmail") String userEmail
			, HttpServletResponse response
			, Model model) {
		User userOne = new User();
		userOne.setUserId(userId);
		userOne.setUserEmail(userEmail);
		String userPwd = service.findPwd(userOne);
		//			String setfrom = "";
		//			String title = request.getParameter("title"); // 제목
		//			String content = request.getParameter("content"); // 내용
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(msg,
					true, "UTF-8");

			messageHelper.setFrom(userId); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(userEmail); // 받는사람 이메일
			//				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			//				messageHelper.setText(content); // 메일 내용

			messageHelper.setSubject(userId+"님 비밀번호 찾기 메일입니다.");
			messageHelper.setText("비밀번호는" +userPwd+ "입니다.");
			messageHelper.setTo(userEmail);
			msg.addRecipient(MimeMessage.RecipientType.TO , new InternetAddress(userEmail));
			mailSender.send(msg);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 메일로 발송했습니다!');location.href='/login.ptsd'</script>");
			out.flush();

		} catch (Exception e) {
			System.out.println(e);
		}

	}



	//마이페이지 회원정보 화면
	@RequestMapping(value="mypageUser.ptsd", method=RequestMethod.GET)
	public String userList( Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		String uId = u.getUserId();
		User uList = service.printOne(uId);
//		System.out.println(uList.toString());
		if(uList!=null) {
			model.addAttribute("uList",uList);
		
			return "mypage/mypageUser";
		}else {
			model.addAttribute("msg", "에러다에러");
			return "common/errorPage";
			
		}
		
	}
	
//		, @RequestParam("userEmail") String userEmail
//		, @RequestParam("userPhone") String userPhone
//		, HttpServletRequest request) {
//	HttpSession session = request.getSession();
//	User userId = new User();
//	userId.setUserEmail(userEmail);
//	userId.setUserPhone(userPhone);
//	User epList = service.printEPList(userId);
//	
//	if(epList!=null) {
//		model.addAttribute("epList",epList);
//	// 여기에서  DB다녀온 값을 뿌려줘야합니다.. ㅎ
//	// selectOne하는 메소드가 있을거 같은데 
//	}

	//마이페이지 회원정보 수정
	@RequestMapping(value ="memberModify.ptsd", method = RequestMethod.POST)
	public void modifyMember(@ModelAttribute User user
//			, @RequestParam("bankAccountValue") String accountValue  //계좌번호 string으로 변경
			, @RequestParam("post") String post
			, @RequestParam("address1") String address1
			, @RequestParam("address2") String address2
			, Model model
			, HttpServletRequest request
			, HttpServletResponse response) {
		HttpSession session = request.getSession();
//		user.setBankAccount(Integer.parseInt(accountValue)); //계좌번호 string으로 변경
		user.setUserAddr(post+","+address1+","+address2);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			int result = service.modifyMember(user);
			if(result > 0) {
				session.setAttribute("loginUser", user);
				out = response.getWriter();
				out.println("<script>alert('회원정보 수정이 완료되었습니다!');location.href='mypageUser.ptsd'</script>");
			}else {
				model.addAttribute("msg", "회원 정보 수정 실패!");
			}
		} catch (IOException e) {
			model.addAttribute("msg", "회원 정보 수정 실패!");
		}
	}

	//회원탈퇴 페이지 
	@RequestMapping(value="userDelete.ptsd", method=RequestMethod.GET)
	public String userCheck(Model model) {
		return "mypage/mypageUserDelete";
	}



	//회원탈퇴 비번확인 실행
	@RequestMapping(value="userDelete.ptsd", method=RequestMethod.POST)
	public String memberDelete(@ModelAttribute User user, Model model
			, HttpServletRequest request
			, @RequestParam("userId") String userId
			, @RequestParam ("userPwd") String userPwd
			, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User userOne = new User();
		userOne.setUserId(userId);
		userOne.setUserPwd(userPwd);
		int result = service.removeMember(user);
		try {
			if(result > 0) {
				session.invalidate();
				return "redirect:main.ptsd";
			}else {
				model.addAttribute("msg","회원탈퇴실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}





	//my홈 페이지 + 내가 쓴 자유게시판 조회
	@RequestMapping(value="mypageMyHome.ptsd", method=RequestMethod.GET)
	public String selectHomeList(HttpServletRequest request
			, Model model
			, @RequestParam(value="page",required=false)Integer page) {
		HttpSession session = request.getSession();
		User userOne = (User)session.getAttribute("loginUser");
		int currentPage = (page!=null) ? page : 1;
		String userId = userOne.getUserId();
		int totalBCount = service.getBCount(userId);
		PageInfo bPi = Pagination.getPageInfo(currentPage, totalBCount);
		List<Board> bList = service.printBoardList(bPi, userId);
		int pPoint = service.printMyCPoint(userId);
		model.addAttribute("bList", bList);
		model.addAttribute("bPi", bPi);
		model.addAttribute("userPoint",userOne.getPoint());
		model.addAttribute("pPoint",pPoint);
		
		return "mypage/mypageMyHome";
		
		}
	

	
	
	
	
	//마이페이지->자유게시판 상세
	@RequestMapping(value="boatdDetail.ptsd", method=RequestMethod.GET)
	public String boardDetail(Model model
			, @RequestParam("bNo") int bNo
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		Board board = service.printbOne(bNo);
		return "board/boardDetail";
	}

		

	//활동내역 페이지 이동
//	@RequestMapping(value="mypageDetailView.ptsd", method=RequestMethod.GET)
//	public String selectDetailList(Model model) {
//		return "mypage/mypageDetail";
//	}
	
	//캠페인 내역 조회
	@RequestMapping(value="mypageDetail.ptsd", method=RequestMethod.GET)
	public String selectCRList( Model model
			, HttpServletRequest request
			, @RequestParam(value="page",required=false)Integer page) {
		HttpSession session = request.getSession();
		User userOne = (User)session.getAttribute("loginUser");
		int currentPage = (page!=null) ? page : 1;
		String userId = userOne.getUserId();
		int totalCCount = service.getCCount(userId);
		int cCount = service.getCListCount(userId);
		int qCount = service.getQCount(userId);
		int totalQCount = service.getQCount(userId);
		int pPoint = service.printMyCPoint(userId);
		int quizPoint = service.getGCount(userId);
		PageInfo cPi = Pagination.getPageInfo(currentPage, cCount);
		PageInfo qPi = Pagination.getPageInfo(currentPage, qCount);
		List<CampaignRecord> cList = service.printCRList(cPi, userId);
		List<Participant> qList = service.printQList(qPi, userId);
		model.addAttribute("cList", cList);
		model.addAttribute("qList", qList);
		model.addAttribute("cPi", cPi);
		model.addAttribute("qPi", qPi);
		model.addAttribute("pPoint",pPoint);
		model.addAttribute("totalCCount", totalCCount);
		model.addAttribute("cCount", cCount);
		model.addAttribute("qCount", qCount);
		model.addAttribute("quizPoint",quizPoint);
		model.addAttribute("userPoint",userOne.getPoint());
		model.addAttribute("searchYn", "N");
		return "mypage/mypageDetail";
	}
	
	//캠페인내역 검색기능
	@RequestMapping(value="searchCampaign.ptsd", method=RequestMethod.GET)
	public String campaignSearchList(
			@ModelAttribute Search search
			, @RequestParam(value="page",required=false)Integer page
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userOne = (User)session.getAttribute("loginUser");
		int currentPage = (page!=null) ? page : 1;
		String userId = userOne.getUserId();
		int totalCCount = service.getCCount(userId);
		int cCount = service.getCListCount(userId);//
		int pPoint = service.printMyCPoint(userId);
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("userId",userId);
		map.put("search",search);
		int searchCount = service.getSearchCount(map);
		PageInfo cPi = Pagination.getPageInfo(currentPage, searchCount);
		List<CampaignRecord> cList = service.printSearchAll(cPi, map);
		if(!cList.isEmpty()) {
			model.addAttribute("cList", cList);
			model.addAttribute("cPi", cPi);
			model.addAttribute("pPoint",pPoint);
			model.addAttribute("cCount", cCount);
			model.addAttribute("totalCCount", totalCCount);
			model.addAttribute("searchCount", searchCount);
			model.addAttribute("search", search);
			model.addAttribute("userPoint",userOne.getPoint());
			model.addAttribute("searchYn", "Y");
			return "mypage/mypageDetail";
		}else {
			model.addAttribute("msg", "게시물 조회 실패");
			return "common/errorPage";
		}
	}
	
	
	//퀴즈내역 조회
//	@RequestMapping(value="mypageDetail.ptsd", method=RequestMethod.GET)
//	public String selectQuizList(Model model
//			, HttpServletRequest request
//			, @RequestParam(value="page",required=false)Integer page) {
//		HttpSession session = request.getSession();
//		User userOne = (User)session.getAttribute("loginUser");
//		int currentPage = (page!=null) ? page : 1;
//		String userId = userOne.getUserId();
//		int totalQCount = service.getQCount(userId);
//		PageInfo qPi = Pagination.getPageInfo(currentPage, totalQCount);
//		List<Participant> qList = service.printQList(qPi, userId);
//		model.addAttribute("qList", qList);
//		model.addAttribute("qPi", qPi);
//		return "mypage/mypageDetail";
//	}
	


	



}




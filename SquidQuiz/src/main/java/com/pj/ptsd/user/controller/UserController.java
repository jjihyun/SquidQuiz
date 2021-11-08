package com.pj.ptsd.user.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.user.service.UserService;



@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	//로그인 페이지
	@RequestMapping(value = "/login.ptsd", method = RequestMethod.GET)
    public String MemberLogin() {
        return "user/userLogin";
    }
	
	// 로그인
	@RequestMapping(value="/login.ptsd", method=RequestMethod.POST)
	public String MemberLogin(HttpServletRequest request, @RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd) {
		User userOne = new User();
		userOne.setUserId(userId);
		userOne.setUserPwd(userPwd);
		try {
			User loginUser = service.loginMember(userOne);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
			}
			return "user/userLogin"; 
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
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
	@RequestMapping(value="memberRegister.ptsd", method=RequestMethod.POST)
	public String memberRegister(HttpServletRequest request
			,@ModelAttribute User user
			,@RequestParam("userId") String userid
			,@RequestParam("userPwd") String userPwd
			,@RequestParam("userName") String userName
			,@RequestParam("userEmail") String userEmail
			,@RequestParam("userPhone") String userPhone
			,@RequestParam("post") String post
			,@RequestParam("address1") String address1
			,@RequestParam("address2") String address2
			,@RequestParam("bankName") String bankName
			,@RequestParam("bankAccount") int bankAccount) {
		user.setUserAddr(post+","+address1+","+address2);
		try {
			int result = service.registerMember(user);
			if(result > 0) {
				return "redirect:main.ptsd";
			}else {
				request.setAttribute("msg", "회원가입 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	
	  //아이디 중복확인
	   @ResponseBody
	   @RequestMapping(value ="checkDupId.ptsd", method=RequestMethod.GET)
	   public String idDuplicateCheck(HttpServletRequest request, @RequestParam("userId") String userId) {
		   int result = service.checkIdDup(userId);
		   return String.valueOf(result);
	   }

	




}
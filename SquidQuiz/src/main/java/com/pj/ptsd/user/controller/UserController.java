package com.pj.ptsd.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.user.service.UserService;



@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	
	// 회원 등록
	@RequestMapping(value="enrollView.ptsd", method=RequestMethod.GET)
	public String enrollView() {
		return "user/userJoin";
	}
	

	@RequestMapping(value="join.ptsd", method=RequestMethod.POST)
	public String userRegister(HttpServletRequest request) {
			

		try {
			int result = service.registerUser(user);
			if(result > 0) {
				return "redirect:home.ptsd";
			}else {
				request.setAttribute("msg", "회원가입 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}



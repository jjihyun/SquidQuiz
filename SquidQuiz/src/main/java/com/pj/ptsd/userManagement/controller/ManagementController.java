package com.pj.ptsd.userManagement.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.common.PageInfo;
import com.pj.ptsd.common.Search;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.userManagement.domain.Pagination;
import com.pj.ptsd.userManagement.service.ManagementService;

@Controller
public class ManagementController {
	@Autowired
	private ManagementService service;
	
	//회원 리스트
	@RequestMapping(value="userListView.ptsd")
	public String printUserList(Model model
			,@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page != null) ? page : 1; 
		Search search = null;
		int totalCount = service.getUserCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<User> uList = service.printUserList(pi);
		if (!uList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("uList", uList);
			return "userManagement/userListView";
		} else {
			model.addAttribute("pi", pi);
			model.addAttribute("uList", null);
			return "userManagement/userListView";
		}
		
	}
	//회원 search
	@RequestMapping(value="userSearchListView.ptsd")
	public String printUserSearchList(Model model
			,@ModelAttribute Search search
			,@RequestParam(value="page",required=false)Integer page) {
		try {
			int currentPage = (page != null) ? page : 1; 
			int totalCount = service.getUserCount(search);
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			List<User> uList = service.printSearchUserList(pi, search);
			if (!uList.isEmpty()) {
				model.addAttribute("pi", pi);
				model.addAttribute("uList", uList);
				model.addAttribute("search", search);
				return "userManagement/userListView";
			} else {
				model.addAttribute("pi", pi);
				model.addAttribute("uList", null);
				model.addAttribute("search", search);
				return "userManagement/userListView";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
		
	}
	//회원 탈퇴
	@RequestMapping(value="userRemove.ptsd")
	public void removeUser(
			ModelAndView mv
			,@RequestParam("userNo") int userNo
			,HttpServletResponse response) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			int result = service.removeUser(userNo);
			if (result>0) {
				out.println("<script>alert('해당 회원 정보 삭제 완료.');location.href = document.referrer;</script>");
			} else {
				out.println("<script>alert('해당 회원 정보 삭제 실패.');location.href = document.referrer;</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
}

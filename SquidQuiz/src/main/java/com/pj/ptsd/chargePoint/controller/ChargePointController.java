package com.pj.ptsd.chargePoint.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.service.ChargePointService;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.chargePoint.domain.PageInfo;
import com.pj.ptsd.chargePoint.domain.Pagination;

@Controller
public class ChargePointController {
	
	@Autowired
	private ChargePointService service;
	
	//포인트 페이지 이동
	@RequestMapping(value="mypagePoint.ptsd", method=RequestMethod.GET)
	public String selectPointList(Model model
			,@RequestParam(value="page",required=false)Integer page
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userOne = (User)session.getAttribute("loginUser");
		int currentPage = (page!=null) ? page : 1; 
		int userNo = userOne.getUserNo();
		String userId = userOne.getUserId();
		int totalEcount = service.getAllEListCount(userId);
		int totalCount = service.getAllCListCount(userNo);
		PageInfo ePi = Pagination.getPageInfo(currentPage, totalEcount);
		PageInfo cPi = Pagination.getPageInfo(currentPage, totalCount);
		List<Exchange> eList = service.printExchangeList(ePi, userId);
		List<ChargePoint> cList = service.printChargeList(cPi, userNo);
		model.addAttribute("cList", cList);
		model.addAttribute("eList", eList);
		model.addAttribute("cPi",cPi);
		model.addAttribute("ePi",ePi);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("totalEcount",totalEcount);
		model.addAttribute("point",userOne.getPoint());
		return "mypage/mypagePoint";
	}
	
	//결제해서 포인트 충전됨
	@RequestMapping(value="payPoint.ptsd", method=RequestMethod.POST)
	public String selectPointList(Model model
			, @RequestParam(value="point") int point
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User userOne = (User)session.getAttribute("loginUser");
		String userId = userOne.getUserId();
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("userId",userId);
		map.put("userNo",userOne.getUserNo());
		map.put("point",point);
		int result = service.addPayPoint(map);
//		String referer = request.getHeader("Referer");
		if(result >0) {
			userOne=service.printOne(userId);
			session.setAttribute("loginUser", userOne);
			return "redirect:mypagePoint.ptsd";
		}else {
			model.addAttribute("msg","충전실패");
			return "common/errorPage";
		}
	}
	
	
	

//	  환전내역 리스트
	
	@RequestMapping(value="exchangeList.ptsd", method=RequestMethod.GET)
	public String exchangeListView (Model model
			,@RequestParam(value="page",required=false)Integer page 
			,HttpServletRequest request) { 
		HttpSession session = request.getSession(); 
		User userOne = (User)session.getAttribute("loginUser");
		int currentPage = (page!=null) ? page : 1; 
		String userId = userOne.getUserId();
		int totalCount = 0;
		int totalEcount = service.getAllEListCount(userId);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		PageInfo ePi = Pagination.getPageInfo(currentPage, totalEcount);
		List<Exchange> eList = service.printExchangeList(ePi, userId);
			model.addAttribute("eList", eList); 
			model.addAttribute("ePi", ePi);
			model.addAttribute("userPoint",userOne.getPoint());
			return "mypage/mypagePoint";
	}

	
	
	
	//충전 포인트 내역 리스트 
//	@RequestMapping(value="/chargePointView.ptsd", method=RequestMethod.GET)
//	public ModelAndView chargeListView ( ModelAndView mv
//			,@RequestParam(value="page",required=false)Integer page
//			,HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		User userOne = (User)session.getAttribute("loginUser");
//		int userNo = userOne.getUserNo();
//		int currentPage = (page!=null) ? page : 1;
//		int totalCount = service.getAllCListCount();
//		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
//		List<ChargePoint> cList = service.printChargeList(pi, userNo);
//		if(!cList.isEmpty()) {
//			mv.addObject("cList", cList);
//			mv.addObject("pi", pi);
//			mv.setViewName("mypage/mypagePoint");
//		}else {
//			mv.addObject("cList", null);
//			mv.setViewName("mypage/mypagePoint");
//		}
//
//		return mv;
//	}

	

	
	//포인트 충전 페이지 이동
	@RequestMapping(value="/chargePoint.ptsd", method=RequestMethod.GET)
	public String chargePoint(Model model) {
		return "mypage/chargePoint";
	}

}

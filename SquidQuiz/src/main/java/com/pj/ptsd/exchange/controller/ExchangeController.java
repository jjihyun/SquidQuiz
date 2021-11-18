package com.pj.ptsd.exchange.controller;

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

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.domain.ExchangePagination;
import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.exchange.service.ExchangeService;
import com.pj.ptsd.qna.domain.PageInfo;
import com.pj.ptsd.user.domain.User;

@Controller
public class ExchangeController {

	@Autowired
	private ExchangeService service;
	
	@RequestMapping(value="testView.ptsd")
	public String exchangeListView (Model model) {
		return "report/tabtest1";
	}
	//전체조회 (관리자)
	@RequestMapping(value="exchangeListView.ptsd")
	public String exchangeListView (Model model
			,@RequestParam(value="page",required=false)Integer page) {
			
		try {
			int currentPage = (page!=null) ? page : 1;
			int totalCount = 0;
			totalCount = service.getAllListCount();
			PageInfo pi = ExchangePagination.getPageInfo(currentPage, totalCount);
			List<Exchange> eList = service.printAllExchange(pi);
			if(!eList.isEmpty()) {
				model.addAttribute("eList", eList);
				model.addAttribute("pi",pi);
				return "exchange/exchangeListView";
			}else {
				model.addAttribute("eList", null);
				return "exchange/exchangeListView";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	//userId 기준  list 조회 (회원)
	@RequestMapping(value="exchangeOwnListView.ptsd")
	public String exchangeOwnListView ( Model model
			,@RequestParam(value="page",required=false)Integer page
			,HttpServletRequest request) {
			
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("loginUser");
			String userId = user.getUserId();
			int currentPage = (page!=null) ? page : 1;
			int totalCount = 0;
			totalCount = service.getOwnListCount(userId);
			PageInfo pi = ExchangePagination.getPageInfo(currentPage, totalCount);
			List<Exchange> eList = service.printOwnExchange(pi, userId);
			String tabStatus = "exchange";
			
			if(!eList.isEmpty()) {
				model.addAttribute("eList", eList);
				model.addAttribute("pi",pi);
				model.addAttribute("tabStatus", tabStatus);
//				session.setAttribute("tabStatus", tabStatus);
				return "exchange/userExchangeListView";
			}else {
				model.addAttribute("eList", null);
			}
			return "exchange/userExchangeListView";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	//Search By Id
	@RequestMapping(value="exchangeSearchListView.ptsd")
	public String exchangeSearch(Model model,
			@ModelAttribute Search search){
		try {
			List<Exchange> eList = service.printSearchExchange(search);
			if(!eList.isEmpty()) {
				model.addAttribute("eList", eList);
				model.addAttribute("search", search);
				model.addAttribute("page", 1);
				
			}else {
				model.addAttribute("eList", null);
				model.addAttribute("search", search);
			}
			return "exchange/exchangeListView";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
		
	}
	//환전 신청(등록 )-회원
	@RequestMapping(value="exchangeRegister.ptsd",method=RequestMethod.POST)
	public void exchangeRegister(ModelAndView mv
			,@ModelAttribute Exchange exchange
			,HttpServletResponse response
			,HttpServletRequest request) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			int afterExchangePoint = user.getPoint() - exchange.getExchangeMoney();
			user.setPoint(afterExchangePoint);
			int result = service.registerExchange(exchange);
			if (result>0) {
				session.setAttribute("loginUser", user);
				out.println("<script>alert('환전 신청이 완료되었습니다. 빠른 시일내에 처리해드리겠습니다. 감사합니다.');location.href = 'mypagePoint.ptsd';</script>");
			} else {
				out.println("<script>alert('환전 신청이 실패하였습니다. 다시 시도해주세요.(반복될 경우 관리자에게 문의해주세요.)');window.location=document.referrer;</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
	//환전 처리 ( 수정 , 관리자)
	@RequestMapping(value="exchangeHandling.ptsd")
	public void exchangeModify(ModelAndView mv,
			@RequestParam("exchangeNo") int exchangeNo
			,HttpServletResponse response
			) {
		try {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			
			//환전내역 수정처리
			int result = service.modifyExchangeStatus(exchangeNo);
			if (result > 0) {
				out.println("<script>alert('환전 완료 처리되었습니다.');window.location=document.referrer;</script>");
			} else {
				out.println("<script>alert('환전 완료 처리에 실패하였습니다.');window.location=document.referrer;</script>");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
	}
	
}

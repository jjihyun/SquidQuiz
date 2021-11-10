package com.pj.ptsd.exchange.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.domain.ExchangePagination;
import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.exchange.service.ExchangeService;
import com.pj.ptsd.qna.domain.PageInfo;

@Controller
public class ExchangeController {

	@Autowired
	private ExchangeService service;
	
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
			}else {
				model.addAttribute("eList", null);
			}
			return "exchange/exchangeListView";
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
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			int currentPage = (page!=null) ? page : 1;
			int totalCount = 0;
			totalCount = service.getOwnListCount(userNo);
			PageInfo pi = ExchangePagination.getPageInfo(currentPage, totalCount);
			List<Exchange> eList = service.printOwnExchange(pi, userNo);
			if(!eList.isEmpty()) {
				model.addAttribute("eList", eList);
			}else {
				model.addAttribute("eList", null);
			}
			return "exchange/exchangeList";
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
				return "exchange/exchangeList";
			}else {
				model.addAttribute("msg","환전 목록 아이디/검색 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
		
	}
	//환전 신청 입력 페이지로
	@RequestMapping(value="showRegisterView.ptsd")
	public String showRegisterView(Model model) {
		
		return "";
	}
	//환전 신청(등록 , 회원)
	@RequestMapping(value="exchangeRegister.ptsd",method=RequestMethod.POST)
	public String exchangeRegister(Model model,@ModelAttribute Exchange exchange) {
		try {
			int result = service.registerExchange(exchange);
			if (result>0) {
				
			} else {
				
			}
			return "";
		} catch (Exception e) {
			model.addAttribute("msg", "환전 신청 실패!");
			return "common/errorPage";
		}
	}
	//환전 처리 ( 수정 , 관리자)
	@RequestMapping(value="exchangeHandling.ptsd")
	public String exchangeModify(Model model,
			@RequestParam("exchangeNo") int exchangeNo) {
		try {
			int result = service.modifyExchangeStatus();
			if (result > 0) {
				//회원 포인트 차감하는 메소드... 필요함
				
				
				return "exchangeListView.ptsd";
			} else {
				model.addAttribute("msg", "환전 처리 상태 변경 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
}

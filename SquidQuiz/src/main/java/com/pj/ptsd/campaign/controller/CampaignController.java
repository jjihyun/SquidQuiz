package com.pj.ptsd.campaign.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.service.CampaignService;

@Controller
public class CampaignController {

	@Autowired
	private CampaignService service;
	
	//캠페인 목록 조회
	@RequestMapping(value="campaignList.ptsd", method=RequestMethod.GET)
	public String showCampaignList(Model model) {
		try {
			List<Campaign> cList = service.printAll();
			if(!cList.isEmpty()) {
				model.addAttribute("cList", cList);
				return "campaign/campaignList";
			} else {
				model.addAttribute("msg", "캠페인 조회 실패");
				return "common/errorPage";
			}			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/erorrPage";
		}

	}
	
	//캠페인 상세페이지 조회
	@RequestMapping(value="campaignDetail.ptsd", method=RequestMethod.GET)
	public ModelAndView showCampaignDetail(ModelAndView mv
			, @RequestParam("campaignNo") int campaignNo, Model model) {
		Campaign camp = service.printCampaignDetail(campaignNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(camp!=null) {
			mv.addObject("campaign", camp);
			String formatDate = sdf.format(camp.getCampaignEndDate());
			double campMount = (double)camp.getCampaignNowAmount()/(double)camp.getCampaignTargetAmount()*100;
			mv.addObject("detail", campMount);
			mv.addObject("formatDate", formatDate);
			mv.setViewName("campaign/campaignDetail");
		} else {
			mv.addObject("msg", "캠페인 디테일 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
		
}

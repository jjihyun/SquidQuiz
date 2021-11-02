package com.pj.ptsd.campaign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.service.CampaignService;

@Controller
public class CampaignController {

	@Autowired
	private CampaignService service;
	
	//캠페인 목록 조회
	@RequestMapping(value="campaignList.pstd", method=RequestMethod.GET)
	public String showCampaignList(Model model) {
		try {
			List<Campaign> cList = service.printAll();
			if(!cList.isEmpty()) {
				model.addAttribute("cList", cList);
				return "campaign/campaignList";
			} else {
				System.out.println("에러");
//				model.addAttribute("msg", "캠페인 조회 실패");
//				return "common/errorPage";
				return "";
			}			
		} catch(Exception e) {
			System.out.println("에러");
//			e.printStackTrace();
//			model.addAttribute("msg", e.toString());
//			return "common/erorrPage";
			return "";
		}

	}
	
//	@RequestMapping(value="campaignList.ptsd", method=RequestMethod.GET)
//	public String campaignListView() {
//		return "campaign/campaignList";
//	}
		
}

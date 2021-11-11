package com.pj.ptsd.campaign.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.pj.ptsd.campaign.Pagination;
import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.campaign.service.CampaignService;

@Controller
public class CampaignController {

	@Autowired
	private CampaignService service;
	
	//캠페인 목록 조회
	@RequestMapping(value="campaignList.ptsd", method=RequestMethod.GET)
	public String printCampaignList(Model model
			, HttpServletRequest request, @RequestParam(value="page", required=false) Integer page) {
		try {
			request.setCharacterEncoding("utf-8");
			String type=request.getParameter("campaignType");
			if(type==null) {
				type="all";
			}
			System.out.println("캠페인 타입 " + type);
			
			int currentPage =(page!=null)?page:1;
			int totalCount = service.getListCount();
			System.out.println("총 개수 : "+totalCount);
			//System.out.println("현재 페이지 : "+currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			System.out.println("시작 페이지"+pi.getStartNavi());
			System.out.println("끝 페이지"+pi.getEndNavi());
			//System.out.println("캠페인 개수 : "+totalCount);
			pi.setType(type);

			//메인게임테이블에 값이 있는지 체크. null값 방지 위해서.
			int dRecord = service.printAllDonationRecord();
			if(dRecord>0) {
				//고정 기부처의 누적 기부금액, 이번회차의 기부금액
				int dSumPrice = service.printDonationRecord();
				model.addAttribute("dSumPrice", dSumPrice);
				int dPrice = service.printOneDonationRecord();
				model.addAttribute("dPrice", dPrice);
			} else {
				int dSumPrice = 0;
				int dPrice = 0;
				model.addAttribute("dSumPrice", dSumPrice);
				model.addAttribute("dPrice", dPrice);
			}
			
			List<Campaign> cList = service.printAll(pi);
			if(!cList.isEmpty()) {
				model.addAttribute("cList", cList);
				model.addAttribute("pi", pi);
				model.addAttribute("campaignType",type);
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
	@ResponseBody
	@RequestMapping(value="campaignListJSON.ptsd", method=RequestMethod.GET)
	public void campaignListJSON(HttpServletRequest request, HttpServletResponse response
			, @RequestParam("campaignType") String type
			, @RequestParam(value="page", required=false) Integer page) throws Exception{
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("application/json");
//		JsonObject obj = new JsonObject();
		int currentPage =(page!=null)?page:1;
		int totalCount = service.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		pi.setType(type);
		System.out.println("타입 : "+type);
		System.out.println("총 개수  : "+totalCount);
		List<Campaign> cList = service.printAll(pi);
		//List<Campaign> cList = service.printAllType(pi2,type);
		System.out.println(cList);
		Gson gson = new Gson();
		gson.toJson(cList, response.getWriter());
		//gson.toJson(pi, response.getWriter());
	}
	
	
	//캠페인 고정기부처 상세조회
	@RequestMapping(value="campaignStaticDetail.ptsd", method=RequestMethod.GET)
	public String printStaticOneCampaign(Model model) {
		int result = 0;
		return "campaign/campaignStaticDetail";
	}
	
	//캠페인 상세페이지 조회
	@RequestMapping(value="campaignDetail.ptsd", method=RequestMethod.GET)
	public ModelAndView printCampaignDetail(ModelAndView mv
			, @RequestParam("campaignNo") int campaignNo, Model model) {
		Campaign camp = service.printCampaignDetail(campaignNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(camp!=null) {
			mv.addObject("campaign", camp);
			String formatDate = sdf.format(camp.getcEndDate());
			
			Date startDate = new Date();
			Date endDate = camp.getcEndDate();
			System.out.println("끝나는 날짜 : "+endDate);
			System.out.println("시작 날짜 : "+startDate);
			int gap = (int) (endDate.getTime()-startDate.getTime());
			int result = (int) Math.ceil(gap/(1000*60*60*24));
			if(result>=1) {
				result+=1;
			}
			System.out.println("차이" + result);
			
			//현재 모금 상황 퍼센트 계산
			double campMount = (double)camp.getcNowAmount()/(double)camp.getcTargetAmount()*100;
			mv.addObject("detail", campMount);
			mv.addObject("formatDate", formatDate);
			mv.addObject("dDay", result);
			mv.setViewName("campaign/campaignDetail");
		} else {
			mv.addObject("msg", "캠페인 디테일 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//캠페인 기부 결제페이지
	@RequestMapping(value="donationPay.ptsd", method=RequestMethod.GET)
	public String showDonationPay(@RequestParam("campaignNo") int campaignNo, Model model ) {
		//Campaign camp = service.printCampaignDetail(campaignNo);
//		if(camp!=null) {
//			model.addAttribute("campaign", camp);
//			return "campaign/campaignDonation";
//		} else {
//			model.addAttribute("msg", "캠페인 수정 페이지 조회 실패!");
//			return "common/errorPage";
//		}
		return "campaign/campaignDonationPay";
	}
	
	//캠페인 작성 페이지
	@RequestMapping(value="campaignWriteView.ptsd", method=RequestMethod.GET)
	public String registerCampaign() {
		return "campaign/campaignWrite";
	}
	//캠페인 작성(insert)
	@RequestMapping(value="campaignInsert.ptsd", method=RequestMethod.POST)
	public String registerCampaign(@ModelAttribute Campaign campaign
			, @RequestParam(value="cFileName_2", required=false) MultipartFile upload
			, @RequestParam("cEndDate2") String cEndDate, @RequestParam("campaignOption") String option
			, HttpServletRequest request, Model model) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(!upload.getOriginalFilename().equals("")) { //파일이 존재할경우
			String rename= saveFile(upload, request);
			if(rename!=null) {
				campaign.setcFileName(upload.getOriginalFilename());  //원본 파일
				campaign.setcFileRename(rename);  //새로운 파일
			}
		}
		
		campaign.setCampaignType(option);
		
		Date formatDate = sdf.parse(cEndDate);
		campaign.setcEndDate(formatDate);
		
		int result = service.registerCampaign(campaign);
		if(result>0) {
			return "redirect:campaignList.ptsd";
		} else {
			model.addAttribute("msg", "등록 실패");
			return "common/errorPage";
		}
	}
	public String saveFile(MultipartFile upload, HttpServletRequest request) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\campaignUpload";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder+"\\"+upload.getOriginalFilename(); //파일이름으로 저장하려고 함
		try {
			upload.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filePath;
	}
	
	//캠페인 수정 페이지
	@RequestMapping(value="campaignModify.ptsd", method=RequestMethod.GET)
	public String modifyCampaign(@RequestParam("campaignNo") int cNo, Model model) {
		Campaign camp = service.printCampaignDetail(cNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(camp!=null) {
			model.addAttribute("formatDate", sdf.format(camp.getcEndDate()));
			model.addAttribute("campaign", camp);
			return "campaign/campaignUpdate";
		} else {
			model.addAttribute("msg", "캠페인 수정 페이지 조회 실패!");
			return "common/errorPage";
		}
	}
	//캠페인 수정
	@RequestMapping(value="campaignUpdate.ptsd", method=RequestMethod.POST)
	public ModelAndView modifyCampaign(ModelAndView mv, HttpServletRequest request
			, @RequestParam(value="updateFile", required=false) MultipartFile updateFile
			, @ModelAttribute Campaign campaign, @RequestParam("campaignOption") String option) {
		if(updateFile!=null) { //업데이트할 파일이 있을 경우
			//기존 파일 삭제
			if(campaign.getcFileName()!="") {
				removeFile(campaign.getcFileName(), request);
			}
			//새 파일 업로드
			String fileRename = saveFile(updateFile, request);
			if(fileRename!=null) {
				campaign.setcFileName(updateFile.getOriginalFilename());
				campaign.setcFileRename(fileRename);
			}
		}

		campaign.setCampaignType(option);
		int result = service.modifyCampaign(campaign);
		if(result>0) {
			mv.setViewName("redirect:campaignList.ptsd");
		} else {
			mv.addObject("msg", "후원 글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//캠페인 삭제
	@RequestMapping(value="campaignRemove.ptsd", method=RequestMethod.GET)
	public String removeCampaign(Model model, @RequestParam("campaignNo") int campaignNo
			, @RequestParam("fileName") String fileRename, HttpServletRequest request) {
		int result = service.removeCampaign(campaignNo);
		if(result>0) {
			if(fileRename!="") {  //파일이 존재하면
				removeFile(fileRename, request);
			}
			return "redirect:campaignList.ptsd";
		} else {
			model.addAttribute("msg", "삭제 실패");
			return "common/errorPage";
		}
		
	}
	public void removeFile(String fileRename, HttpServletRequest request) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root+"\\campaignUpload";
		File file = new File(fullPath+"\\"+fileRename);
		if(file.exists()) { //파일이 존재한다면
			file.delete();  //파일 삭제
		}
	}
	
	//캠페인 기부 등록(마이페이지)
	public String registerCampaignRecord(){
		return "";
	}
	
	//캠페인 기부 목록 조회(마이페이지)
	public String printAllCampaignRecord() {
		return "";
	}
	
	//캠페인 기부 등록(고정 캠페인)
	public String registerDontaionRecord() {
		return "";
	}
	
	//임시로 작성, 일단 페이지만 보이게.
	@RequestMapping(value="campaignAllCampaignRecord.ptsd", method=RequestMethod.GET)
	public String printAllCampaignRe() {
		return "campaign/campaignStaticDonationList";
	}
	//캠페인 기부 목록 조회(고정 캠페인)
	public String printAllCampaignRecord2() {
		return "";
	}
		
}

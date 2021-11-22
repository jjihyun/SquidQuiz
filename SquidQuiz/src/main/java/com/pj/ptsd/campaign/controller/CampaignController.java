package com.pj.ptsd.campaign.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pj.ptsd.campaign.Pagination;
import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.campaign.domain.DonationRecord;
import com.pj.ptsd.campaign.domain.PageInfo;
import com.pj.ptsd.campaign.service.CampaignService;
import com.pj.ptsd.user.domain.User;

@Controller
public class CampaignController {

	@Autowired
	private CampaignService service;
	
	//캠페인 목록 조회
	@RequestMapping(value="campaignList.ptsd", method=RequestMethod.GET)
	public String printCampaignList(Model model
			, HttpServletRequest request, @RequestParam(value="page", required=false) Integer page
			, @RequestParam(value="type", required=false) String type) {
		try {
			request.setCharacterEncoding("utf-8");
			
			int currentPage =(page!=null)?page:1;
			if(type==null) {
				type="all";
			}
			int totalCount = service.getListCount(type);
//			System.out.println("총 개수 : "+totalCount);
			//System.out.println("현재 페이지 : "+currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
//			System.out.println("시작 페이지"+pi.getStartNavi());
//			System.out.println("끝 페이지"+pi.getEndNavi());
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
				//dRecord가 0일때 밑의 값들이 null값이면 안 되기 때문에 0을 넣어준다.
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
	//ajax용 클래스. (캠페인 목록 조회 페이지에 포함되어 있음)
	@ResponseBody 
	@RequestMapping(value="campaignListJSON.ptsd", method=RequestMethod.GET)
	public void campaignListJSON(HttpServletRequest request, HttpServletResponse response
			, @RequestParam("campaignType") String type
			, @RequestParam(value="page", required=false) Integer page) throws Exception{
//		Gson을 사용했기 때문에 아래 3줄을 필요없다.
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("application/json");
//		JsonObject obj = new JsonObject();
		int currentPage =(page!=null)?page:1;
		int totalCount = service.getListCount(type);

		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		pi.setType(type);
		List<Campaign> cList = service.printAll(pi);
//		System.out.println(cList);
//		System.out.println(pi+"\n");
		
		Gson gson = new Gson();
		//Map을 이용해서 캠페인 리스트 값과 페이지 값을 넣어준다.
		Map<String, Object> test = new HashMap<String, Object>();
		test.put("cList", cList);
		test.put("pi", pi);
//		System.out.println(test);
		//json으로 데이터 보내주기
		gson.toJson(test, response.getWriter());
		
	}
	
	
	//캠페인 정기후원 상세조회(자세히 보기)
	@RequestMapping(value="campaignStaticDetail.ptsd", method=RequestMethod.GET)
	public String printStaticOneCampaign(Model model) {
		try {
			//메인게임테이블에 값이 있는지 체크. null값 방지 위해서.
			int dRecord = service.printAllDonationRecord();
			if(dRecord>0) { 
				//누적모금액
				int dSumPrice = service.printDonationRecord();
				model.addAttribute("dSumPrice", dSumPrice);
			}else {
				int dSumPrice = 0;
				model.addAttribute("dSumPrice", dSumPrice);
			}
			return "campaign/campaignStaticDetail";
			
		}catch(Exception e) {
			return "common/erroPage";
		}
	}
	
	//캠페인 정기후원 목록 조회(퀴즈 참여 모금액 후원 내역)
	@RequestMapping(value="campaignAllCampaignRecord.ptsd", method=RequestMethod.GET)
	public String printAllCampaignRecord(Model model, HttpServletRequest request, 
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage =(page!=null)?page:1;
		int totalCount = service.getListCount();
		System.out.println("총 개수 : "+totalCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		//int result = 0;
		List<DonationRecord> dRList = service.printStaticRecord(pi);
		if(!dRList.isEmpty()) {
			model.addAttribute("dRList", dRList);
			model.addAttribute("pi", pi);
			return "campaign/campaignStaticDonationList";
		} else {
			model.addAttribute("msg", "캠페인 조회 실패");
			return "common/errorPage";
		}	
	}
	
	//캠페인 상세페이지 조회
	@RequestMapping(value="campaignDetail.ptsd", method=RequestMethod.GET)
	public ModelAndView printCampaignDetail(ModelAndView mv
			, @RequestParam("campaignNo") int campaignNo, Model model, HttpServletRequest request) {
		Campaign camp = service.printCampaignDetail(campaignNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Campaign> cList = service.printAll();  //다른 후원보기 볼때 필요한 코드.
		
		if(camp!=null) {
			mv.addObject("campaign", camp);
			String formatDate = sdf.format(camp.getcEndDate());
			String enrollDate = sdf.format(camp.getcEnrollDate());
			
			Date startDate = new Date();
			Date endDate = camp.getcEndDate();
//			System.out.println("끝나는 날짜 : "+endDate);
//			System.out.println("시작 날짜 : "+startDate);
			//디데이 계산 코드.
			int gap = (int) (endDate.getTime()-startDate.getTime());
			int result = (int) Math.ceil(gap/(1000*60*60*24));
			if(result>=1) {
				result+=1;
			}
			mv.addObject("cList", cList);
			//현재 모금 상황 퍼센트 계산
			double campMount = (double)camp.getcNowAmount()/(double)camp.getcTargetAmount()*100;
			mv.addObject("detail", campMount);
			mv.addObject("formatDate", formatDate);		//캠페인 종료일을 format을 이용해 yyyy-MM-dd 형식으로 반환.
			mv.addObject("enrollDate", enrollDate);
			mv.addObject("dDay", result);
			mv.setViewName("campaign/campaignDetail");
		} else {
			mv.addObject("msg", "캠페인 디테일 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//캠페인 기부 페이지
	@RequestMapping(value="donationPayView.ptsd", method=RequestMethod.GET)
	public String showDonationPay(@RequestParam("campaignNo") int campaignNo, Model model
	/* , @RequestParam("userId") String userId */ ) {
		Campaign camp = service.printCampaignDetail(campaignNo);
//		int myPoint = service.printPointCount(userId);
		if(camp!=null) {
//			model.addAttribute("point", myPoint);
			model.addAttribute("campaign", camp);
			return "campaign/campaignDonationPay";
		} else {
			model.addAttribute("msg", "캠페인 기부 페이지 조회 실패!");
			return "common/errorPage";
		}
	}
	//캠페인에 기부하기
	@ResponseBody
	@RequestMapping(value="donateCampaign.ptsd", method=RequestMethod.POST)
	public void registerDonation(@ModelAttribute CampaignRecord cRecord
			, Model model, HttpServletResponse response, @RequestParam("userId") String userId
			,@RequestParam("campaignNo") int cNo
			, @RequestParam("cRecordPoint") int cPoint, @ModelAttribute Campaign campaign
			,@ModelAttribute User user) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		
		//내가 가지고 있는 포인트 값 조회
		int myPoint = service.printPointCount(userId);
		if(myPoint>=cPoint) {  //가지고 있는 포인트가 선택한 포인트보다 크거나 같을 경우
			// 캠페인 기부 등록(마이페이지에서 확인 가능)
			int result = service.registerCampaignRecord(cRecord);
			
			//가지고 있는 포인트 업데이트(감소)
			int updatePoint = myPoint-cPoint;
			user.setPoint(updatePoint);
			int myPointResult = service.modifyMyPoint(user);
			
			//캠페인 현재 기부금 업데이트
			int cNowMoney = service.printCampaignNowPoint(cNo);
			//int moneySum = cNowMoney+cPoint;
			campaign.setcNowAmount(cNowMoney+cPoint);
			int updateCampaignResult = service.modifyCampaignMoney(campaign);
			
			if(result>0 && myPointResult>0) {
				out.println("<script>alert('기부가 되었습니다.');location.href='campaignList.ptsd';</script>");
				out.close(); 
			} else {
				model.addAttribute("msg", "기부하기 실패");
				out.println("<script>alert('기부 실패');location.href='common/errorPage';</script>");
				out.close(); 
			}
		} else {
			out.println("<script>alert('충분한 포인트가 없습니다. 포인트를 충전해주세요.');location.href='campaignList.ptsd';</script>");
			out.close();
		}

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
	@ResponseBody
	@RequestMapping(value="campaignRemove.ptsd", method=RequestMethod.GET)
	public void removeCampaign(Model model, @RequestParam("campaignNo") int campaignNo
			, @RequestParam("fileName") String fileRename, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int result = service.removeCampaign(campaignNo);
		if(result>0) {
			if(fileRename!="") {  //파일이 존재하면
				removeFile(fileRename, request);
			}
			out.println("<script>alert('캠페인이 삭제되었습니다.');location.href='campaignList.ptsd';</script>");
			out.close();
		} else {
			model.addAttribute("msg", "삭제 실패");
			out.println("<script>alert('캠페인 삭제 실패.');location.href='campaignList.ptsd';</script>");
			out.close();
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
	
}

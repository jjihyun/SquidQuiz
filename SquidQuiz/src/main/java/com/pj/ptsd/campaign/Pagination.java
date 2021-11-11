package com.pj.ptsd.campaign;

import com.pj.ptsd.campaign.domain.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int naviLimit =5; //한 페이지에서 보여줄 페이지의 개수
		int campaignLimit =8; //한 페이지에서 보여줄 게시글의 개수
		int maxPage;  //페이지의 끝
		int startNavi;
		int endNavi;
		
		maxPage=(int)((double)totalCount/campaignLimit+0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi+naviLimit-1;
		if(maxPage<endNavi) {
			endNavi=maxPage;
		}
		pi = new PageInfo(currentPage, campaignLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}

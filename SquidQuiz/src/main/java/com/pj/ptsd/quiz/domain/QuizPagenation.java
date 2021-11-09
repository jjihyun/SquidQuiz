package com.pj.ptsd.quiz.domain;

public class QuizPagenation {
	public static PageData getPageData(int currentPage, int totalCount) {
		PageData pd = null;
		int naviLimit = 5;
		int oxLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;

		maxPage = (int) ((double) totalCount / oxLimit + 0.9);
		startNavi = (((int) ((double) currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage<endNavi) {
			endNavi = maxPage;
		}
		pd = new PageData(
				currentPage,oxLimit
				,naviLimit,startNavi
				,endNavi,totalCount
				,maxPage);
		return pd;
				
	}
}

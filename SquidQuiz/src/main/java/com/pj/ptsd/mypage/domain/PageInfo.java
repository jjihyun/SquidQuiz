package com.pj.ptsd.mypage.domain;

public class PageInfo {
		private int currentPage;  //현재 페이지
		private int campaignLimit;   //한페이지당 몇개의 게시글
		private int naviLimit;   //한페이지당 몇개의 네비게이션 수
		private int startNavi;  //네비게이션 첫번째 값
		private int endNavi;  //네비게이션 마지막 값
		private int totalCount;  //전체 게시글 개수
		private int maxPage;  //페이지 마지막 번호

		public PageInfo() {}
		
		

		public PageInfo(int currentPage, int campaignLimit, int naviLimit, int startNavi, int endNavi, int totalCount,
				int maxPage) {
			super();
			this.currentPage = currentPage;
			this.campaignLimit = campaignLimit;
			this.naviLimit = naviLimit;
			this.startNavi = startNavi;
			this.endNavi = endNavi;
			this.totalCount = totalCount;
			this.maxPage = maxPage;
		}



		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getCampaignLimit() {
			return campaignLimit;
		}

		public void setCampaignLimit(int campaignLimit) {
			this.campaignLimit = campaignLimit;
		}

		public int getNaviLimit() {
			return naviLimit;
		}

		public void setNaviLimit(int naviLimit) {
			this.naviLimit = naviLimit;
		}

		public int getStartNavi() {
			return startNavi;
		}

		public void setStartNavi(int startNavi) {
			this.startNavi = startNavi;
		}

		public int getEndNavi() {
			return endNavi;
		}

		public void setEndNavi(int endNavi) {
			this.endNavi = endNavi;
		}

		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}

		public int getMaxPage() {
			return maxPage;
		}

		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}

		@Override
		public String toString() {
			return "PageInfo [currentPage=" + currentPage + ", campaignLimit=" + campaignLimit + ", naviLimit="
					+ naviLimit + ", startNavi=" + startNavi + ", endNavi=" + endNavi + ", totalCount=" + totalCount
					+ ", maxPage=" + maxPage + "]";
		}
		
		
		

}
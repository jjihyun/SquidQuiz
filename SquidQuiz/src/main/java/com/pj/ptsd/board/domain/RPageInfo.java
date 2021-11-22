package com.pj.ptsd.board.domain;

public class RPageInfo {

	private int Limit;
	private int Page;
	private int Startpage;
	private int Endpage;
	private int endNavi;
	private int Maxpage;
	
	public RPageInfo() {}

	public int getLimit() {
		return Limit;
	}

	public int getPage() {
		return Page;
	}

	public int getStartpage() {
		return Startpage;
	}

	public int getEndpage() {
		return Endpage;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public int getMaxpage() {
		return Maxpage;
	}

	public void setLimit(int limit) {
		Limit = limit;
	}

	public void setPage(int page) {
		Page = page;
	}

	public void setStartpage(int startpage) {
		Startpage = startpage;
	}

	public void setEndpage(int endpage) {
		Endpage = endpage;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public void setMaxpage(int maxpage) {
		Maxpage = maxpage;
	}

	@Override
	public String toString() {
		return "RPageInfo [Limit=" + Limit + ", Page=" + Page + ", Startpage=" + Startpage + ", Endpage=" + Endpage
				+ ", endNavi=" + endNavi + ", Maxpage=" + Maxpage + "]";
	}
}

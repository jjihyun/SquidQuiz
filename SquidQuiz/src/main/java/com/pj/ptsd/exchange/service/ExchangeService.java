package com.pj.ptsd.exchange.service;

import java.util.List;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.qna.domain.PageInfo;

public interface ExchangeService {
	//환전신청 전체 목록 조회 (관리자)
	public List<Exchange> printAllExchange(PageInfo pi);
	//환전신청 회원정보로 조회 ( 회원 )
	public List<Exchange> printOwnExchange(PageInfo pi, int userNo);
	//search by Id
	public List<Exchange> printSearchExchange(Search search);
	//환전신청(등록, 회원)
	public int registerExchange(Exchange exchange);
	//환전처리( 수정 , 관리자)
	public int modifyExchangeStatus();
	
	//전체 게시물 개수 조회
	public int getAllListCount();
	//회원 게시물 개수 조회
	public int getOwnListCount(int userNo);
}

package com.pj.ptsd.exchange.store;

import java.util.List;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.qna.domain.PageInfo;

public interface ExchangeStore {
	//환전신청 전체 목록 조회 (관리자)
	public List<Exchange> selectAllExchange(PageInfo pi);
	//환전신청 회원정보로 조회 ( 회원 )
	public List<Exchange> selectOwnExchange(PageInfo pi, int userNo);
	//search by Id
	public List<Exchange> selectSearchExchange(Search search);
	//환전신청(등록)
	public int insertExchange(Exchange exchange);
	//환전처리
	public int updateExchangeStatus(int exchangeNo);
	//전체 게시물 개수 조회
	public int selectAllListCount();
	//회원 게시물 개수 조회
	public int selectOwnListCount(int userNo);
}

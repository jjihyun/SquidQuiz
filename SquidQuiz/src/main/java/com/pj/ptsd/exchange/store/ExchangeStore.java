package com.pj.ptsd.exchange.store;

import java.util.List;

import com.pj.ptsd.exchange.domain.Exchange;

public interface ExchangeStore {
	//환전신청 전체 목록 조회 (관리자)
	public List<Exchange> selectAllExchange();
	//환전신청 회원정보로 조회 ( 회원 )
	public List<Exchange> selectOwnExchange(int userNo);
	//환전신청(등록)
	public int insertExchange(Exchange exchange);
	//환전처리
	public int updateExchangeStatus();
}

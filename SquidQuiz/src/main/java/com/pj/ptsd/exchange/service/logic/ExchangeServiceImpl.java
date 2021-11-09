package com.pj.ptsd.exchange.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.service.ExchangeService;
import com.pj.ptsd.exchange.store.ExchangeStore;

@Service
public class ExchangeServiceImpl implements ExchangeService{
	
	@Autowired
	private ExchangeStore store;
	//전체조회(관리자)
	@Override
	public List<Exchange> printAllExchange() {
		List<Exchange> eList = store.selectAllExchange();
		return eList;
	}
	//회원정보로 조회(회원)
	@Override
	public List<Exchange> printOwnExchange(int userNo) {
		List<Exchange> eList = store.selectOwnExchange(userNo);
		return eList;
	}
	//환전 신청 ( 등록 ) 
	@Override
	public int registerExchange(Exchange exchange) {
		int result = store.insertExchange(exchange);
		return result;
	}
	// 환전 처리 (status 수정)
	@Override
	public int modifyExchangeStatus() {
		int result = store.updateExchangeStatus();
		return result;
	}

}

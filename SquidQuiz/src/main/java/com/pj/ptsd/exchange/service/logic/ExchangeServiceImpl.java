package com.pj.ptsd.exchange.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.exchange.service.ExchangeService;
import com.pj.ptsd.exchange.store.ExchangeStore;
import com.pj.ptsd.qna.domain.PageInfo;

@Service
public class ExchangeServiceImpl implements ExchangeService{
	
	@Autowired
	private ExchangeStore store;
	//전체조회(관리자)
	@Override
	public List<Exchange> printAllExchange(PageInfo pi) {
		List<Exchange> eList = store.selectAllExchange(pi);
		return eList;
	}
	//회원정보로 조회(회원)
	@Override
	public List<Exchange> printOwnExchange(PageInfo pi, int userNo) {
		List<Exchange> eList = store.selectOwnExchange(pi, userNo);
		return eList;
	}
	//Search by Id (관리자)
	@Override
	public List<Exchange> printSearchExchange(Search search) {
		List<Exchange> eList = store.selectSearchExchange(search);
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
	public int modifyExchangeStatus(int exchangeNo) {
		int result = store.updateExchangeStatus(exchangeNo);
		return result;
	}
	//전체 게시물 개수
	@Override
	public int getAllListCount() {
		int result = store.selectAllListCount();
		return result;
	}
	//해당 회원이 작성한 게시물 개수
	@Override
	public int getOwnListCount(int userNo) {
		int result = store.selectOwnListCount(userNo);
		return result;
	}

}

package com.pj.ptsd.exchange.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.store.ExchangeStore;

@Repository
public class ExchangeStoreLogic implements ExchangeStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	//전체조회
	@Override
	public List<Exchange> selectAllExchange() {
		List<Exchange> eList = sqlSession.selectList("");
		return eList;
	}
	//회원 정보로 조회
	@Override
	public List<Exchange> selectOwnExchange(int userNo) {
		List<Exchange> eList = sqlSession.selectList("");
		return eList;
	}
	//등록
	@Override
	public int insertExchange(Exchange exchange) {
		int result = sqlSession.insert("", exchange);
		return result;
	}
	//상태 수정
	@Override
	public int updateExchangeStatus() {
		int result = sqlSession.update("");
		return result;
	}

}

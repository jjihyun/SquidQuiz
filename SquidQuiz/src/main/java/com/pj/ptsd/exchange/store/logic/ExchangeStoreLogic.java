package com.pj.ptsd.exchange.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.exchange.domain.Search;
import com.pj.ptsd.exchange.store.ExchangeStore;
import com.pj.ptsd.qna.domain.PageInfo;

@Repository
public class ExchangeStoreLogic implements ExchangeStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	//전체조회
	@Override
	public List<Exchange> selectAllExchange(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Exchange> eList = sqlSession.selectList("exchangeMapper.selectExchangeList",pi,rowBounds);
		return eList;
	}
	//회원 정보로 조회
	@Override
	public List<Exchange> selectOwnExchange(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Exchange> eList = sqlSession.selectList("exchangeMapper.selectOwnExchange",userId,rowBounds);
		return eList;
	}
	//아이디로 Search
	@Override
	public List<Exchange> selectSearchExchange(Search search) {
		List<Exchange> eList = sqlSession.selectList("exchangeMapper.selectSearchExchange", search);
		return eList;
	}
	//등록
	@Override
	public int insertExchange(Exchange exchange) {
		
		int result = 0;
		int result1 = sqlSession.update("exchangeMapper.subtractUserPoint", exchange);
		if (result1>0) {
			result = sqlSession.insert("exchangeMapper.insertExchange", exchange);
		}else {
			return result1;
		}
		return result;
		
	}
	//상태 수정
	@Override
	public int updateExchangeStatus(int exchangeNo) {
		int result = sqlSession.update("exchangeMapper.updateExchange",exchangeNo);
		return result;
	}
	@Override
	public int selectAllListCount() {
		int result = sqlSession.selectOne("exchangeMapper.selectListCount");
		return result;
	}
	@Override
	public int selectOwnListCount(String userId) {
		int result = sqlSession.selectOne("exchangeMapper.selectOwnListCount", userId);
		return result;
	}


}

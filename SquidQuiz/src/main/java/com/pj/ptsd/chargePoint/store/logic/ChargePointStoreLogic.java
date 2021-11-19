package com.pj.ptsd.chargePoint.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.domain.PageInfo;
import com.pj.ptsd.chargePoint.store.ChargePointStore;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.User;

@Repository
public class ChargePointStoreLogic implements ChargePointStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ChargePoint> selectChargeList(PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<ChargePoint> cList = sqlSession.selectList("chargePointMapper.selectChargePoint", userNo, rowBounds);
		return cList;
	}
	
	@Override
	public List<Exchange> selectExchangeList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Exchange> eList = sqlSession.selectList("chargePointMapper.selectExchange", userId, rowBounds);
		return eList;
	}

	@Override
	public int selectAllEListCount(String userId) {
		int result = sqlSession.selectOne("chargePointMapper.selectEListCount", userId);
		return result;
	}
	@Override
	public int selectAllCListCount(int userNo) {
		int result = sqlSession.selectOne("chargePointMapper.selectCListCount", userNo);
		return result;
	}

	@Override
	public User selectOne(String uId) {
		User user = sqlSession.selectOne("chargePointMapper.selectOnePoint", uId);
		return user;
	}
	
	

}

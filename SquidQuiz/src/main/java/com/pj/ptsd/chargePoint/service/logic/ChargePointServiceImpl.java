package com.pj.ptsd.chargePoint.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.domain.PageInfo;
import com.pj.ptsd.chargePoint.service.ChargePointService;
import com.pj.ptsd.chargePoint.store.ChargePointStore;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.User;

@Service
public class ChargePointServiceImpl implements ChargePointService{
	
	@Autowired
	private ChargePointStore store;

	@Override
	public List<ChargePoint> printChargeList(PageInfo pi, int userNo) {
		List<ChargePoint> cList = store.selectChargeList(pi, userNo);
		return cList;
	}


	@Override
	public List<Exchange> printExchangeList(PageInfo pi, String userId) {
		List<Exchange> eList = store.selectExchangeList(pi, userId);
		return eList;
	}
	

	@Override
	public int getAllEListCount(String userId) {
		int result = store.selectAllEListCount(userId); 
		return result;
	}
	@Override
	public int getAllCListCount(int userNo) {
		int result = store.selectAllCListCount(userNo); 
		return result;
	}


	@Override
	public User printOne(String uId) {
		User user = store.selectOne(uId);
		return user;
	}


	@Override
	public int addPayPoint(Map<String, Object> map) {
		int result = 0;
		int updeteResult = store.addPayPoint(map);
		int insrtResert = store.insertPointHistory(map);
		if(updeteResult>0 && insrtResert>0) {
			result = updeteResult+insrtResert;
		}
		return result;
			
	}
	

}

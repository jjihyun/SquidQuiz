package com.pj.ptsd.chargePoint.service.logic;

import java.util.List;

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
	public int getAllEListCount() {
		int result = store.selectAllEListCount(); 
		return result;
	}
	@Override
	public int getAllCListCount() {
		int result = store.selectAllCListCount(); 
		return result;
	}


	@Override
	public User printOne(String uId) {
		User user = store.selectOne(uId);
		return user;
	}
	

}

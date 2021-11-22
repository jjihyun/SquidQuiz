package com.pj.ptsd.chargePoint.service;

import java.util.List;
import java.util.Map;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.domain.PageInfo;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.User;

public interface ChargePointService {
	
	public List<ChargePoint> printChargeList(PageInfo pi, int userNo);
	public List<Exchange> printExchangeList(PageInfo pi, String userId);
	//전체 게시물 개수 조회
	public int getAllEListCount(String userId);
	public int getAllCListCount(int userNo);
	
	public User printOne(String uId);

	
	public int addPayPoint(Map<String, Object> map);
	
}

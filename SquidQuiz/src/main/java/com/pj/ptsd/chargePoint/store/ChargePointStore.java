package com.pj.ptsd.chargePoint.store;

import java.util.List;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.domain.PageInfo;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.User;

public interface ChargePointStore {
	
	public List<ChargePoint> selectChargeList(PageInfo pi, int userNo);
	public List<Exchange> selectExchangeList(PageInfo pi, String userId);
	//전체 게시물 개수 조회
	public int selectAllEListCount();
	public int selectAllCListCount();
	
	public User selectOne(String uId);
}

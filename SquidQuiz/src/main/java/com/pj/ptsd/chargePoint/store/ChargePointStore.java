package com.pj.ptsd.chargePoint.store;

import java.util.List;
import java.util.Map;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.domain.PageInfo;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.User;

public interface ChargePointStore {
	
	public List<ChargePoint> selectChargeList(PageInfo pi, int userNo);
	public List<Exchange> selectExchangeList(PageInfo pi, String userId);
	//전체 게시물 개수 조회
	public int selectAllEListCount(String userId);
	public int selectAllCListCount(int userNo);
	
	public User selectOne(String uId);
	
	public int addPayPoint(Map<String, Object> map);
	
	public int insertPointHistory(Map<String, Object> map);
}

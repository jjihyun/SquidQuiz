package com.pj.ptsd.chargePoint.store;

import java.util.List;

import com.pj.ptsd.chargePoint.domain.ChargePoint;

public interface ChargePointStore {
	
	public List<ChargePoint> selectAll(); 

}

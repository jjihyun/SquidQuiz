package com.pj.ptsd.chargePoint.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.service.ChargePointService;
import com.pj.ptsd.chargePoint.store.ChargePointStore;

@Service
public class ChargePointServiceImpl implements ChargePointService{
	
	@Autowired
	private ChargePointStore store;
	
	@Override
	public List<ChargePoint> printAll() {
		
		return null;
	}
	
	

}

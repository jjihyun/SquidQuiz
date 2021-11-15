package com.pj.ptsd.chargePoint.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.store.ChargePointStore;

@Repository
public class ChargePointStoreLogic implements ChargePointStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChargePoint> selectAll() {
		
		return null;
	}

}

package com.pj.ptsd.chargePoint.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.pj.ptsd.chargePoint.domain.ChargePoint;
import com.pj.ptsd.chargePoint.service.ChargePointService;

@Controller
public class ChargePointController {
	
	@Autowired
	private ChargePointService service;
	
	

}

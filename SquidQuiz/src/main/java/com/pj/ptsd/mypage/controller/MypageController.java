package com.pj.ptsd.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.pj.ptsd.mypage.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;

}

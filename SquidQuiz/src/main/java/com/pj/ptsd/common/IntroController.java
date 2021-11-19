package com.pj.ptsd.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {
	@RequestMapping(value="introduce.ptsd")
	public String intro() {
		
		return "introduce/introduce";
	}
}

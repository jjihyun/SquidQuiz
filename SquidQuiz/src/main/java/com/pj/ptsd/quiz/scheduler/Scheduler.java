package com.pj.ptsd.quiz.scheduler;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	//초 분 시 일 월 년
//	@Scheduled(cron="0 0 20 ? * MON-FRI")
//	public void print() {
//		System.out.println("call: " +new Date());
//	}
	
	@Scheduled(cron="0 * * * * *")
	public void test() {
		System.out.println("call:" + new Date());
	}
}

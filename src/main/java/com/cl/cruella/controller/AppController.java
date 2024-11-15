package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app")
public class AppController {
	
//  결재작성 메인페이지 이동
	@GetMapping("/app_main.do")
	public void appMainPage() {
		
	}
	
//	기안서작성 페이지 이동
	@GetMapping("/form_draft.do")
	public void formDraftPage() {
		
	}
	
	
	
	
//  연차신청서 페이지 이동
	@GetMapping("/form_annual.do")
	public void formAnnualPage() {
		
	}
	

}

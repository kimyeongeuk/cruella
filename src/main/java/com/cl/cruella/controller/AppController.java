package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.AppService;

import ch.qos.logback.core.model.Model;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/app")
public class AppController {
	
	private final AppService appService;
	
	
	
	
//  결재작성 메인페이지 이동
	@GetMapping("/app_main.do")
	public void appMainPage() {}
	
//	기안서작성 페이지 이동
	@GetMapping("/form_draft.do")
	public void formDraftPage() {}
	
//	품의서작성 페이지 이동
	@GetMapping("/form_robin.do")
	public void formRobinPage() {}
	
	
//  연차신청서 페이지 이동
	@GetMapping("/form_annual.do")
	public void formAnnualPage() {}
	
	
//  지각불참사유서 페이지 이동
	@GetMapping("/form_per.do")
	public void formPerPage() {}
	
	
//  증명서 페이지 이동
	@GetMapping("/form_cer.do")
	public void formCerPage() {}
	
//  증명서 페이지 이동
	@GetMapping("/form_request.do")
	public void formRequestPage() {}
	
	
//	jstree 조직도 조회
	@ResponseBody
	@GetMapping(value="/jstreeList.do", produces="application/json")
	public List<DeptDto> ajaxJstree() {
		
		List<DeptDto> list = appService.ajaxJstree();
		
		return list;
		
	}
	
	
	
	
	

}

package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.AppService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/app")
public class AppController {
	
	private final AppService appService;
	
	
	
	
//  결재작성 메인페이지 이동
	@GetMapping("/app_main.do")
	public void appMainPage() {
		
	}
	
//	기안서작성 페이지 이동
	@GetMapping("/form_draft.do")
	public void formDraftPage(Model model,HttpSession session) {
		String userNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		DeptDto m = appService.formDraftPage(userNo);
		model.addAttribute("m",m);
		
	}
	
//	품의서작성 페이지 이동
	@GetMapping("/form_robin.do")
	public void formRobinPage(Model model,HttpSession session) {
		String userNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		DeptDto d = appService.formDraftPage(userNo);
		model.addAttribute("d",d);
		
	}
	
	
//  연차신청서 페이지 이동
	@GetMapping("/form_annual.do")
	public void formAnnualPage(Model model,HttpSession session) {
		String userNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		DeptDto m = appService.formDraftPage(userNo);
		model.addAttribute("m",m);
	}
	
	
//  지각불참사유서 페이지 이동
	@GetMapping("/form_per.do")
	public void formPerPage(Model model,HttpSession session) {
		String userNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		DeptDto m = appService.formDraftPage(userNo);
		model.addAttribute("m",m);
	}
	
	
//  증명서 페이지 이동
	@GetMapping("/form_cer.do")
	public void formCerPage(Model model,HttpSession session) {
		String userNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		DeptDto m = appService.formDraftPage(userNo);
		model.addAttribute("m",m);
	}
	
//  증명서 페이지 이동
	@GetMapping("/form_request.do")
	public void formRequestPage(Model model,HttpSession session) {
		String userNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		DeptDto m = appService.formDraftPage(userNo);
		model.addAttribute("m",m);
	}
	
	
	
//	jstree 조직도 조회
	@ResponseBody
	@GetMapping(value="/jstreeList.do", produces="application/json")
	public List<DeptDto> ajaxJstree() {
		
		List<DeptDto> list = appService.ajaxJstree();
		
		return list;
		
	}
	
	
//	기안작성 insert
	@ResponseBody
	@PostMapping(value="/ajaxInsert.do", produces="application/json")
	public void ajaxAppInsert(AppdocDto ad, MultipartFile uploadFile) {
		
		
		
		
	}
	
	
	
	
	
	

}

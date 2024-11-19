package com.cl.cruella.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.AppService;
import com.cl.cruella.util.FileUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/app")
public class AppController {
	
	private final AppService appService;
	private final FileUtil fileUtil;
	
	
	
	
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
	
	
	
//	전자결재작성 insert
	@PostMapping("/appInsert.do")
	public String appInsert(AppdocDto ad, List<MultipartFile> uploadFile,RedirectAttributes rdAttributes ) {
		
		List<AttachDto> list = new ArrayList<>();
		
		for(MultipartFile file : uploadFile) {
			if(file != null && !file.isEmpty()) { // 파일이 존재할 경우
				Map<String, String> map = fileUtil.fileupload(file,"appdocFolder");
				list.add(AttachDto.builder()
								  .filePath(map.get("filePath"))
								  .originalName(map.get("originalName"))
								  .filesystemName(map.get("filesystemName"))
								  .build());
			}
		}
		
		int result = appService.insertApp(ad,list);
		
		if(result > 0) {
			log.debug("전자결재 신청 성공");
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 결재 되었습니다.");
		}else {
			log.debug("실패");
			rdAttributes.addFlashAttribute("alertMsg", "실패");
			
		}
		
		return "redirect:/app/form_draft.do";
		
		
	
		
		
		
		
		
	}
	
	
	
	
	
	

}

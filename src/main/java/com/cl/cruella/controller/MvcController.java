package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cl.cruella.dto.MemberDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class MvcController {
	
	
	@GetMapping("/")
	public String maingPage(HttpSession session) {
		
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			return "/dashboard";
		}else {
			return "member/loginPage";
		}
		
	}

	@GetMapping("/dashboard")
	public void testMainPage() {}
}

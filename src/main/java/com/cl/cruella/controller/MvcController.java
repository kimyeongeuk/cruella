package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcController {
	
	
	@GetMapping("/")
	public String maingPage() {
		return "member/loginPage";
	}

	@GetMapping("/mainTest")
	public String testMainPage() {
		return "동규/mainTest";
	}
}

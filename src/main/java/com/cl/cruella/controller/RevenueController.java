package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/revenue")
public class RevenueController {
	
	@GetMapping("/revenue.do")
	public void chatPage() {
		
	}

}

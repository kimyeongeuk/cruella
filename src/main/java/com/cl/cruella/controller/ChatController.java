package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@GetMapping("/chatPage.do")
	public void chatPage(HttpSession session) {
		
		// 로그인 유저 번호 가져오기
		
		
		
		
	}

}

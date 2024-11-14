package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@GetMapping("/boardList.do")
	public void boardListPage() {
		
	}
	
	@GetMapping("/boardDetail.do")
	public void boardDetailPage() {
		
	}
	
	@GetMapping("/boardModify.do")
	public void boardModifyPage() {
		
	}
	
	@GetMapping("/boardRegist.do")
	public void boardRegistPage() {
		
	}

}

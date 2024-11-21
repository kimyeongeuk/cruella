package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.cruella.dto.SupplyDto;
import com.cl.cruella.service.SupplyServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@RequestMapping("/supply")
@Slf4j
public class SupplyController {

	
	private final SupplyServiceImpl supplyServiceImpl;
	
	
	
	// 비품 전체 목록 조회
	@GetMapping("/supply.do")
	public String selectSupplyList(Model model) {
		List<SupplyDto> list = supplyServiceImpl.selectSupplyList();
		
		model.addAttribute("list", list);
		log.debug("결과값{}", list);

		return "/supply/supply";
		
	}
	
	
	
	
	
	
}

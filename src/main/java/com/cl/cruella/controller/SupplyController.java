package com.cl.cruella.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.PageInfoDto;
import com.cl.cruella.dto.SupplyDto;
import com.cl.cruella.service.SupplyServiceImpl;
import com.cl.cruella.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@RequestMapping("/supply")
@Slf4j
public class SupplyController {

	
	private final SupplyServiceImpl supplyServiceImpl;
	
	private final PagingUtil pagingUtil;
	
	
	// 비품 전체 목록 페이지로 이동용 controller (조회 x)
	@GetMapping("/supply.do")
	public String supplyPage(Model model) {
		
		return "/supply/supply";
		
	}
	
	// 선택된 카테고리 목록 조회 ajax용 controller
	/*
	 * 요청시 전달되는 선택된 카테고리값, 요청하는페이지번호 전달받기 => 매개변수
	 * 		해당 카테고리에 대한 총 비품갯수 조회
	 * 		PageInfo 객체 세팅
	 * 		리스트 조회 
	 * 
	 * 		응답데이터 (PageInfo, 리스트) => Map에 담아 응답
	 */
	
	
	
	// 카테고리 선택시 목록 조회
	@ResponseBody // map.jsp 로 안읽히게끔 막아주는 것
	@GetMapping("/list.do")
	public Map<String, Object> selectSupplyList(String supCategory, int pageNo, Model model) {
		
		
		// 비품 갯수 조회
		int listCount = supplyServiceImpl.countSupply(supCategory);
//		log.debug("카테고리{}", listCount);
//		log.debug("페이지{}", pageNo);
		
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, pageNo, 5, 7);
		
		
		// 비품 목록 불러오기
		List<SupplyDto> list = supplyServiceImpl.selectSupplyList(supCategory, pi);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		model.addAttribute("pi", pi);
		//log.debug("결과값{}", list);
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

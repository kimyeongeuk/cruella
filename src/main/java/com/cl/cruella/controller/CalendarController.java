package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.CalendarDto;
import com.cl.cruella.service.CalendarServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@RequestMapping("/calendar")
@Slf4j

public class CalendarController {

	private final CalendarServiceImpl caldendarServiceImpl;
	
	
	// 캘린더 조회
	@GetMapping("/calendar.do")
	public String selectCalenderList(Model model) {
		
		List<CalendarDto> list = caldendarServiceImpl.selectCalenderList();
		
		model.addAttribute("list", list);
		
//		log.debug("결과값{}", list);
		
		
		return "/calendar/calendar"; // 이 jsp를 실행 할 때 위에있는 list를 가지고 간다. 그래서 jsp 에서 list를 쓸 수 있음
	}
	
	
	// 캘린더 추가
	@ResponseBody
	@PostMapping("/insertCalendar.do")
	public int insertCalendar(CalendarDto c) {
//		log.debug("log{}",c);
		int result = caldendarServiceImpl.insertCalendar(c);
		return result;
	}
	
	
}

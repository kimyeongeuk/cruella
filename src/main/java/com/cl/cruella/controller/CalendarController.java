package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/companyCalendar.do")
	public String companyCalendar(Model model) {
		
		List<CalendarDto> list = caldendarServiceImpl.companyCalenderList();
		
		model.addAttribute("list", list);
		
		log.debug("결과값{}", list);
		
		
		return "/calendar/companyCalendar"; // 이 jsp를 실행 할 때 위에있는 list를 가지고 간다. 그래서 jsp 에서 list를 쓸 수 있음
	}
}

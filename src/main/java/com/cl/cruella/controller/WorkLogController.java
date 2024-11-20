package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.WorkLogDto;
import com.cl.cruella.service.WorkLogService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/wl")
public class WorkLogController {
	
	private final WorkLogService wlService ;

	
	// 출근 등록 여부 조회
	@PostMapping("/checkStatus.do")
	@ResponseBody
	public String checkStatus(String memNo) {
		
		WorkLogDto wl = wlService.checkStatus(memNo);
		
		if(wl != null) {	// 오늘 출근 등록이 되었을 때
			return "YYY";
		}else {				// 오늘 출근 등록을 아직 하지 않았을 때
			return "NNN";
		}
		
	}

	// 출근
	@PostMapping("/clockIn.do")
	@ResponseBody
	public String clockIn(WorkLogDto workLog) {
		
		// System.out.println(workLog);
		
		int result = wlService.clockIn(workLog);
		
		return workLog.getClockInTime();
	}
	
	
	
}

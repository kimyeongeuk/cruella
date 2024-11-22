package com.cl.cruella.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.WorkLogDto;
import com.cl.cruella.service.WorkLogService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/wl")
public class WorkLogController {
	
	private final WorkLogService wlService ;


	// 출근
	@PostMapping("/clockIn.do")
	@ResponseBody
	public String clockIn(WorkLogDto workLog, HttpSession session) {
		
		String clTime = workLog.getClockInTime();

	    int hour = Integer.parseInt(clTime.split(":")[0]); // 출근 시간 ??시 추출
	    MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
	    
	    if(hour >= 9) { // 출근시간이 9시 이상일때
	    	int result = wlService.clockInLate(workLog);
	    	
	    	loginUser.setWlStatus("C");
	    }else {
	    	int result = wlService.clockIn(workLog);
	    	loginUser.setWlStatus("L");
	    }
	    session.setAttribute("loginUser", loginUser);
        
	    // 세션에 출근 상태 업데이트
		
		return workLog.getClockInTime();
	}
	
	
	
}

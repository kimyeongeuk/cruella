package com.cl.cruella.service;

import java.util.List;

import com.cl.cruella.dto.CalendarDto;
import com.cl.cruella.dto.WorkLogDto;

public interface WorkLogService {

	// 출근
	int clockIn(WorkLogDto workLog);
	
	// 출근시간조회
	String selectClockInTime(String memNo);
	
	// 퇴근
	int clockOut(WorkLogDto workLog);
	
	// 근태기록조회
	List<CalendarDto> loadWorkLog(String memNo);
	
	// 출퇴근 시간 조회
	List<WorkLogDto> allWorkTime(String memNo);
}

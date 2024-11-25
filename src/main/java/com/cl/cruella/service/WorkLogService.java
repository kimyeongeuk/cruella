package com.cl.cruella.service;

import com.cl.cruella.dto.WorkLogDto;

public interface WorkLogService {

	// 출근
	int clockIn(WorkLogDto workLog);
	
	// 출근시간조회
	String selectClockInTime(String memNo);
	
	// 퇴근
	int clockOut(WorkLogDto workLog);
}

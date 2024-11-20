package com.cl.cruella.service;

import com.cl.cruella.dto.WorkLogDto;

public interface WorkLogService {

	// 출근 여부 조회
	WorkLogDto checkStatus(String memNo);
	
	// 출근
	int clockIn(WorkLogDto workLog);
	
}

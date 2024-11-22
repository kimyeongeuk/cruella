package com.cl.cruella.service;

import com.cl.cruella.dto.WorkLogDto;

public interface WorkLogService {

	// 출근(정상)
	int clockIn(WorkLogDto workLog);
	
	// 출근(지각)
	int clockInLate(WorkLogDto workLog);
}

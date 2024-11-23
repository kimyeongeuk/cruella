package com.cl.cruella.service;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.WorkLogDao;
import com.cl.cruella.dto.WorkLogDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WorkLogServiceImpl implements WorkLogService {

	private final WorkLogDao wlDao;
		
	@Override
	public int clockIn(WorkLogDto workLog) {
		
		return wlDao.clockIn(workLog);
	}

	@Override
	public String selectClockInTime(String memNo) {
		return wlDao.selectClockInTime(memNo);
	}

	@Override
	public int clockOut(WorkLogDto workLog) {
		return wlDao.clockOut(workLog);
	}

}

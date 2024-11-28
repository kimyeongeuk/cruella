package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.WorkLogDao;
import com.cl.cruella.dto.CalendarDto;
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

	@Override
	public List<CalendarDto> loadWorkLog(String memNo) {
		return wlDao.loadWorkLog(memNo);
	}

	@Override
	public List<WorkLogDto> allWorkTime(String memNo) {
		return wlDao.allWorkTime(memNo);
	}

	@Override
	public void updateAbsences() {
		wlDao.updateAbsences();
	}

	@Override
	public void insertAbsences() {
		wlDao.insertAbsences();
	}

}

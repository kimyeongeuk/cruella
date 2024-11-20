package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.CalendarDao;
import com.cl.cruella.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {

	private final CalendarDao calendarDao;
	
	@Override
	public List<CalendarDto> selectCalenderList() {
		return calendarDao.selectCalenderList();
	}

	@Override
	public int insertCalendar(CalendarDto c) {
		return calendarDao.insertCalendar(c);
	}

}

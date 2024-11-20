package com.cl.cruella.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CalendarDao {

	private final SqlSessionTemplate sqlSession;
	
	public List<CalendarDto> selectCalenderList(){
		return sqlSession.selectList("calendarMapper.selectCalendarList");
	}
	
	public int insertCalendar(CalendarDto c) {
		return sqlSession.insert("calendarMapper.insertCalendar", c);
	}
	
	public int updateCalendar(CalendarDto c) {
		return sqlSession.update("calendarMapper.updateCalendar", c);
	}
	
	public int deleteCalender(CalendarDto c) {
		return sqlSession.delete("calendarMapper.deleteCalender", c);
	}
}

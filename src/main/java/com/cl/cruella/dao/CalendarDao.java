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
	
	public List<CalendarDto> companyCalenderList(){
		return sqlSession.selectList("calenderMapper.companyCalenderList");
	}
	
	
	
	
}

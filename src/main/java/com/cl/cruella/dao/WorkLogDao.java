package com.cl.cruella.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.WorkLogDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WorkLogDao {

	private final SqlSessionTemplate sqlSession;

	
	public int clockIn(WorkLogDto workLog) {

		return sqlSession.insert("wlMapper.clockIn", workLog);
	}
	
	public String selectClockInTime(String memNo) {
		return sqlSession.selectOne("wlMapper.selectClockInTime", memNo);
	}
	
	public int clockOut(WorkLogDto workLog) {
		return sqlSession.update("wlMapper.clockOut", workLog);
	}
	
}

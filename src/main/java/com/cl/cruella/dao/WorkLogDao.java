package com.cl.cruella.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.WorkLogDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WorkLogDao {

	private final SqlSessionTemplate sqlSession;

	public WorkLogDto checkStatus(String memNo) {
		return sqlSession.selectOne("wlMapper.checkStatus", memNo);
	}
	
	public int clockIn(WorkLogDto workLog) {
		return sqlSession.insert("wlMapper.clockIn", workLog);
	}
	
}

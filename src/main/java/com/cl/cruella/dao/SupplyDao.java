package com.cl.cruella.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.SupplyDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SupplyDao {

	
	private final SqlSessionTemplate sqlSession;
	
	public List<SupplyDto> selectSupplyList(){
		return sqlSession.selectList("supplyMapper.selectSupplyList");
	}
	
}

package com.cl.cruella.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.DeptDto;
import com.cl.cruella.dto.MemberDto;

import lombok.RequiredArgsConstructor;



@Repository
@RequiredArgsConstructor
public class AppDao {
	
	private final SqlSessionTemplate sqlSession;
	
	
	public List<DeptDto> ajaxJstree(){
		return sqlSession.selectList("appMapper.ajaxJstree");
	}
	
	public DeptDto formDraftPage(String userNo) {
		return sqlSession.selectOne("appMapper.formDraftPage",userNo);
	}
	
	
	

}

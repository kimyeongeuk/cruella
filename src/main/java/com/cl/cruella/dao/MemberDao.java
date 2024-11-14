package com.cl.cruella.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDao {

	private final SqlSessionTemplate sqlSession;
	
	public MemberDto selectMember(MemberDto m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}
	
}

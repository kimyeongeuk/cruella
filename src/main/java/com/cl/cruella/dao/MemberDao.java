package com.cl.cruella.dao;

import java.util.HashMap;
import java.util.Map;

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
	
	public int resetPwd(String newPwd, String memNo) {
		
	    Map<String, Object> params = new HashMap<>();
	    params.put("newPwd", newPwd);
	    params.put("memNo", memNo);
		
		return sqlSession.update("memberMapper.resetPwd", params);
	}
	
}

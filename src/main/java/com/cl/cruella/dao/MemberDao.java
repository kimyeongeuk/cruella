package com.cl.cruella.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.MemberDto;

import jakarta.websocket.Session;
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

	public int insertMember(MemberDto m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public List<MemberDto> selectTeamList(MemberDto m) {
		return sqlSession.selectList("memberMapper.selectTeamList", m);
	}
	
	public MemberDto checkEmail(String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}
	
	public void updatePwd(String email, String str) {
		
		Map<String, String> params = new HashMap<>();
		params.put("str", str);
		params.put("email", email);
		
		sqlSession.update("memberMapper.updatePwd", params);
	}

	public String memberNo() {
		return sqlSession.selectOne("memberMapper.selectMemNo");
	}

	public int updateProfileImg(MemberDto m) {
		return sqlSession.update("memberMapper.updateProfileImg", m);
	}
}

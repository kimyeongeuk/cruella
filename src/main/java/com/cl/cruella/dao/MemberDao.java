package com.cl.cruella.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.PageInfoDto;
import com.cl.cruella.dto.VacationDto;

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

		int result =  sqlSession.insert("memberMapper.insertMember", m);
		if(result > 0) {
			result = 0;
			result = sqlSession.insert("memberMapper.chatProfile", m);
		}
		return result;
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
	
	public int saveSignPath(MemberDto m) {
		return sqlSession.update("memberMapper.saveSignPath", m);
	}

	public int getMemberCount() {
		return sqlSession.selectOne("memberMapper.getMemberCount");
	}

	public List<MemberDto> getPagedMemberList(PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit() , pi.getBoardLimit());		
		return sqlSession.selectList("memberMapper.getPagedMemberList",null, rowBounds);
	}

	public MemberDto selectMemberByNo(String memNo) {
		return sqlSession.selectOne("memberMapper.selectMember", memNo);
	}

	public int updateMember(MemberDto m) {
		return sqlSession.update("memberMapper.updateMember", m);
	
	}
	public List<MemberDto> selectAllMember(String memNo) {
		return sqlSession.selectList("memberMapper.selectAllMember", memNo);
	}

	public int updateProfileImg(MemberDto targetMember) {
		return sqlSession.update("memberMapper.updateProfileImg", targetMember);
	}
	
	public List<AppdocDto> selectVacList(Map<String, Object> params) {
        PageInfoDto pi = (PageInfoDto) params.get("pi");
        RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
        return sqlSession.selectList("memberMapper.selectVacList", params, rowBounds);
	}
	
	public int selectVacListCount(String memNo) {
		return sqlSession.selectOne("memberMapper.selectVacListCount", memNo);
	}
	

}



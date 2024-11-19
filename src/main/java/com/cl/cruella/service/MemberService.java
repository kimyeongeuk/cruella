package com.cl.cruella.service;

import java.util.List;

import com.cl.cruella.dto.MemberDto;


public interface MemberService {
	
	// 로그인
	MemberDto selectMember(MemberDto m);

	// 비밀번호 변경
	int resetPwd(String newPwd, String memNo);
	
	// 나의 소속팀 전체 리스트
	List<MemberDto> selectTeamList(MemberDto m);
	
	// 등록된 이메일 조회
	MemberDto checkEmail(String email);
	
	// 임시 비밀번호로 수정
	void updatePwd(String email, String str);
	
	
	
}

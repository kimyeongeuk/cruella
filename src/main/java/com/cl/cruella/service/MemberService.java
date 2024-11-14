package com.cl.cruella.service;

import com.cl.cruella.dto.MemberDto;


public interface MemberService {
	
	// 로그인
	MemberDto selectMember(MemberDto m);

	// 비밀번호 변경
	int resetPwd(String newPwd, String memNo);
}

package com.cl.cruella.service;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.MemberDao;
import com.cl.cruella.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	final MemberDao memberDao;
	
	@Override
	public MemberDto selectMember(MemberDto m) {
		return memberDao.selectMember(m);
	}

	@Override
	public int resetPwd(String newPwd, String memNo) {
		return memberDao.resetPwd(newPwd, memNo);
	}

}

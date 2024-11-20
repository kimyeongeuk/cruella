package com.cl.cruella.service;

import java.util.List;

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

	@Override
	public List<MemberDto> selectTeamList(MemberDto m) {
		return memberDao.selectTeamList(m);
	}

	@Override
	public MemberDto checkEmail(String email) {
		return memberDao.checkEmail(email);
	}

	@Override
	public void updatePwd(String email, String str) {
		memberDao.updatePwd(email, str);
	}

		@Override	
	public int insertMember(MemberDto m) {
		return memberDao.insertMember(m);

	}

		@Override
		public String memberNo() {
			return memberDao.memberNo();
		}

}

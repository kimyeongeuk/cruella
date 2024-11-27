package com.cl.cruella.service;

import java.util.List;
import java.util.Map;

import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.PageInfoDto;


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
	

	// 회원등록
	int insertMember(MemberDto m);
	
	// 사번등록
	String memberNo();

	// 전자서명 저장
	int saveSignPath(MemberDto m);

	// 사원조회
	int getMemberCount();
	List<MemberDto> getPagedMemberList(PageInfoDto pi);

	MemberDto selectMemberByNo(String memNo);

	// 사원정보수정
	int updateMember(MemberDto m);
	
	// 전체사원조회(사번, 이름, 메일, 사진)
	List<MemberDto> selectAllMember(String memNo);
	
	// 직원등록시 급여테이블에 insert될 정보
	int insertPayment(MemberDto m);

	// 급여테이블직원리스트불러오기
	List<MemberDto> salarypaymentList();
	
	// 휴가내역 조회
	int selectVacListCount(String memNo); // 리스트카운트
	List<AppdocDto> selectVacList(Map<String, Object> params);
	








	
}

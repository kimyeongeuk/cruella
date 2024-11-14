package com.cl.cruella.service;

import java.util.List;

import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.NoticeDto;


public interface NoticeService {
	
	// 게시글 목록 조회 (페이징 처리)
	
	
	// 게시글 검색 조회 (페이징 처리)
	
	
	// 게시글 등록
	int insertNotice(NoticeDto n);
	
	// 게시글 상세 - 조회수 증가
	int updateIncreaseCount(int NoticeNo);
	
	// 게시글 상세 - 게시글 조회
	NoticeDto selectNotice(int NoticeNo);
	
	// 게시글 삭제
	int deleteNotice(int noticeNo);
	
	// 게시글 수정
	List<AttachDto> selectDelAttach(String[] delFileNo);
	int updateNotice(NoticeDto n, String[] delFileNo);
	


}

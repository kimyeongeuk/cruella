package com.cl.cruella.service;

import java.util.List;

import com.cl.cruella.dto.MemoDto;

public interface MemoService {
	
	// 메모 리스트 조회
	List<MemoDto> selectMemoList(String memNo);

	// 메모 작성
	int insertMemo(MemoDto memo);
}

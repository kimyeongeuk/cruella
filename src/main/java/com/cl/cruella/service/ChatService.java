package com.cl.cruella.service;

import java.util.List;

import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;

public interface ChatService {
	
	// 채팅방 목록 불러오기
	List<ChatDto> chatList(String memNo);
	// 채팅 프로필 불러오기
	List<ChatProfileDto> chatProFileList();
	// 사원 목록 불러오기
	List<MemberDto> memberList();
	// 채팅방 인원수 세기
	
	
	
	
	
	
}

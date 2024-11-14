package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.ChatDao;
import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{

	
	private final ChatDao chatDao;
	
	
	@Override
	public List<ChatDto> chatList(String memNo) {
		return chatDao.chatList(memNo);
	}
	@Override
	public List<ChatProfileDto> chatProFileList() {
		return chatDao.chatProFileList();
	}

	@Override
	public List<MemberDto> memberList() {
		return chatDao.memberList();
	}


}

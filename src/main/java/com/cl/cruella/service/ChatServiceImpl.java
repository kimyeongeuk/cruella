package com.cl.cruella.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dto.ChatListDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;

@Service
public class ChatServiceImpl implements ChatService{

	@Override
	public List<ChatListDto> chatList(int memNo) {
		return null;
	}

	@Override
	public List<MemberDto> memberList() {
		return null;
	}

	@Override
	public List<ChatProfileDto> chatProFileList() {
		return null;
	}

}

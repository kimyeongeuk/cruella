package com.cl.cruella.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.ChatDao;
import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatListDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.MessageDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{

	
	private final ChatDao chatDao;
	
	
	@Override
	public List<ChatDto> chatList(String memNo) {
		List<ChatDto> list = chatDao.chatList(memNo);
		
		if(!list.isEmpty()) {
			for(int i =0;i<list.size();i++) {
				list.get(i).setChatCount(chatDao.chatCount(list.get(i).getChatNo()));
			}
		}
		
		return list;
	}
	@Override
	public List<ChatProfileDto> chatProFileList() {
		return chatDao.chatProFileList();
	}

	@Override
	public List<MemberDto> memberList() {
		return chatDao.memberList();
	}
	public MemberDto memberInfo(String memNo) {
		return chatDao.memberInfo(memNo);
	}
	public ChatProfileDto chatProFileInfo(String memNo) {
		return chatDao.chatProFileInfo(memNo);
	}
	public List<MessageDto> messageList(int chatNo) {
		return chatDao.messageList(chatNo);
	}
	
	public int chatCount(int chatNo) {
		return chatDao.chatCount(chatNo);
	}
	public int insertMessage(MessageDto messageDto) {
		
		return chatDao.insertMessage(messageDto);

	}
	public int updateNewMsg(MessageDto messageDto) {
		return chatDao.updateNewMsg(messageDto);
	}
	public int startChat(Map<String, Object> map) {
		int result = chatDao.startChat(map);
			if(result >0) {
				List<MemberDto> list = (List<MemberDto>)map.get("list3");
				for(int i =0;i<list.size();i++) {
					result = chatDao.insertChatList(list.get(i));
				}
			}
			
		
		
		return result;
	}
	public String checkChatList(List<String> list) {
		return chatDao.checkChatList(list);
	}
	
	public List<ChatDto> chatInfo(Map<String, Object> map2) {
		List<MemberDto> list = (List<MemberDto>)map2.get("list3");
		List<ChatDto> cl = new ArrayList<>();
		for(int i =0;i<list.size();i++) {
			cl.addAll(chatDao.chatInfo(list.get(i)));
		}
		
		return cl;
	}
	
	public ChatDto chatTitle(int chatNo) {
		return chatDao.chatTitle(chatNo);
	}
	
	public List<MemberDto> chatUserList(int chatNo) {
		return chatDao.chatUserList(chatNo);
	}
	public int msgNum() {
		return chatDao.msgNum();
	}
	public int deleteMsg(int msgNo) {
		return chatDao.deleteMsg(msgNo);
	}



}

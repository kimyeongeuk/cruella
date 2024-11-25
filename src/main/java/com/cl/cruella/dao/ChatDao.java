package com.cl.cruella.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatListDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.MessageDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ChatDao {
	
	private final SqlSessionTemplate sqlSession;

	public List<ChatDto> chatList(String memNo) {
		return sqlSession.selectList("chatMapper.chatList",memNo);
	}

	public List<ChatProfileDto> chatProFileList() {
		return sqlSession.selectList("chatMapper.chatProFileList");
	}

	public List<MemberDto> memberList() {
		return sqlSession.selectList("chatMapper.memberList");
	}
	
	public int chatCount(int chatNo) {
		return sqlSession.selectOne("chatMapper.chatCount",chatNo);
	}

	public MemberDto memberInfo(String memNo) {
		return sqlSession.selectOne("chatMapper.memberInfo",memNo);
	}

	public ChatProfileDto chatProFileInfo(String memNo) {
		return sqlSession.selectOne("chatMapper.chatProFileInfo",memNo);
	}

	public List<MessageDto> messageList(int chatNo) {
		return sqlSession.selectList("chatMapper.messageList",chatNo);
	}

	public int insertMessage(MessageDto messageDto) {
		return sqlSession.insert("chatMapper.insertMessage",messageDto);
	}


	public int updateNewMsg(MessageDto messageDto) {
		return sqlSession.update("chatMapper.updateNewMsg",messageDto);
	}

	public int startChat(Map<String, Object> map) {
		return sqlSession.insert("chatMapper.startChat",map);
	}

	public int insertChatList(MemberDto m) {
		return sqlSession.insert("chatMapper.insertChatList",m);
	}

	public String checkChatList(List<String> list) {
		return sqlSession.selectOne("chatMapper.checkChatList",list);
	}

	public List<ChatDto> chatInfo(MemberDto cd) {
		return sqlSession.selectList("chatMapper.chatInfo",cd);
	}

	public ChatDto chatTitle(int chatNo) {
		return sqlSession.selectOne("chatMapper.chatTitle",chatNo);
		 
	}

	public List<MemberDto> chatUserList(int chatNo) {
		return sqlSession.selectList("chatMapper.chatUserList",chatNo);
	}

	public int msgNum() {
		return sqlSession.selectOne("chatMapper.msgNum");
	}

	public int deleteMsg(int msgNo) {
		return sqlSession.update("chatMapper.deleteMsg",msgNo);
	}

	public int changeNewMsg(int chatNo) {
		return sqlSession.update("chatMapper.changeNewMsg",chatNo);
	}
	

}

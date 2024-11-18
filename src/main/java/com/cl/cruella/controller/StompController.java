package com.cl.cruella.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.cl.cruella.dto.MessageDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StompController {

	
	private final SimpMessagingTemplate template; // 특정 broker로 메시지를 전달
	
	@MessageMapping("/chat/enter")
	public void enter(MessageDto message){
		
		log.debug("Message : {}",message.getMsgContent());
		message.setMsgContent(message.getMemNo() + "님이 채팅방에 입장하였습니다.");
		template.convertAndSend("/sub/chat/chatNo/" + message.getChatNo(), message);
		
	}
	
	@MessageMapping("/chat/message")
	public void message(MessageDto message) {
		template.convertAndSend("/sub/chat/chatNo/" + message.getChatNo(), message);
	}
	
	
	
	
}

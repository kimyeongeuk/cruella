package com.cl.cruella.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.MessageDto;
import com.cl.cruella.service.ChatServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StompController {

	
	private final SimpMessagingTemplate template; // 특정 broker로 메시지를 전달
	private final ChatServiceImpl chatserviceImpl;
	
	/*
	@MessageMapping("/chat/enter")
	public void enter(MessageDto message,ChatDto chat,MemberDto m){
		

		message.setMsgContent(m.getMemName() + "님이 채팅방에 입장하였습니다.");
		template.convertAndSend("/sub/chat/chatNo/" + message.getChatNo(), message);
		
	}
	
	@MessageMapping("/chat/message")
	public void message(MessageDto message) {
		log.debug("Message111 : {}",message);
		template.convertAndSend("/sub/chat/chatNo/" + message.getChatNo(), message); // 전달받은 메시지를 여기로 전송
	}
	*/
	
	@MessageMapping("/{chatNo}")
	@SendTo("/sub/{chatNo}")
	public MessageDto message(@DestinationVariable String chatNo, @RequestBody MessageDto messageDto, @RequestBody MemberDto member) throws ParseException {
		
		
		if(messageDto.getMsgType().equals("message")) {
			// 채팅방 인원수 확인
			int chatCount = chatserviceImpl.chatCount(messageDto.getChatNo());
			if(chatCount > 0) {
				// 날짜처리
				String isoDate  = messageDto.getMsgRegistDate();
				SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
				isoFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
				Date date = isoFormat.parse(isoDate);
				SimpleDateFormat desiredFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				desiredFormat.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
				String formattedDate = desiredFormat.format(date);
				messageDto.setMsgRegistDate(formattedDate);
				messageDto.setMsgCheck(chatCount-1);
				// 메시지 인서트
				int result = chatserviceImpl.insertMessage(messageDto);	            
				
			}
		}
		
		return messageDto;
	}
	
	@MessageMapping("/chat/enter")
	public void broadcastMessage(@RequestBody MessageDto messageDto) throws ParseException {
		
		
	}
	
	
	
}

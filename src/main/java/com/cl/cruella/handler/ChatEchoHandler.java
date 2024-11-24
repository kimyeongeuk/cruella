package com.cl.cruella.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.ChatServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class ChatEchoHandler extends TextWebSocketHandler{
	
	
	private Map<String,WebSocketSession> map = new HashMap<>();
	private final ChatServiceImpl chatServiceImpl;
	
	/**
	 * 1) afterConnectionEstablished : 웹소켓에 클라이언트가 연결되었을 때 처리할 내용 정의
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		String memNo = session.getUri().getQuery();
		map.put(memNo,session);
		
		
	
	}

	
	/**
	 * 2) handlerMessage : 웹소켓으로 데이터(텍스트, 파일 등)가 전송되었을 경우 처리할 내용 정의
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log.debug("========== 메세지 들어옴 =========");
		log.debug("WebSocketSession 객체: {}",session);
		log.debug("WebsocketMessage 객체 : {}",message);
		log.debug("메세지 내용 : {}", message.getPayload());
	    
		String loginUser = ((MemberDto)session.getAttributes().get("loginUser")).getMemNo();
		WebSocketSession mySession = map.get(loginUser); // 내 세션 찾기
	    String payload = (String) message.getPayload();
	    JSONObject jsonObject = new JSONObject(payload); 
	    String memNo = jsonObject.getString("memNo");
	    String inviteNo = jsonObject.getString("inviteNo");
	    String inviteName = jsonObject.getString("inviteName");
	    
	    /**
	     * 내가 원하는 대상에게만 보낼 메시지
	     */
	    List<String> targetMemNo = new ArrayList<>();
	    
	    targetMemNo.add(memNo);
	    targetMemNo.add(inviteNo);
	    
	    log.debug("memNo 객체 : {}",memNo);
	    log.debug("inviteNo 객체 : {}",inviteNo);
	    log.debug("inviteName 객체 : {}",inviteName);

	    	Map<String,Object> map2 = new HashMap<>();
	  		List<String> list2 = new ArrayList<>();
	  		
	  		list2.add(memNo);
	  		list2.add(inviteNo);
	  		
	  		map2.put("memNo", memNo);
	  		map2.put("inviteNo", inviteNo);
	  		map2.put("inviteName",inviteName);
	  		map2.put("list", list2);
	  		
	  		String result = chatServiceImpl.checkChatList(list2);
	  		
	  		System.out.println(result);
	  		if(result == null) { // 널일경우 채팅방 생성
	  			result = String.valueOf(chatServiceImpl.startChat(map2)); // 값은 1로담김
	  			if(result.equals("1")) {
	  				// 채팅방 번호랑 채팅방 제목 담아오기
	  				ChatDto cd = chatServiceImpl.chatInfo();
	  				ObjectMapper objectMapper = new ObjectMapper();
	  		        String cdJson = objectMapper.writeValueAsString(cd); 
		  			for(String target : targetMemNo) {
		  				WebSocketSession targetSession = map.get(target);
		  				if (targetSession != null) {
		  					targetSession.sendMessage(new TextMessage(cdJson));
		  				}
		  			}
	  			}
	  		}else { // 이미 존재하는 채팅방일경우
	  			mySession.sendMessage(new TextMessage("0"));
	  		}
	  		
	  		
	    
	    
	    

	
		
	}
	
	/*
	 * 3) afterConnectionClosed : 웹소켓에 클라이언트가 연결이 끊겼을 때 처리할 내용 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		String loginUser = ((MemberDto)session.getAttributes().get("loginUser")).getMemNo();
		map.remove(loginUser);
		 
		
		
	}
	

}

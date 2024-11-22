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

import com.cl.cruella.service.ChatServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class ChatEchoHandler extends TextWebSocketHandler{
	
	
	// 웹소켓 세션 객체(클라이언트)들을 저장하는 리스트
	private Map<String,Object> map = new HashMap<>();
	private final ChatServiceImpl chatServiceImpl;
	
	/**
	 * 1) afterConnectionEstablished : 웹소켓에 클라이언트가 연결되었을 때 처리할 내용 정의
	 * 
	 * @param session - 현재 웹소켓과 연결된 클라이언트 객체 (즉, 채팅방에 접속된 클라이언트)
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/*
		log.debug("========== websocket 연결됨 ==========");
		log.debug("webSocketSession 객체 : {}", session);
		log.debug("session id : {}",session.getId());
		log.debug("session Attributes: {}",session.getAttributes()); // {sessionId=xxxx,..}
		log.debug("현재 채팅방에 참가한 로그인한 회원 : {}",session.getAttributes().get("loginUser"));
		*/
		
		map.put("session", session);
		
		//for(WebSocketSession sss : sessionList) {
			//String msg = "entry|"+ ((MemberDto)session.getAttributes().get("loginUser")).getUserId()+"님이 입장하였습니다.";
			//sss.sendMessage(new TextMessage(msg));
		//}
		
	}

	
	/**
	 * 2) handlerMessage : 웹소켓으로 데이터(텍스트, 파일 등)가 전송되었을 경우 처리할 내용 정의
	 * 
	 * @param session - 현재 웹소켓으로 데이터를 전송한 클라이언트 객체
	 * @param message - 전송된 데이터에 대한 정보를 가지고 있는 객체
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log.debug("========== 메세지 들어옴 =========");
		log.debug("WebSocketSession 객체: {}",session);
		log.debug("WebsocketMessage 객체 : {}",message);
		log.debug("메세지 내용 : {}", message.getPayload());
	    
		
	    String payload = (String) message.getPayload();
	    JSONObject jsonObject = new JSONObject(payload); 
	    String memNo = jsonObject.getString("memNo");
	    String inviteNo = jsonObject.getString("inviteNo");
	    String inviteName = jsonObject.getString("inviteName");
	    
	    
	    log.debug("memNo 객체 : {}",memNo);
	    log.debug("inviteNo 객체 : {}",inviteNo);
	    log.debug("inviteName 객체 : {}",inviteName);
	    
	    
//	    	Map<String,Object> map = new HashMap<>();
//		
//	  		List<String> list = new ArrayList<>();
//	  		
//	  		list.add(memNo);
//	  		list.add(inviteNo);
//	  		
//	  		map.put("memNo", memNo);
//	  		map.put("inviteNo", inviteNo);
//	  		map.put("inviteName",inviteName);
//	  		map.put("list", list);
//	  		
//	  		String result = chatServiceImpl.checkChatList(list);
//	  		
//	  		System.out.println(result);
//	  		if(result == null) { // 널일경우 채팅방 생성
//	  			result = String.valueOf(chatServiceImpl.startChat(map)); // 값은 1로담김
//	  		}
	  		
	    
	    
	    
		// 현재 해당 웹소켓에 연결되어있는 모든 클라이언트들(작성자본인포함)에게 현재 들어온 메세지 재발송
		
			System.out.println(map.get("session"));
		
		
		
		// 특정 회원과 채팅방을 만든다거나 해당 회원과 나눈 채팅내역을 보존한다거나 하려면
		// 메세지 발송할때 마다 DB에 기록 해야됨
		// 해당 클래스에 Service 클래스를 DI 해서 채팅메세지를 insert하는 메소드를 여기서 실행하면됨
	
		
	}
	
	/*
	 * 3) afterConnectionClosed : 웹소켓에 클라이언트가 연결이 끊겼을 때 처리할 내용 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/*
		log.debug("========== websocket 연결끊김 ==========");
		log.debug("WebSocketSession 객체 : {}",session);
		log.debug("session id : {}",session.getId());
		log.debug("현재 채팅방에서 나간 회원 : {}",session.getAttributes().get("loginUser"));
		*/
		
		 sessionList.remove(session);
		
		//for(WebSocketSession sss : sessionList) {
			//String msg = "exit|"+ ((MemberDto)session.getAttributes().get("loginUser")).getUserId()+"님이 퇴장하였습니다.";
			//sss.sendMessage(new TextMessage(msg));
		//}
		
		
	}
	

}

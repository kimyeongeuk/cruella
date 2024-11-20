package com.cl.cruella.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.MessageDto;
import com.cl.cruella.service.ChatServiceImpl;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
@Slf4j
public class ChatController {
	
	private final ChatServiceImpl chatServiceImpl;
	
	
	// 채팅방 목록 띄우기
	@GetMapping("/chatPage.do")
	public void chatPage(HttpSession session, Model model) {

		// 로그인 유저 번호 가져오기
		String memNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();

		// 채팅방 목록
		List<ChatDto> chatList = chatServiceImpl.chatList(memNo);
		// 사원 프로필상태
		List<ChatProfileDto> chatProfileList = chatServiceImpl.chatProFileList();
		// 사원 목록
		List<MemberDto> memberList = chatServiceImpl.memberList();
		// 채팅방 인원 체크
		
		model.addAttribute("chatList",chatList);
		model.addAttribute("chatProfileList",chatProfileList);
		model.addAttribute("memberList",memberList);

	}
	
	
	// 사원 상세 정보
	@ResponseBody
	@GetMapping(value="/userInfo.do",produces="application/json")
	public Map<String,Object>  userInfo(String memNo,Model model) {
		
		log.debug(memNo);
		// 해당 인원의 정보
		MemberDto m = chatServiceImpl.memberInfo(memNo);
		// 해당 인원의 프로필 정보
		ChatProfileDto cp = chatServiceImpl.chatProFileInfo(memNo);
		

		
		Map<String,Object> map = new HashMap<>();
		map.put("m", m);
		map.put("cp", cp);
		
		
		return map;
		
}
	
	
	// 채팅 메시지 리스트 불러오기
	@ResponseBody
	@GetMapping(value="/list.do",produces="application/json")
	public Map<String,Object> chatList(int chatNo,String memNo) {
		// 채팅리스트 불러오기
		List<MessageDto> msgList = chatServiceImpl.messageList(chatNo);
		
		Map<String,Object> map = new HashMap<>();
		map.put("m", memNo);
		map.put("msg", msgList);
		
		return map;
	}
	
	
	@GetMapping(value="/updateNewMsg.do",produces="application/json")
	public void updateNewMsg(MessageDto message) {
		
		log.debug("messagedd체크체크췤: {}",message);
		
		int result = chatServiceImpl.updateNewMsg(message);
		
		
	}
	
	
	
	
	
	
	

}

package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatProfileDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.ChatServiceImpl;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	
	private final ChatServiceImpl chatServiceImpl;
	
	
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
		
		model.addAttribute("chatList",chatList);
		model.addAttribute("chatProfileList",chatProfileList);
		model.addAttribute("memberList",memberList);
		
	}

}

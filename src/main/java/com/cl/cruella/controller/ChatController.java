package com.cl.cruella.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.ChatDto;
import com.cl.cruella.dto.ChatListDto;
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
		
	    Date today = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String todayDate = sdf.format(today);

	    // 채팅방 날짜 포맷 적용
	    for(ChatDto cd : chatList) {
	        String chatDate = sdf.format(cd.getChatRegistDate());
	        // chatDate를 비교하여 필요한 날짜 포맷을 설정 
	        if (chatDate.substring(0, 10).equals(todayDate.substring(0, 10))) {
	           
	            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
	            cd.setStrDate(timeFormat.format(cd.getChatRegistDate()));  
	        } else {
	            
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            cd.setStrDate(dateFormat.format(cd.getChatRegistDate()));  
	        }
	    }
	    
	    
	    
		System.out.println(chatList);
		model.addAttribute("chatList",chatList);
		model.addAttribute("chatProfileList",chatProfileList);
		model.addAttribute("memberList",memberList);

	}
	
	
	// 사원 상세 정보
	@ResponseBody
	@GetMapping(value="/userInfo.do",produces="application/json ")
	public Map<String,Object>  userInfo(String memNo,Model model) {
		
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
		// 채팅 제목 불러오기
		ChatDto chatTitle = chatServiceImpl.chatTitle(chatNo);
		Map<String,Object> map = new HashMap<>();
		map.put("m", memNo);
		map.put("msg", msgList);
		map.put("title",chatTitle);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping(value="/updateNewMsg.do",produces="application/json")
	public int updateNewMsg(MessageDto message) {
		
		// 메시지 번호 가져오기
		message.setMsgNo(chatServiceImpl.msgNum());
		int result = chatServiceImpl.updateNewMsg(message);
		
		
		return result;
		
	}
	
	@ResponseBody
	@GetMapping(value="/chatuserlist.do",produces="application/json")
	public List<MemberDto> chatUserList(int chatNo) {
		
		// 채팅방 유저 조회
		List<MemberDto> chatUserList = chatServiceImpl.chatUserList(chatNo);
		return chatUserList;
		
	}
	
	@ResponseBody
	@GetMapping(value="/msgNum.do",produces="application/json")
	public int msgNum() {
		
		
		int result = chatServiceImpl.msgNum();
		log.debug("번호 : {}",result);
		return result;
		
	}
	
	@ResponseBody
	@GetMapping(value="/lock.do",produces="application/json")
	public ResponseEntity<Map<String, String>> chatLock(ChatListDto msgDto) {
		String result = "";
		if(msgDto.getType().equals("a")) {
			result = chatServiceImpl.chatLock(msgDto);			
		}else {
			System.out.println(msgDto);
			int result2 = chatServiceImpl.chatLockUpdate(msgDto);
		}
	    Map<String, String> response = new HashMap<>();
	    response.put("lock", result); // 'Y' 또는 'N' 값을 'lockStatus' 키로 추가
	    return ResponseEntity.ok(response);

		
	}
	
	@ResponseBody
	@GetMapping(value="/titleChange.do",produces="application/json")
	public int titleChange(ChatListDto msgDto) {

		int result = chatServiceImpl.titleChange(msgDto);
		
		
		return result;
		
	}
	
	
	

	
	
	

}

package com.cl.cruella.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.MemberService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	private final MemberService memberService;
	
	@PostMapping("/signin.do")
	public String signin(MemberDto m
								 , HttpSession session
								 , HttpServletResponse response) throws IOException {	// memNo = '입력한 아이디', memPwd = '입력한 비밀번호'
		
		MemberDto loginUser = memberService.selectMember(m);	
		
		System.out.println(loginUser);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		if(loginUser != null) {	// 추후에 암호화된 비밀번호도 함께 비교할 예정
			
			session.setAttribute("loginUser", loginUser); // 세션에 로그인 한 회원 정보 담기
			
			out.println("alert('" + loginUser.getMemName() + "님 환영합니다');");
			
		}else {
			return "/";
		}
		out.println("</script>");
		
		return "/dashboard";
		
	}
	 @GetMapping("/employeelistview.do")
	public void salarypayment() {}

}

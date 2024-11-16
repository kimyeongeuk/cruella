package com.cl.cruella.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
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
	
	// 로그인(김동규)
	@PostMapping("/signin.do")
	public String signin(MemberDto m
								 , HttpSession session
								 , HttpServletResponse response
								 , HttpServletRequest request) throws IOException {	// memNo = '입력한 아이디', memPwd = '입력한 비밀번호'
		
		MemberDto loginUser = memberService.selectMember(m);	
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(loginUser != null) {	// 추후에 암호화된 비밀번호도 함께 비교할 예정
			
			session.setAttribute("loginUser", loginUser); // 세션에 로그인 한 회원 정보 담기
			
			if(loginUser.getStatus().equals("A")) {	// 비밀번호 변경이 필요한 회원일 경우 변경 화면으로 (첫 로그인, 임시 비번 발급)
				return "/member/resetPwd";
			}
			
			return "/dashboard";
			
		}else {
	        out.println("<script>alert('로그인에 실패하였습니다. 다시 시도해주세요.');");
	        out.println("location.href='" + request.getContextPath() + "/';</script>");
	        out.close();
		}
		
		return null;
	}
	
	
	// 비밀번호변경(김동규)
	@PostMapping("/resetPwd.do")
	public String newPwdCheck(String newPwd, String memNo, HttpServletResponse response) throws IOException {
		

		int result = memberService.resetPwd(newPwd, memNo); // 비밀번호 변경 실행
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		if(result > 0) { // 변경 성공
			return "/member/pwdResetSuccess";
		}else {
			out.println("history.back();");
		}
		out.println("</script>");
		return "/";
	}
	 @GetMapping("/signup.do")
	public void salarypayment() {}
	 
	 @GetMapping("/myinfo.do")
	 public void myinfo() {}
	 
}

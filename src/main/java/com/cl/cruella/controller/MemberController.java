package com.cl.cruella.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
	private final JavaMailSender mailSender;
	
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

	 // 사원등록페이지로딩시사번자동생성(이예빈)
	 @GetMapping("/signup.do")
	 public void signup(Model model) {
		 String memNo = memberService.memberNo();
		 log.debug("log{}",memNo);
		 model.addAttribute("memNo",memNo);
	 }
	 

	
	// 사원등록(이예빈)
	@PostMapping("/insert.do")
	public String insertMember(MemberDto m, RedirectAttributes rd) {
		
		log.debug("memberDto{}",m);
		int result = memberService.insertMember(m);
		
		 return "/dashboard";

	}
	

	 @GetMapping("/myinfo.do")
	 public void myinfo() {}
	 
	 // 나의 팀 전체 리스트 조회(김동규)
	 @PostMapping("/teamList.do")
	 @ResponseBody
	 public List<MemberDto> teamList(MemberDto m) {
		 
		 List<MemberDto> list = memberService.selectTeamList(m);
		 
		 // System.out.println(list);
		 
		 return list;
		 
	 }
	 
	 @GetMapping("/findPwd.do")
	 public void findPwd() {};
	 
	 // 임시 비밀번호 발급(김동규)
	 @PostMapping("/sendCode.do")
	 @ResponseBody
	 public String sendCode(String email) {
		 
		 /* https://velog.io/@hellocdpa/220319-%EC%9E%84%EC%8B%9C%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8-
		 %EC%9D%B4%EB%A9%94%EC%9D%BC%EB%A1%9C-%EB%B3%B4%EB%82%B4%EB%8A%94-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84 */	// SMTP 참고 블로그
		 
		 // 1) 사용자가 입력한 이메일이 등록 되어있는지 
		 	MemberDto m = memberService.checkEmail(email); // 등록된 이메일이 있는지 조회
		 
		 	if(m != null) { // 등록된 이메일이 있을 경우
			 
		 // 2) 임시 비밀번호 생성 -> 해당 비밀번호로 회원정보 update
			 
		 	// 임시 비밀번호 생성
		 		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', 'A', 'B', 'C', 'D', 'E' };
			 
		 		String str = "";
			 
		 		int idx = 0;
			 
		 		for (int i = 0; i < 7; i++) {
				 idx = (int) (charSet.length * Math.random());
				 str += charSet[idx];
		 		}

			 memberService.updatePwd(email, str);	// 임시 비밀번호로 변경
		     
		 // 3) 메일 발송
			 SimpleMailMessage message = new SimpleMailMessage();	
			 
			 message.setTo(email);
			 message.setSubject("Cruella 임시 비밀번호 발급 메일입니다.");
			 message.setText("안녕하세요. 요청하신 임시비밀번호 안내 메일입니다. 회원님의 임시 비밀번호는  " + str + "  입니다."
	 					+ "해당 번호로 로그인 후 새로운 비밀번호로 변경 해주세요.");
			 message.setFrom("hiwinter99@gmail.com");
			 message.setReplyTo("hiwinter99@gmail.com");
			 mailSender.send(message);
			 
			 
			 return "YYY";
			 
		 }else {	// 등록된 이메일이 없을 경우
			 return "NNN";
		 }
		 
		 
	 }
	 
	 // 이메일 발송 성공 화면(김동규)
	 @GetMapping("/sentEmail.do")
	 public String sentEmail(String email, Model model) {
		 
		 model.addAttribute("email", email);
		 
		 return "/member/sentEmail";
	 };
	 
	 
	 
	 
}

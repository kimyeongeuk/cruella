package com.cl.cruella.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.service.MemberService;
import com.cl.cruella.service.WorkLogService;
import com.cl.cruella.util.FileUtil;

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
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;

	
	// 로그인(김동규)
	@PostMapping("/signin.do")
	public String signin(MemberDto m
								 , HttpSession session
								 , HttpServletResponse response
								 , HttpServletRequest request) throws IOException {	// memNo = '입력한 아이디', memPwd = '입력한 비밀번호'
		
		MemberDto loginUser = memberService.selectMember(m);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// System.out.println(m.getMemPwd()); 			
		// System.out.println(loginUser.getMemPwd());	 
		
		if(loginUser != null && bcryptPwdEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {	// 추후에 암호화된 비밀번호도 함께 비교할 예정(완료)
			
			String signPath = loginUser.getSignPath();
			
			String dataUrl = "data:image/png;base64," + signPath;
			
			loginUser.setSignPath(dataUrl); // 전자서명 경로 재인코딩
			
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
	
	// 로그아웃(김동규)
	@PostMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
	// 비밀번호변경(김동규)
	@PostMapping("/resetPwd.do")
	public String newPwdCheck(String newPwd, String memNo, HttpServletResponse response) throws IOException {
		
		

		int result = memberService.resetPwd(bcryptPwdEncoder.encode(newPwd), memNo); // 비밀번호 변경 실행
		
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

			 memberService.updatePwd(email, bcryptPwdEncoder.encode(str));	// 임시 비밀번호로 변경
		     
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
	 }
	 
	 // 전자서명 저장(김동규)
	 @PostMapping("/saveSign.do")
	 @ResponseBody
	 public String saveSign(MemberDto m, HttpSession session) {
		 
		 // Base64 데이터 추출
		 String base64Data = m.getSignPath().split(",")[1];

		 
		 m.setSignPath(base64Data);
		 	
		 int result = memberService.saveSignPath(m);
		 
		 if(result > 0) {
			 
	         // 세션의 loginUser의 signPath 업데이트
	         MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
	         loginUser.setSignPath("data:image/png;base64," + base64Data);
	         session.setAttribute("loginUser", loginUser);
		 
			 return "YYY";
		 }else {
			 return "NNN";
		 }
		 
	 }
	 
	 // 출근 버튼 클릭시(김동규)
	 @GetMapping("/checkIn")
	 public void checkIn() {
		 
	 }
	 

	 @GetMapping("/myinfo_workLog.do")
	 public void myinfoWorkLog() {}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 // 사원등록페이지로딩시사번자동생성(이예빈)
	 @GetMapping("/signup.do")
	 public void signup(Model model) {
		 String memNo = memberService.memberNo();
		 model.addAttribute("memNo",memNo);
	 }
	 

	
	// 사원등록(이예빈)
	@PostMapping("/insert.do")
	public String insertMember(MemberDto m, RedirectAttributes rd) {
		
		m.setMemPwd( bcryptPwdEncoder.encode(m.getMemPwd()) );
		
		int result = memberService.insertMember(m);
			
		if(result > 0) {
			rd.addFlashAttribute("alertMsg", "성공적으로 회원가입 되었습니다");
			
		}else {
			rd.addFlashAttribute("alertMsg", "회원가입실패");
	
		}
			 return "redirect:/member/employeelistview.do";
	
		}
	
	// 사원조회페이지로redirect(예빈)
	@GetMapping("/employeelistview.do")
	public void employeelistview(@RequestParam(value = "page", defaultValue = "1") int current, Model model) {
		int listCount = memberService.selectAll();
	}
	
	@PostMapping("/updateProfile.do")
	public String modifyProfile(@RequestParam("uploadFile") MultipartFile uploadFile, HttpSession session) {
		
		System.out.println("333333333333333");
		
	    // 현재 로그인한 회원 정보
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		System.out.println(loginUser);

	    // 현재 로그인한 회원의 기존 프로필 URL
	    String originalProfileURL = loginUser.getProfileURL();

	    // 파일 업로드 처리
	    Map<String, String> map = fileUtil.fileupload(uploadFile, "profile");

	    // 새 프로필 URL 설정
	    loginUser.setProfileURL(map.get("filePath") + "/" + map.get("filesystemName"));

	    // DB 업데이트
	   // System.out.println("가공해서 새로 저장한 경로 " + loginUser.getProfileURL());
	    int result = memberService.updateProfileImg(loginUser);

		if(result > 0) {
			// 성공시 => 기존 프로필이 존재했을 경우 파일 삭제
			if(originalProfileURL != null) {
				new File(originalProfileURL).delete();
			}
			return "SUCCESS";
		}else {
			// 실패시 => 변경요청시 전달된 파일 삭제
			new File(loginUser.getProfileURL()).delete();
			loginUser.setProfileURL(originalProfileURL);
			return "FAIL";
		}
		
	}
	
	// 회원정보수정/탈퇴 (이예빈)
	@GetMapping("/modifydelete.do")
	public void modifydelete() {}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 출퇴근조회(이예빈)
	@GetMapping("/checkinrecordview.do")
	public void checkinrecodeview() {}
	
	// 근무시간조회(이예빈)
	@GetMapping("/workhoursview.do")
	public void workhoursview() {}

	
	

	 
}

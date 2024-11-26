package com.cl.cruella.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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

import com.cl.cruella.dto.AppdocDto;
import com.cl.cruella.dto.BoardDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.PageInfoDto;
import com.cl.cruella.service.AppService;
import com.cl.cruella.service.BoardService;
import com.cl.cruella.service.MemberService;
import com.cl.cruella.util.FileUtil;
import com.cl.cruella.util.PagingUtil;

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
	private final PagingUtil pagingUtil;
	private final BoardService boardService;
	private final AppService appService;

	
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
	 
	 // 근태관리 탭 클릭
	 @GetMapping("/myinfo_workLog.do")
	 public void myinfoWorkLog() {}
	 
	 // 내정보 - 팀게시판리스트 조회
	 @PostMapping("/boardList.do")
	 @ResponseBody
     public Map<String, Object> boardList(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model, HttpSession session) {
		 
         MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");

         String deptCode = loginUser.getDeptCode();
        

         int listCount = boardService.selectBoardListCount(deptCode);

         PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);

         Map<String, Object> params = new HashMap<>();
         params.put("pi", pi);
         params.put("deptCode", deptCode);

         List<BoardDto> list = boardService.selectBoardList(params);
         params.put("list", list);

         

         return params;
     }
	 
	 // 대시보드 - 공지사항 조회
	 @PostMapping("/noticeList.do")
	 @ResponseBody
	 public Map<String, Object> list(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model, HttpSession session){
		 
         MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");

         String deptCode = loginUser.getDeptCode();
        

         int listCount = boardService.selectBoardListCount(deptCode);

         PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);

         Map<String, Object> params = new HashMap<>();
         params.put("pi", pi);
         params.put("deptCode", deptCode);

         List<BoardDto> list = boardService.selectBoardList(params);
         params.put("list", list);

         

         return params;		 
	 }
	 
	 
	 // 전 사원 정보 조회(이름, 메일, 사번, 사진)
	 @PostMapping("/selectAll_db.do")
	 @ResponseBody
	 public List<MemberDto> selectAllMember(String memNo) {
		 
		 List<MemberDto> list = memberService.selectAllMember(memNo);
		 
		 return list;
	 }
	 
	 // 내 결재 문서함 조회
	 @PostMapping("/selectAppList.do")
	 @ResponseBody
	 public Map<String, Integer> selectAppList(String memNo) {
		 
	     // 상태별 개수를 저장할 Map
	     Map<String, Integer> statusCounts = new HashMap<>();
	     statusCounts.put("A", appService.selectStandbyCount(memNo));  // 대기
	     statusCounts.put("B", appService.selectProgressCount(memNo)); // 진행
	     statusCounts.put("C", appService.selectSuccessCount(memNo));  // 완료
	     
	     return statusCounts;
	 }
	 
	 // 휴가 신청 목록 조회
	 @PostMapping("/vacList.do")
	 @ResponseBody
	 public Map<String, Object> selectVacList(String memNo, @RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		 
		 
		 int listCount = memberService.selectVacListCount(memNo);
		 
		 PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		 
         Map<String, Object> params = new HashMap<>();
         params.put("pi", pi);
         params.put("memNo", memNo);
         

         List<AppdocDto> list = memberService.selectVacList(params);
         params.put("list", list);
         return params;
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 // 사원등록페이지로딩시사번자동생성(이예빈)
	 @GetMapping("/signup.do")
	 public void signup(Model model) {
		 String memNo = memberService.memberNo();
		 String memPwd = "111111";
		 model.addAttribute("memNo",memNo);
		 model.addAttribute("memPwd",memPwd);
	 }
	 

	
	// 사원등록(이예빈)
	@PostMapping("/insert.do")
	public String insertMember(MemberDto m, RedirectAttributes rd, @RequestParam("uploadFile") MultipartFile uploadFile) {
		
		if( m.getMemPwd()== null) {
			m.setMemPwd("111111");
		}
		
		m.setMemPwd( bcryptPwdEncoder.encode(m.getMemPwd()) );
		
		// 파일 업로드 처리
		
	    if (!uploadFile.isEmpty()) {
	        // 파일 업로드 수행
	        Map<String, String> map = fileUtil.fileupload(uploadFile, "profile");
	        String filePath = map.get("filePath") + "/" + map.get("filesystemName");

	        // MemberDto에 프로필 URL 설정
	        m.setProfileURL(filePath);
	    } else {
	        m.setProfileURL(null); // 파일이 없을 경우 null로 설정
	    }
		
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
	public String employeelistview(
	    @RequestParam(value = "page", defaultValue = "1") int currentPage,
	    Model model
	) {
	    // 1. 전체 사원 수 가져오기
	    int listCount = memberService.getMemberCount();

	    // 2. 페이징 계산
	    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);

	    // 3. 페이징된 사원 목록 가져오기
	    List<MemberDto> list = memberService.getPagedMemberList(pi);

	    // 4. 모델에 데이터 추가
	    model.addAttribute("pi", pi); // 페이징 정보
	    model.addAttribute("list", list); // 사원 목록
	    // 5. 뷰 이름 반환
	    return "member/employeelistview"; // employee/employeelistview.jsp
	}

	

	
	// 회원정보수정페이지 이동 (이예빈)
	@GetMapping("/modifydelete.do")
	public String modifyDelete(@RequestParam("memNo") String memNo, Model model) {
	    // 1. memNo로 해당 사원 정보 조회
	    MemberDto member = memberService.selectMemberByNo(memNo);

	    // 2. 조회된 정보를 모델에 담아 수정 페이지로 전달
	    model.addAttribute("member", member);

	    // 3. 수정 페이지 뷰 이름 반환
	    return "member/modifydelete";
	}

	// 회원정보수정
	@PostMapping("/updateMember.do")
	public String updateMember(MemberDto m, RedirectAttributes rd, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile ) {
		
	    // 1. 파일 업로드 처리
	    if (!uploadFile.isEmpty()) {
	        // 파일 업로드 수행
	        Map<String, String> map = fileUtil.fileupload(uploadFile, "profile");
	        String filePath = map.get("filePath") + "/" + map.get("filesystemName");

	        // MemberDto에 프로필 URL 설정
	        m.setProfileURL(filePath);
	    } else {
	        m.setProfileURL(null); // 파일이 없을 경우 null로 설정
	    }
		// 사원정보 업데이트
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			rd.addFlashAttribute("alertMsg", "성공적으로 정보수정이 되었습니다.");
		}else {
			rd.addFlashAttribute("alertMsg", "정보수정에 실패하였습니다.");
			
		}
		
		return "redirect:/member/employeelistview.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 출퇴근조회(이예빈)
	@GetMapping("/checkinrecordview.do")
	public void checkinrecodeview() {}
	
	// 근무시간조회(이예빈)
	@GetMapping("/workhoursview.do")
	public void workhoursview() {}
	
	// 조직도조회(이예빈)
	@GetMapping("/organization.do")
	public void organization() {}
	
	
	
	
	@GetMapping("/departments.do")
	@ResponseBody
	public List<Map<String, String>> getDepartments() {
	    // memberService를 이용해 부서 데이터를 가져옵니다.
	    return memberService.getAllDepartments();
	}

	@GetMapping("/employees.do")
	@ResponseBody
	public List<Map<String, String>> getEmployees(@RequestParam("deptCode") String deptCode) {
	    // memberService를 이용해 특정 부서에 속한 직원 데이터를 가져옵니다.
	    return memberService.getEmployeesByDeptCode(deptCode);
	}

	
	

	
	

	 
}

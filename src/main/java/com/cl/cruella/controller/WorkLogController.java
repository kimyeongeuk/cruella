package com.cl.cruella.controller;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.CalendarDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.WorkLogDto;
import com.cl.cruella.service.WorkLogService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/wl")
public class WorkLogController {
	
	private final WorkLogService wlService ;


	// 출근
	@PostMapping("/clockIn.do")
	@ResponseBody
	public String clockIn(WorkLogDto workLog, HttpSession session) {
		
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		
	    
	    int result = wlService.clockIn(workLog);
	    
	    	
	    // 세션에 출근 상태 업데이트
	    session.setAttribute("loginUser", loginUser);
        
		
		return workLog.getClockInTime();
	}
	
	// 퇴근
	@PostMapping("/clockOut.do")
	@ResponseBody
	public String clockOut(WorkLogDto workLog, HttpSession session) {
		
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		
		String clockInTime = wlService.selectClockInTime(workLog.getMemNo()); // 출근 시간 가져오기
		String clockOutTime = workLog.getClockOutTime();
		
	    int coHour = Integer.parseInt(clockOutTime.split(":")[0]); // 퇴근 시간 ??시 추출
	    int ciHour = Integer.parseInt(clockInTime.split(":")[0]);  // 출근 시간 ??시 추출
		
	    workLog.setWorkTime(coHour - ciHour); // 오늘의 근무 시간 저장
	    
		if(coHour < 18) { // 조퇴
			
			workLog.setStatus("E");
			int result = wlService.clockOut(workLog);
			
		}else if(ciHour < 9) { // 정상
			
			workLog.setStatus("N");
			int result = wlService.clockOut(workLog);
			
		}else { // 지각
			
			workLog.setStatus("L");
			int result = wlService.clockOut(workLog);
			
		}
		// 세션에 출근 상태 업데이트
		loginUser.setWlStatus(workLog.getStatus());
	    session.setAttribute("loginUser", loginUser);
	    
		return clockOutTime;
		
	}
	
	// 근태기록조회
	@PostMapping("/loadWorkLog.do")
	@ResponseBody
	public List<CalendarDto> loadWorkLog(String memNo){
		
		List<CalendarDto> list = wlService.loadWorkLog(memNo);
		
		return list;
	}
	
	// 결근자 확인후 결근처리(스케줄러)
	@Scheduled(cron="0 0 23 * * MON-FRI")
	public void updateAbsences() {
		
		System.out.println("스케줄실행");
		
		wlService.updateAbsences(); // 결근자 update(출근기록 O, 퇴근기록 X)
		wlService.insertAbsences(); // 결근자 insert(출근기록 X, 퇴근기록 X)
	}

	
	
	
}

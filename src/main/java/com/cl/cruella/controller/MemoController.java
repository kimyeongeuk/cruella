package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cl.cruella.dto.MemoDto;
import com.cl.cruella.service.MemoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/memo")
public class MemoController {
	
	private final MemoService memoService;
	
	// 메모 전체 리스트 조회(사번기준)
	// 김동규
	@PostMapping("/memoList.do")
	@ResponseBody
	public List<MemoDto> memoList(String memNo) {
		
		 // System.out.println(memNo);
		
		List<MemoDto> list = memoService.selectMemoList(memNo);	// 사번을 활용 -> 모든 메모 정보 조회
		
		 // System.out.println(list);
		
		return list;
	}
	
	// 메모 작성
	// 김동규
	@PostMapping("/insertMemo.do")
	public String insertMemo(MemoDto memo, RedirectAttributes rdAttributes) {
		
		// System.out.println(memo);
		
		int result = memoService.insertMemo(memo);
		
		if(result > 0) {
			rdAttributes.addFlashAttribute("alertMsg", "새로운 메모 등록 완료");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "메모 등록 실패. 다시 시도해주세요.");
		}
		
		return "redirect:/member/myinfo.do";
	}
	
	// 메모 조회 (메모번호로)
	// 김동규
	@PostMapping("/selectMemo.do")
	@ResponseBody
	public MemoDto selectMemo(int memoNo) {
		
		MemoDto memo = memoService.selectMemoByNo(memoNo);
		
		// System.out.println(memo);
		
		return memo;
	}
	
	// 메모 수정
	// 김동규
	@PostMapping("/modifyMemo.do")
	public String modifyMemo(MemoDto memo) {
		
		// System.out.println(memo);
		MemoDto m = memoService.selectMemoByNo(memo.getMemoNo());
		String before = m.getMemoContent(); 	// 수정 전 메모내용
		
		String after = memo.getMemoContent();  // 수정 후 메모내용
		
		// System.out.println( " 수정요청 전_____ " + m.getMemoContent());
		// System.out.println(" 수정요청 후_____ " + memo.getMemoContent()); // 수정 후 메모내용
		
		
		if(!before.equals(after)) {
			
			int result = memoService.modifyMemo(memo);
			
		}
		return "redirect:/member/myinfo.do"; 
		
	}
	
	@PostMapping("/deleteMemo.do")
	public String deleteMemo(int memoNo) {
		
		// System.out.println(memoNo);
		
		memoService.deleteMemo(memoNo);
		
		return "redirect:/member/myinfo.do";
	}

}

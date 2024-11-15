package com.cl.cruella.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cl.cruella.dto.BoardDto;
import com.cl.cruella.dto.PageInfoDto;
import com.cl.cruella.service.BoardService;
import com.cl.cruella.util.FileUtil;
import com.cl.cruella.util.PagingUtil;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	@GetMapping("/boardList.do")
	public void list(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int listCount = boardService.selectBoardListCount();
		
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10); 
		List<BoardDto> list = boardService.selectBoardList(pi);
		//System.out.println(list);
		System.out.println(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
	}

	@GetMapping("/increase.do") // 조회수 증가용 (타인의 글일 경우 호출) => /board/detail.do 재요청
	public String increaseCount(int no) {
		boardService.updateIncreaseCount(no);
		return "redirect:/board/detail.do?no=" + no;
	}
	
	@GetMapping("/boardDetail.do")
	public void detail(int no, Model model) {
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실
		BoardDto b = boardService.selectBoard(no);
		// boardNo, boardTitle, boardContent, boardWriter, registDt, attachList
		
		model.addAttribute("b", b);
	}
	
	@GetMapping("/boardModify.do")
	public void boardModifyPage() {
		
	}
	
	@GetMapping("/boardRegist.do")
	public void boardRegistPage() {
		
	}

}

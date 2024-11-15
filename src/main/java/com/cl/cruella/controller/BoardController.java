package com.cl.cruella.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cl.cruella.dto.BoardDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.PageInfoDto;
import com.cl.cruella.service.BoardService;
import com.cl.cruella.util.FileUtil;
import com.cl.cruella.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	@GetMapping("/boardList.do")
    public String list(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model, HttpSession session) {
        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/signin.do"; // 로그인 페이지로 리디렉션
        }

        String loggedInDeptCode = loginUser.getDeptCode();
        if (loggedInDeptCode == null) {
            model.addAttribute("error", "부서 코드가 설정되지 않았습니다.");
            return "errorPage"; // 에러 페이지로 리디렉션
        }

        int listCount = boardService.selectBoardListCount(loggedInDeptCode);

        PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);

        Map<String, Object> params = new HashMap<>();
        params.put("pi", pi);
        params.put("deptCode", loggedInDeptCode);

        List<BoardDto> list = boardService.selectBoardList(params);

        model.addAttribute("pi", pi);
        model.addAttribute("list", list);

        return "board/boardList";
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

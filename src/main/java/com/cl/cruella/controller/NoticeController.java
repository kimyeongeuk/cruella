package com.cl.cruella.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cl.cruella.dto.AttachDto;
import com.cl.cruella.dto.MemberDto;
import com.cl.cruella.dto.NoticeDto;
import com.cl.cruella.dto.PageInfoDto;
import com.cl.cruella.service.NoticeService;
import com.cl.cruella.util.FileUtil;
import com.cl.cruella.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService NoticeService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	@GetMapping("/noticeList.do")
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

        int listCount = NoticeService.selectNoticeListCount(loggedInDeptCode);

        PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);

        Map<String, Object> params = new HashMap<>();
        params.put("pi", pi);
        params.put("deptCode", loggedInDeptCode);

        List<NoticeDto> list = NoticeService.selectNoticeList(params);

        model.addAttribute("pi", pi);
        model.addAttribute("list", list);

        return "notice/noticeList";
    }


	@GetMapping("/increase.do") // 조회수 증가용 (타인의 글일 경우 호출) => /notice/detail.do 재요청
	public String increaseCount(int no) {
		NoticeService.updateIncreaseCount(no);
		return "redirect:/notice/noticeDetail.do?no=" + no;
	}
	
	@GetMapping("/noticeDetail.do")
	public void detail(int no, Model model) {
		// 상세페이지에 필요한 데이터
		// 게시글(제목,작성자,작성일,내용) 데이터, 첨부파일(원본명,저장경로,실
		NoticeDto b = NoticeService.selectNotice(no);
		// noticeNo, noticeTitle, noticeContent, noticeWriter, registDt, attachList
		
		model.addAttribute("b", b);
	}
		
	@GetMapping("/noticeRegist.do")
	public void noticeRegistPage() {
		
	}
	
	@PostMapping("/noticeInsert.do")
	public String regist(NoticeDto notice
					   , List<MultipartFile> uploadFiles
					   , HttpSession session
					   , RedirectAttributes rdAttributes) {
		
		// notice테이블에 insert할 데이터 
		notice.setMemNo( String.valueOf( ((MemberDto)session.getAttribute("loginUser")).getMemNo() ) );
		
		// 첨부파일 업로드 후에 
		// attachment테이블에 insert할 데이터
		List<AttachDto> attachList = new ArrayList<>();
		for(MultipartFile file : uploadFiles) {
			if(file != null && !file.isEmpty()) {
				Map<String, String> map = fileUtil.fileupload(file, "notice");
				attachList.add(AttachDto.builder()
										.filePath(map.get("filePath"))
										.originalName(map.get("originalName"))
										.filesystemName(map.get("filesystemName"))
										.refType("B")
										.build());
			}
		}
		notice.setAttachList(attachList); // 제목,내용,작성자회원번호,첨부파일들정보
		
		int result = NoticeService.insertNotice(notice);
		
		if(attachList.isEmpty() && result == 1 
				|| !attachList.isEmpty() && result == attachList.size()) {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 성공");
		}else {
			rdAttributes.addFlashAttribute("alertMsg", "게시글 등록 실패");			
		}
		
		return "redirect:/notice/noticeList.do";
		
	}
	
	@PostMapping("/noticeModify.do")
	public String modifyPage(@RequestParam("no") int no, Model model) {
	    model.addAttribute("b", NoticeService.selectNotice(no));
	    return "notice/noticeModify";
	}


	@PostMapping("/noticeUpdate.do")
	public String modify(NoticeDto notice 		// 번호,제목,내용
					   , String[] delFileNo   // null | 삭제할첨부파일번호들
					   , List<MultipartFile> uploadFiles // 새로넘어온첨부파일들
					   , RedirectAttributes rdAttributes ) {
		
		// 후에 db에 반영 성공시 삭제할 파일들 삭제 위해 미리 조회
		List<AttachDto> delAttachList = NoticeService.selectDelAttach(delFileNo);
		
		List<AttachDto> attachList = new ArrayList<>();
		for(MultipartFile file : uploadFiles) {
			if(file != null && !file.isEmpty()) {
				Map<String, String> map = fileUtil.fileupload(file, "notice");
				attachList.add(AttachDto.builder()
										.filePath(map.get("filePath"))
										.originalName(map.get("originalName"))
										.filesystemName(map.get("filesystemName"))
										.refType("B")
										.refNo(notice.getNoticeNo())
										.build());	
			}
		}
		notice.setAttachList(attachList);
		
		int result = NoticeService.updateNotice(notice, delFileNo);
		
		if(result > 0) { // 성공
			rdAttributes.addFlashAttribute("alertMsg", "성공적으로 수정되었습니다.");
			for(AttachDto at : delAttachList) {
				new File(at.getFilePath() + "/" + at.getFilesystemName()).delete();
			}
		}else { // 실패
			rdAttributes.addFlashAttribute("alertMsg", "게시글 수정에 실패했습니다.");
		}
		
		return "redirect:/notice/noticeDetail.do?no=" + notice.getNoticeNo();
		
	}


	@GetMapping("/noticeSearch.do")
	public String search(@RequestParam(value="page", defaultValue="1") int currentPage
					   , @RequestParam Map<String, String> search
					   , Model model) {
		// Map<String,String> search ==> {condition=user_id|notice_title|notice_content, keyword=란}
		
		int listCount = NoticeService.selectSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<NoticeDto> list = NoticeService.selectSearchList(search, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		
		return "notice/noticeList";
	}
	
	
	@PostMapping("/noticeDelete.do")
	public String remove(@RequestParam("no") int no, RedirectAttributes rdAttributes) {
	    int result = NoticeService.deleteNotice(no);
	    
	    if (result > 0) {
	        rdAttributes.addFlashAttribute("alertMsg", "성공적으로 삭제되었습니다.");
	    } else {
	        rdAttributes.addFlashAttribute("alertMsg", "게시글 삭제에 실패하였습니다.");
	    }
	    
	    return "redirect:/notice/noticeList.do";
	}

	@PostMapping("/deleteSelectedPosts.do")
	public String deleteSelectedPosts(@RequestParam("noticeNos") List<Integer> noticeNos) {
	    NoticeService.deleteSelectedPosts(noticeNos);
	    return "redirect:/notice/noticeList.do";
	}


	
}


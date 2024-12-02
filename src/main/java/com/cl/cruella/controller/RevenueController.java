package com.cl.cruella.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cl.cruella.dto.RevenueDto;
import com.cl.cruella.service.RevenueService;

@Controller
@RequestMapping("/revenue")
public class RevenueController {

    private final RevenueService revenueService;

    public RevenueController(RevenueService revenueService) {
        this.revenueService = revenueService;
    }

    @GetMapping("/revenue.do")
    public String revenuePage(
            @RequestParam(name = "deptCode", required = false) String deptCode,
            @RequestParam(name = "page", defaultValue = "1") int currentPage,
            @RequestParam(name = "size", defaultValue = "10") int limit,
            @RequestParam(name = "searchKeyword", required = false) String searchKeyword,
            @RequestParam(name = "startDate", required = false) String startDate,
            @RequestParam(name = "endDate", required = false) String endDate,
            Model model) {


        if (searchKeyword == null) {
            searchKeyword = ""; // 검색 초기값 설정
        }

        if (startDate == null || endDate == null) {
            startDate = LocalDate.now().toString(); // 초기값을 오늘 날짜로 설정
            endDate = LocalDate.now().toString(); // 초기값을 오늘 날짜로 설정
        }

        // 매장 옵션 설정
        Map<String, List<String>> storeOptions = new HashMap<>();
        storeOptions.put("T1", List.of("레노마셔츠", "라코스테"));
        storeOptions.put("T2", List.of("샤넬", "구찌"));
        storeOptions.put("T3", List.of("롯데마트", "홈플러스"));
        storeOptions.put("T4", List.of("나이키", "아디다스"));
        storeOptions.put("T5", List.of("아모레퍼시픽", "LG생활건강"));
        storeOptions.put("T6", List.of("루이비통", "에르메스"));
        storeOptions.put("T7", List.of("CGV", "롯데시네마"));
        storeOptions.put("T8", List.of("삼성전자", "LG전자"));

        model.addAttribute("storeOptions", storeOptions.getOrDefault(deptCode, List.of()));
        model.addAttribute("deptCode", deptCode);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        // 페이징 데이터 가져오기
        int totalRevenues = revenueService.getTotalRevenueCount(searchKeyword, startDate, endDate);
        int maxPage = (int) Math.ceil((double) totalRevenues / limit);
        int startPage = Math.max(1, currentPage - 2);
        int endPage = Math.min(maxPage, currentPage + 2);

        List<RevenueDto> revenueList = revenueService.getPagedRevenueList(currentPage, limit, searchKeyword, startDate, endDate);

        model.addAttribute("revenueList", revenueList);
        model.addAttribute("pi", Map.of(
            "currentPage", currentPage,
            "maxPage", maxPage,
            "startPage", startPage,
            "endPage", endPage,
            "totalRevenues", totalRevenues
        ));

        return "revenue/revenue";
    }


    @PostMapping("/registerAll.do")
    public String registerAllRevenues(
        @RequestParam("memNo") String memNo,
        @RequestParam("rvStores") List<String> rvStores,
        @RequestParam("rvValues") List<String> rvValues,  // List<String>으로 변경
        @RequestParam("deptCode") String deptCode,
        RedirectAttributes redirectAttributes) {

        try {
            // List<String>을 List<Integer>로 변환
            List<Integer> rvValuesAsInt = rvValues.stream()
                                                  .map(Integer::parseInt)
                                                  .collect(Collectors.toList());

            revenueService.registerAllRevenues(memNo, rvStores, rvValuesAsInt);
            redirectAttributes.addFlashAttribute("successMessage", "매출이 성공적으로 등록되었습니다!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "매출 등록 중 오류가 발생했습니다.");
        }
        return "redirect:/revenue/revenue.do?deptCode=" + deptCode;
    }
}

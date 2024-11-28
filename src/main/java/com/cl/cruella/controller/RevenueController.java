package com.cl.cruella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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

    // 매출 등록 페이지 반환
    @GetMapping("/revenue.do")
    public String revenuePage(Model model) {
        return "revenue/revenue"; // templates/revenue/revenue.html 파일을 반환
    }

    // REST API로 매출 데이터 등록
    @PostMapping("/register.do")
    public String registerRevenue(@ModelAttribute RevenueDto revenueDto, RedirectAttributes redirectAttributes) {
        try {
            revenueService.registerRevenue(revenueDto);
            redirectAttributes.addFlashAttribute("successMessage", "매출이 성공적으로 등록되었습니다!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "매출 등록에 실패했습니다.");
        }
        return "redirect:/revenue/revenue.do";
    }
}

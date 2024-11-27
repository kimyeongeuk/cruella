package com.cl.cruella.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.cruella.service.ChartService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chart")
@RequiredArgsConstructor
@Slf4j
public class ChartController {
    
    private final ChartService chartService;

    @GetMapping("/chart.do")
    public String chartPage(Model model) {
        // 현재 날짜를 모델에 추가
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        model.addAttribute("currentDate", currentDate.format(formatter));
        return "chart/chart"; // 차트 JSP 파일의 경로
    }


}

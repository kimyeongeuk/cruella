package com.cl.cruella.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.cruella.dto.RevenueDto;
import com.cl.cruella.service.ChartService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chart")
@RequiredArgsConstructor
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

    @ResponseBody
    @PostMapping("/teamSales.do")
    public String getDeptIncomeByMonth(@RequestBody Map<String, String> params) {
        List<RevenueDto> list = chartService.getDeptIncomeByMonth(params);
        Gson gson = new Gson();
        JsonArray jArray = new JsonArray();
        
        // 모든 deptCode 초기화
        Map<String, Integer> deptSalesMap = new HashMap<>();
        deptSalesMap.put("T1", 0);
        deptSalesMap.put("T2", 0);
        deptSalesMap.put("T3", 0);
        deptSalesMap.put("T4", 0);
        deptSalesMap.put("T5", 0);
        deptSalesMap.put("T6", 0);
        deptSalesMap.put("T7", 0);
        deptSalesMap.put("T8", 0);

        for (RevenueDto slsVO : list) {
            int sale = slsVO.getRvValue();
            String deptCode = slsVO.getDeptCode();
            
            deptSalesMap.put(deptCode, deptSalesMap.get(deptCode) + sale);
        }

        for (Map.Entry<String, Integer> entry : deptSalesMap.entrySet()) {
            JsonObject object = new JsonObject();
            object.addProperty("deptCode", entry.getKey());
            object.addProperty("sale", entry.getValue());
            jArray.add(object);
        }
        
        String json = gson.toJson(jArray);
        
        return json;
    }
}

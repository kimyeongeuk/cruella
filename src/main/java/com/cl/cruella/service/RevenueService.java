package com.cl.cruella.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.cl.cruella.dao.RevenueDao;
import com.cl.cruella.dto.RevenueDto;

@Service
public class RevenueService {

    private final RevenueDao revenueDao;

    public RevenueService(RevenueDao revenueDao) {
        this.revenueDao = revenueDao;
    }

    public void registerAllRevenues(String memNo, List<String> rvStores, List<Integer> rvValues) {
        if (rvStores.size() != rvValues.size()) {
            throw new IllegalArgumentException("매장과 매출 데이터가 일치하지 않습니다.");
        }
        
        List<RevenueDto> revenueList = new ArrayList<>();
        for (int i = 0; i < rvStores.size(); i++) {
            RevenueDto revenueDto = RevenueDto.builder()
                .memNo(memNo)
                .rvStore(rvStores.get(i))
                .rvValue(rvValues.get(i))
                .rvRegistDate(LocalDate.now().toString())
                .build();
            revenueList.add(revenueDto);
        }
        
        revenueDao.saveOrUpdateRevenues(revenueList);
    }



}

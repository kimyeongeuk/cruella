package com.cl.cruella.service;

import com.cl.cruella.dao.RevenueDao;
import com.cl.cruella.dto.RevenueDto;
import org.springframework.stereotype.Service;

@Service
public class RevenueService {

    private final RevenueDao revenueDao;

    public RevenueService(RevenueDao revenueDao) {
        this.revenueDao = revenueDao;
    }

    public void registerRevenue(RevenueDto revenueDto) {
        int result = revenueDao.saveOrUpdateRevenue(revenueDto);
        if (result <= 0) {
            throw new RuntimeException("매출 등록 실패!");
        }
    }
}

package com.cl.cruella.service;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.cl.cruella.dao.ChartDao;
import com.cl.cruella.dto.RevenueDto;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChartServiceImpl implements ChartService {

    private final ChartDao chartDao;

    @Override
    public List<RevenueDto> getDeptIncomeByMonth(Map<String, String> params) {
        return chartDao.findDeptIncomeByMonth(params);
    }

    @Override
    public List<RevenueDto> getDeptIncomeByYear(Map<String, String> params) {
        List<RevenueDto> results = chartDao.findDeptIncomeByYear(params);
        results.forEach(System.out::println); // 로그 출력으로 데이터 확인
        return results;
    }
}

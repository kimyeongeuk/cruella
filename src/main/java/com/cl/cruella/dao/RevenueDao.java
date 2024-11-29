package com.cl.cruella.dao;

import com.cl.cruella.dto.RevenueDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class RevenueDao {

    private final JdbcTemplate jdbcTemplate;

    public RevenueDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 날짜와 상점에 따른 매출 데이터가 이미 있는지 확인
    private boolean isRevenueExist(String memNo, String rvStore, String rvRegistDate) {
        String sql = "SELECT COUNT(*) FROM REVENUE WHERE MEM_NO = ? AND RV_STORE = ? AND RV_REGIST_DATE = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, memNo, rvStore, rvRegistDate);
        return count != null && count > 0;
    }

    // 매출 등록 또는 업데이트
    public void saveOrUpdateRevenues(List<RevenueDto> revenueList) {
        for (RevenueDto revenueDto : revenueList) {
            if (isRevenueExist(revenueDto.getMemNo(), revenueDto.getRvStore(), revenueDto.getRvRegistDate())) {
                updateRevenue(revenueDto);
            } else {
                insertRevenue(revenueDto);
            }
        }
    }

    // 매출 업데이트
    private void updateRevenue(RevenueDto revenueDto) {
        String updateSql = "UPDATE REVENUE SET RV_VALUE = ? WHERE MEM_NO = ? AND RV_STORE = ? AND RV_REGIST_DATE = ?";
        jdbcTemplate.update(updateSql,
            revenueDto.getRvValue(),
            revenueDto.getMemNo(),
            revenueDto.getRvStore(),
            revenueDto.getRvRegistDate()
        );
    }

    // 매출 삽입
    private void insertRevenue(RevenueDto revenueDto) {
        String insertSql = "INSERT INTO REVENUE (MEM_NO, RV_VALUE, RV_REGIST_DATE, RV_STORE) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(insertSql,
            revenueDto.getMemNo(),
            revenueDto.getRvValue(),
            revenueDto.getRvRegistDate(),
            revenueDto.getRvStore()
        );
    }
}

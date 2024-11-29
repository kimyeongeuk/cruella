package com.cl.cruella.dao;

import com.cl.cruella.dto.RevenueDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RevenueDao {

    private final JdbcTemplate jdbcTemplate;

    public RevenueDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 날짜와 상점에 따른 매출 데이터가 이미 있는지 확인
    private boolean isRevenueExist(String memNo, String rvStore, String rvRegistDate) {
        String sql = "SELECT COUNT(*) FROM REVENUE WHERE MEM_NO = ? AND RV_STORE = ? AND TO_CHAR(TO_DATE(RV_REGIST_DATE, 'YY/MM/DD'), 'YYYY-MM-DD') = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, memNo, rvStore, rvRegistDate);
        return count != null && count > 0;
    }

    // 매출 등록 또는 업데이트
    public int saveOrUpdateRevenue(RevenueDto revenueDto) {
        String rvRegistDate = revenueDto.getRvRegistDate(); // 입력 날짜
        boolean exists = isRevenueExist(revenueDto.getMemNo(), revenueDto.getRvStore(), rvRegistDate);

        if (exists) {
            // 데이터가 이미 존재하면 업데이트
            String updateSql = "UPDATE REVENUE SET RV_VALUE = ?, RV_REGIST_DATE = TO_DATE(?, 'YYYY-MM-DD') WHERE MEM_NO = ? AND RV_STORE = ? AND TO_CHAR(TO_DATE(RV_REGIST_DATE, 'YY/MM/DD'), 'YYYY-MM-DD') = ?";
            return jdbcTemplate.update(updateSql,
                revenueDto.getRvValue(),  // RV_VALUE
                rvRegistDate,             // RV_REGIST_DATE
                revenueDto.getMemNo(),    // MEM_NO
                revenueDto.getRvStore(),  // RV_STORE
                rvRegistDate              // RV_REGIST_DATE (WHERE 절 조건)
            );
        } else {
            // 데이터가 존재하지 않으면 삽입
            String insertSql = "INSERT INTO REVENUE (MEM_NO, RV_VALUE, RV_REGIST_DATE, RV_STORE) VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
            return jdbcTemplate.update(insertSql,
                revenueDto.getMemNo(),    // MEM_NO
                revenueDto.getRvValue(),  // RV_VALUE
                rvRegistDate,             // RV_REGIST_DATE
                revenueDto.getRvStore()   // RV_STORE
            );
        }
    }
}

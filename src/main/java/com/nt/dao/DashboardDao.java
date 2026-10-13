package com.nt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Integer getUserId(String userName) {
        try {
            return jdbcTemplate.queryForObject(
                    "SELECT user_id FROM users WHERE user_name = ?",
                    Integer.class, userName);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int getTotalCattle(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0;

        try {
            Integer count = jdbcTemplate.queryForObject(
                    "SELECT total_cattle FROM farm_details WHERE user_id = ?",
                    Integer.class, userId);
            return count != null ? count : 0;
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

    public double getTodaysMilkYield(String userName) {

        try {
            Double total = jdbcTemplate.queryForObject(
                    "SELECT COALESCE(SUM(milk), 0)\r\n"
                    + "FROM milk\r\n"
                    + "WHERE user_name = ?\r\n"
                    + "  AND DATE(`date`) = CURDATE();",
                    Double.class, userName);
            return total != null ? total : 0.0;
        } catch (EmptyResultDataAccessException e) {
            return 0.0;
        }
    }

    public int getFeedStock(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0;

        try {
            Integer stock = jdbcTemplate.queryForObject(
                    "SELECT sum(available_qty) FROM feed_stock WHERE user_id = ?",
                    Integer.class, userId);
            return stock != null ? stock : 0;
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

//    public int getHealthAlertsCount(String userName) {
//        Integer userId = getUserId(userName);
//        if (userId == null) return 0;
//
//        try {
//            Integer count = jdbcTemplate.queryForObject(
//                    "SELECT COUNT(*) FROM cattle WHERE user_id = ? AND status = 'Needs Attention'",
//                    Integer.class, userId);
//            return count != null ? count : 0;
//        } catch (EmptyResultDataAccessException e) {
//            return 0;
//        }
//    }
}
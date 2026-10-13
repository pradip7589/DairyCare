package com.nt.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.nt.entity.FeedStock;

@Repository
public class FeedDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<FeedStock> feedRowMapper = (rs, rowNum) -> {
        FeedStock f = new FeedStock();
        f.setFeedId(rs.getInt("feed_id"));
        f.setUserId(String.valueOf(rs.getInt("user_id")));
        f.setFeedName(rs.getString("feed_name"));
        f.setIconClass(rs.getString("icon_class"));
        f.setAvailableQty(rs.getDouble("available_qty"));
        f.setCapacityQty(rs.getDouble("capacity_qty"));
        f.setDailyUsage(rs.getDouble("daily_usage"));
        f.setUnit(rs.getString("unit"));
        f.setLastUpdated(rs.getString("last_updated"));
        return f;
    };

    private Integer getUserId(String userName) {
        try {
            return jdbcTemplate.queryForObject(
                    "SELECT user_id FROM users WHERE user_name = ?",
                    Integer.class, userName);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public List<FeedStock> getAllFeedStock(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return List.of();

        return jdbcTemplate.query(
                "SELECT * FROM feed_stock WHERE user_id = ? ORDER BY feed_name",
                feedRowMapper, userId);
    }

    public double getTotalFeedStock(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0.0;

        try {
            Double total = jdbcTemplate.queryForObject(
                    "SELECT SUM(available_qty) FROM feed_stock WHERE user_id = ?",
                    Double.class, userId);
            return total != null ? total : 0.0;
        } catch (EmptyResultDataAccessException e) {
            return 0.0;
        }
    }

    public double getTotalDailyConsumption(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0.0;

        try {
            Double total = jdbcTemplate.queryForObject(
                    "SELECT SUM(daily_usage) FROM feed_stock WHERE user_id = ?",
                    Double.class, userId);
            return total != null ? total : 0.0;
        } catch (EmptyResultDataAccessException e) {
            return 0.0;
        }
    }

    public int getFeedTypesCount(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0;

        try {
            Integer count = jdbcTemplate.queryForObject(
                    "SELECT COUNT(*) FROM feed_stock WHERE user_id = ?",
                    Integer.class, userId);
            return count != null ? count : 0;
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

    public int getLowStockCount(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0;

        try {
            Integer count = jdbcTemplate.queryForObject(
                    "SELECT COUNT(*) FROM feed_stock WHERE user_id = ? AND (available_qty / capacity_qty) <= 0.65",
                    Integer.class, userId);
            return count != null ? count : 0;
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

    public double getDailyRequirement(String userName) {
        Integer userId = getUserId(userName);
        if (userId == null) return 0.0;

        try {
            Double req = jdbcTemplate.queryForObject(
                    "SELECT daily_feed_requirement FROM feed_requirement WHERE user_id = ?",
                    Double.class, userId);
            return req != null ? req : 0.0;
        } catch (EmptyResultDataAccessException e) {
            return 0.0;
        }
    }

    public boolean updateStock(int feedId, double newAvailableQty) {
        String sql = "UPDATE feed_stock SET available_qty = ?, last_updated = CURDATE() WHERE feed_id = ?";
        int rows = jdbcTemplate.update(sql, newAvailableQty, feedId);
        return rows > 0;
    }

    public boolean addFeed(FeedStock feed) {
        Integer userId = getUserId(feed.getUserId());
        if (userId == null) return false;

        String sql = "INSERT INTO feed_stock (user_id, feed_name, icon_class, available_qty, capacity_qty, daily_usage, unit, last_updated) VALUES (?,?,?,?,?,?,?,CURDATE())";
        int rows = jdbcTemplate.update(sql,
                userId, feed.getFeedName(), feed.getIconClass(),
                feed.getAvailableQty(), feed.getCapacityQty(),
                feed.getDailyUsage(), feed.getUnit());
        return rows > 0;
    }
}
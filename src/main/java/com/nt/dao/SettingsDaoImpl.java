package com.nt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.nt.entity.*;

@Repository
public class SettingsDaoImpl implements SettingsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<UserProfile> profileRowMapper = (rs, rowNum) -> {
        UserProfile p = new UserProfile();
        p.setUserId(rs.getString("user_name"));
        p.setFullName(rs.getString("full_name"));
        p.setEmail(rs.getString("email"));
        p.setPhone(rs.getString("phone"));
        p.setRole(rs.getString("role"));
        return p;
    };

    private RowMapper<FarmDetails> farmRowMapper = (rs, rowNum) -> {
        FarmDetails f = new FarmDetails();
        f.setUserId(String.valueOf(rs.getInt("user_id")));
        f.setFarmName(rs.getString("farm_name"));
        f.setFarmType(rs.getString("farm_type"));
        f.setTotalCattle(rs.getInt("total_cattle"));
        f.setLocation(rs.getString("location"));
        f.setAddress(rs.getString("address"));
        return f;
    };

    private RowMapper<NotificationSettings> notificationRowMapper = (rs, rowNum) -> {
        NotificationSettings n = new NotificationSettings();
        n.setUserId(String.valueOf(rs.getInt("user_id")));   // fixed
        n.setHealthAlerts(rs.getBoolean("health_alerts"));
        n.setMilkProduction(rs.getBoolean("milk_production"));
        n.setFeedStock(rs.getBoolean("feed_stock"));
        n.setReports(rs.getBoolean("reports"));
        return n;
    };

    private RowMapper<AppPreferences> preferencesRowMapper = (rs, rowNum) -> {
        AppPreferences p = new AppPreferences();
        p.setUserId(String.valueOf(rs.getInt("user_id")));   // fixed
        p.setLanguage(rs.getString("language"));
        p.setDateFormat(rs.getString("date_format"));
        p.setMilkUnit(rs.getString("milk_unit"));
        return p;
    };

    // ================= helper: get numeric user_id from username =================
    private Integer getUserIdByUsername(String userName) {
        try {
            return jdbcTemplate.queryForObject(
                    "SELECT user_id FROM users WHERE user_name = ?",
                    Integer.class, userName);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    // ================= PROFILE =================

    @Override
    public UserProfile getProfile(String userName) {
        String sql = "SELECT user_name, full_name, email, phone, role FROM users WHERE user_name = ?";
        try {
            return jdbcTemplate.queryForObject(sql, profileRowMapper, userName);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean updateProfile(UserProfile profile) {
        String sql = "UPDATE users SET full_name = ?, email = ?, phone = ?, role = ? WHERE user_name = ?";
        int rows = jdbcTemplate.update(sql,
                profile.getFullName(), profile.getEmail(),
                profile.getPhone(), profile.getRole(), profile.getUserId());
        return rows > 0;
    }

    // ================= FARM DETAILS =================

    @Override
    public FarmDetails getFarmDetails(String userName) {
        Integer userId = getUserIdByUsername(userName);
        if (userId == null) return null;

        String sql = "SELECT * FROM farm_details WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, farmRowMapper, userId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean updateFarmDetails(FarmDetails farm) {
        Integer userId = getUserIdByUsername(farm.getUserId());
        if (userId == null) return false;

        Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM farm_details WHERE user_id = ?",
                Integer.class, userId);

        if (count != null && count > 0) {
            String sql = "UPDATE farm_details SET farm_name=?, farm_type=?, total_cattle=?, feed_stock_bags=?, location=?, address=? WHERE user_id=?";
            int rows = jdbcTemplate.update(sql,
                    farm.getFarmName(), farm.getFarmType(), farm.getTotalCattle(), farm.getfeed_stock_bags(),
                    farm.getLocation(), farm.getAddress(), userId);
            return rows > 0;
        } else {
            String sql = "INSERT INTO farm_details (user_id, farm_name, farm_type, total_cattle, feed_stock_bags, location, address) VALUES (?,?,?,?,?,?,?)";
            int rows = jdbcTemplate.update(sql,
                    userId, farm.getFarmName(), farm.getFarmType(),
                    farm.getTotalCattle(), farm.getfeed_stock_bags(), farm.getLocation(), farm.getAddress());
            return rows > 0;
        }
    }

    // ================= PASSWORD =================

    @Override
    public String getStoredPassword(String userName) {
        String sql = "SELECT password FROM users WHERE user_name = ?";
        try {
            return jdbcTemplate.queryForObject(sql, String.class, userName);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean updatePassword(String userName, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE user_name = ?";
        int rows = jdbcTemplate.update(sql, newPassword, userName);
        return rows > 0;
    }

    // ================= NOTIFICATIONS =================

    @Override
    public NotificationSettings getNotificationSettings(String userName) {
        Integer userId = getUserIdByUsername(userName);
        if (userId == null) return null;

        String sql = "SELECT * FROM notification_settings WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, notificationRowMapper, userId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean updateNotificationSettings(NotificationSettings settings) {
        Integer userId = getUserIdByUsername(settings.getUserId());
        if (userId == null) return false;

        Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM notification_settings WHERE user_id = ?",
                Integer.class, userId);

        if (count != null && count > 0) {
            String sql = "UPDATE notification_settings SET health_alerts=?, milk_production=?, feed_stock=?, reports=? WHERE user_id=?";
            int rows = jdbcTemplate.update(sql,
                    settings.isHealthAlerts(), settings.isMilkProduction(),
                    settings.isFeedStock(), settings.isReports(), userId);
            return rows > 0;
        } else {
            String sql = "INSERT INTO notification_settings (user_id, health_alerts, milk_production, feed_stock, reports) VALUES (?,?,?,?,?)";
            int rows = jdbcTemplate.update(sql,
                    userId, settings.isHealthAlerts(),
                    settings.isMilkProduction(), settings.isFeedStock(), settings.isReports());
            return rows > 0;
        }
    }

    // ================= PREFERENCES =================

    @Override
    public AppPreferences getPreferences(String userName) {
        Integer userId = getUserIdByUsername(userName);
        if (userId == null) return null;

        String sql = "SELECT * FROM app_preferences WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, preferencesRowMapper, userId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean updatePreferences(AppPreferences prefs) {
        Integer userId = getUserIdByUsername(prefs.getUserId());
        if (userId == null) return false;

        Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM app_preferences WHERE user_id = ?",
                Integer.class, userId);

        if (count != null && count > 0) {
            String sql = "UPDATE app_preferences SET language=?, date_format=?, milk_unit=? WHERE user_id=?";
            int rows = jdbcTemplate.update(sql,
                    prefs.getLanguage(), prefs.getDateFormat(), prefs.getMilkUnit(), userId);
            return rows > 0;
        } else {
            String sql = "INSERT INTO app_preferences (user_id, language, date_format, milk_unit) VALUES (?,?,?,?)";
            int rows = jdbcTemplate.update(sql,
                    userId, prefs.getLanguage(), prefs.getDateFormat(), prefs.getMilkUnit());
            return rows > 0;
        }
    }

	@Override
	public String deleteAccount(String userId) {
	    String sql = "DELETE FROM users WHERE user_name = ?";

	    int rowsDeleted = jdbcTemplate.update(sql, userId);

	    return rowsDeleted > 0 ? "SUCCESS" : "Account not found.";
	}
}
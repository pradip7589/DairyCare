package com.nt.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.nt.entity.RegisterUser;
import com.nt.entity.milkReport;

@Repository
public class dairyDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public boolean login(String user_name, String password) {

		int rs = 0;
		try {
			Object args[] = { user_name, password };
			rs = jdbcTemplate.queryForObject("select count(*) from users where user_name=? and password=?", args,
					new RowMapper<Integer>() {
						@Override
						public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
							int count = rs.getInt(1);
							return count;
						}
					});
		} catch (Exception e2) {
			e2.printStackTrace();
		}

		if (rs >= 1) {
			return true;
		} else {
			return false;
		}
	}

//	public boolean register(RegisterUser r) {
//
//		try {
//			Object arr[] = {r.getFullName(),r.getUserName(),r.getEmail(),r.getPhone(),r.getFarmName(),r.getRole(),r.getLocation(),r.getHerdSize(),r.getPassword()};
//			int rs = jdbcTemplate.update("insert into users (full_name,user_name,email,phone,farm_name,role,location,herd_size,password) values(?,?,?,?,?,?,?,?,?)", arr);
//
//			if (rs >= 1) {
//				return true;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}

	public boolean milk(milkReport mr, String user_name) {

		try {

			Object arr[] = { mr.getDate(), mr.getMilk(), mr.getFat(), mr.getSnf(), mr.getRate(), mr.getAmount(),
					user_name };
			int rs = jdbcTemplate
					.update("insert into milk (date,milk,fat,snf,rate,amount,user_name) values(?,?,?,?,?,?,?)", arr);

			if (rs >= 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<milkReport> selectAllRecord(String user_name) {
		try {

			Object arr[] = { user_name };
			List<milkReport> list = jdbcTemplate.query(
					"select date, milk, fat, snf, rate, amount from milk where user_name=?", arr,
					new RowMapper<milkReport>() {

						@Override
						public milkReport mapRow(ResultSet rs, int rowNum) throws SQLException {
							return new milkReport(rs.getDate(1).toLocalDate(), rs.getFloat(2), rs.getFloat(3),
									rs.getFloat(4), rs.getFloat(5), rs.getFloat(6));
						}

					});
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Map<String, Object>> selectLast7DaysMilk(String userName) {
	    String sql =
	            "SELECT DATE_FORMAT(`date`, '%a') AS label, " +
	            "SUM(milk) AS total " +
	            "FROM milk " +
	            "WHERE user_name = ? " +
	            "AND `date` >= CURDATE() - INTERVAL 6 DAY " +
	            "AND `date` < CURDATE() + INTERVAL 1 DAY " +
	            "GROUP BY `date` " +
	            "ORDER BY `date`";

	    return jdbcTemplate.queryForList(sql, userName);
	}

}

package com.nt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nt.entity.RegisterUser;

@Repository
public class RegisterDaoImpl implements RegisterDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public boolean register(RegisterUser r) {
        try {
            Object arr[] = {
                    r.getFullName(), r.getUserName(), r.getEmail(), r.getPhone(),
                    r.getFarmName(), r.getRole(), r.getLocation(), r.getHerdSize(),
                    r.getPassword()
            };

            int rs = jdbcTemplate.update(
                    "insert into users (full_name,user_name,email,phone,farm_name,role,location,herd_size,password) values(?,?,?,?,?,?,?,?,?)",
                    arr);

            if (rs >= 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean isUserNameExists(String userName) {
        try {
            Integer count = jdbcTemplate.queryForObject(
                    "select count(*) from users where user_name = ?",
                    Integer.class, userName);
            return count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean isEmailExists(String email) {
        try {
            Integer count = jdbcTemplate.queryForObject(
                    "select count(*) from users where email = ?",
                    Integer.class, email);
            return count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
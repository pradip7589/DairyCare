package com.nt.dao;

import com.nt.entity.RegisterUser;

public interface RegisterDao {
    boolean register(RegisterUser r);
    boolean isUserNameExists(String userName);
    boolean isEmailExists(String email);
}
package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.dao.RegisterDao;
import com.nt.entity.RegisterUser;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDao registerDao;

    @Override
    public String registerUser(RegisterUser r) {

        if (r.getFullName() == null || r.getFullName().trim().isEmpty()) {
            return "Full name is required.";
        }
        if (r.getUserName() == null || r.getUserName().trim().isEmpty()) {
            return "User name is required.";
        }
        if (r.getEmail() == null || !r.getEmail().contains("@")) {
            return "Please enter a valid email address.";
        }
        if (r.getPassword() == null || r.getPassword().length() < 6) {
            return "Password must be at least 6 characters.";
        }
        if (!r.getPassword().equals(r.getConfirmPassword())) {
            return "Password and Confirm Password do not match.";
        }
        if (registerDao.isUserNameExists(r.getUserName())) {
            return "User name already taken.";
        }
        if (registerDao.isEmailExists(r.getEmail())) {
            return "Email already registered.";
        }

        boolean success = registerDao.register(r);
        return success ? "SUCCESS" : "Registration failed. Please try again.";
    }
}
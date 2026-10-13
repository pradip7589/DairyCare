package com.nt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.nt.entity.RegisterUser;
import com.nt.service.RegisterService;

@Controller
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @RequestMapping("/registrationForm")
    public String registerUser(@ModelAttribute RegisterUser registerUser, Model model) {

        String result = registerService.registerUser(registerUser);

        if (result.equals("SUCCESS")) {
            return "redirect:login";
        } else {
            model.addAttribute("errorMessage", result);
            return "register";
        }
    }
}
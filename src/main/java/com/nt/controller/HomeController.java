package com.nt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index_page() {
        return "index";
    } 
    @RequestMapping("/index")
    public String home_page() {
        return "index";
    }
	@RequestMapping("/login")
    public String login_page() {
        return "login";
    }
//    @RequestMapping("/dashboard")
//    public String dashboard_page() {
//        return "dashboard";
//    }
    @RequestMapping("/about")
    public String about_page() {
        return "about";
    }
    @RequestMapping("/services")
    public String service_page() {
        return "service";
    }
    @RequestMapping("/contact")
    public String contact_page() {
        return "contact";
    }
//    @RequestMapping("/register")
//    public String register_page() {
//        return "register";
//    }
    @RequestMapping("/health")
    public String health_page() {
        return "health";
    }
    @RequestMapping("/milk")
    public String milk_page() {
        return "milk";
    }
//    @RequestMapping("/feed")
//    public String feed_page() {
//        return "feed";
//    }
//    @RequestMapping("/setting")
//    public String setting_page() {
//        return "setting";
//    }
    @RequestMapping("/termsAndCondition")
    public String termsAndCondition_page() {
        return "termsAndCondition";
    } 
}
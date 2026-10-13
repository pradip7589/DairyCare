package com.nt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.nt.service.DashboardService;

@Controller
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/dashboard")
    public String loadDashboard(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("user");
        if (userName == null) {
            return "redirect:login";
        }

        model.addAttribute("totalCattle", dashboardService.getTotalCattle(userName));
        model.addAttribute("todaysMilk", dashboardService.getTodaysMilkYield(userName));
        model.addAttribute("feedStock", dashboardService.getFeedStock(userName));
//        model.addAttribute("healthAlerts", dashboardService.getHealthAlertsCount(userName));

        return "dashboard";
    }
}
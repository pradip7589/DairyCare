package com.nt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nt.entity.FeedStock;
import com.nt.service.FeedService;

@Controller
public class FeedController {

    @Autowired
    private FeedService feedService;

    @GetMapping("/feed")
    public String loadFeedPage(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("user");
        if (userName == null) {
            return "redirect:login";
        }

        List<FeedStock> feedList = feedService.getAllFeedStock(userName);
        double totalStock = feedService.getTotalFeedStock(userName);
        double dailyConsumption = feedService.getTotalDailyConsumption(userName);
        int feedTypesCount = feedService.getFeedTypesCount(userName);
        int lowStockCount = feedService.getLowStockCount(userName);
        double dailyRequirement = feedService.getDailyRequirement(userName);
        int estimatedDays = feedService.getEstimatedDaysRemaining(userName);

        model.addAttribute("feedList", feedList);
        model.addAttribute("totalStock", totalStock);
        model.addAttribute("dailyConsumption", dailyConsumption);
        model.addAttribute("feedTypesCount", feedTypesCount);
        model.addAttribute("lowStockCount", lowStockCount);
        model.addAttribute("dailyRequirement", dailyRequirement);
        model.addAttribute("estimatedDays", estimatedDays);

        return "feed";
    }

    @PostMapping("/updateFeedStock")
    public String updateStock(@RequestParam int feedId,
                               @RequestParam double availableQty,
                               HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:login";
        }
        feedService.updateStock(feedId, availableQty);
        return "redirect:feed";
    }

    @PostMapping("/addFeed")
    public String addFeed(@ModelAttribute FeedStock feed, HttpSession session) {
        String userName = (String) session.getAttribute("user");
      
        feed.setUserId(userName);
        feedService.addFeed(feed);
        return "redirect:feed";
    }
}
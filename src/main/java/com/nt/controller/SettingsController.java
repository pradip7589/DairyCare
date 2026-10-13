package com.nt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.entity.*;
import com.nt.service.SettingsService;

@Controller
public class SettingsController {

    @Autowired
    private SettingsService settingsService;

    @GetMapping("/setting")
    public String loadSettings(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user");
        if (userId == null) {
            return "redirect:login";
        }

        model.addAttribute("profile", settingsService.getProfile(userId));
        model.addAttribute("farmDetails", settingsService.getFarmDetails(userId));
        model.addAttribute("notifications", settingsService.getNotificationSettings(userId));
        model.addAttribute("preferences", settingsService.getPreferences(userId));

        return "setting";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute UserProfile profile,
                                 HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user");
        if (userId == null) return "redirect:login";

        profile.setUserId(userId);
        String result = settingsService.updateProfile(profile);
        model.addAttribute("profileMessage", result.equals("SUCCESS") ? "Profile updated successfully." : result);

        return loadSettings(session, model);
    }

    @PostMapping("/updateFarmDetails")
    public String updateFarmDetails(@ModelAttribute FarmDetails farm,
                                     HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user");
        if (userId == null) return "redirect:login";

        farm.setUserId(userId);
        String result = settingsService.updateFarmDetails(farm);
        model.addAttribute("farmMessage", result.equals("SUCCESS") ? "Farm details updated successfully." : result);

        return loadSettings(session, model);
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam String currentPassword,
                                  @RequestParam String newPassword,
                                  @RequestParam String confirmPassword,
                                  HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user");
        if (userId == null) return "redirect:login";

        String result = settingsService.updatePassword(userId, currentPassword, newPassword, confirmPassword);
        model.addAttribute("passwordMessage", result.equals("SUCCESS") ? "Password updated successfully." : result);

        return loadSettings(session, model);
    }

    @PostMapping("/updateNotifications")
    public String updateNotifications(@RequestParam(required = false) Boolean healthAlerts,
                                       @RequestParam(required = false) Boolean milkProduction,
                                       @RequestParam(required = false) Boolean feedStock,
                                       @RequestParam(required = false) Boolean reports,
                                       HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user");
        if (userId == null) return "redirect:login";

        NotificationSettings settings = new NotificationSettings();
        settings.setUserId(userId);
        settings.setHealthAlerts(Boolean.TRUE.equals(healthAlerts));
        settings.setMilkProduction(Boolean.TRUE.equals(milkProduction));
        settings.setFeedStock(Boolean.TRUE.equals(feedStock));
        settings.setReports(Boolean.TRUE.equals(reports));

        String result = settingsService.updateNotificationSettings(settings);
        model.addAttribute("notificationMessage", result.equals("SUCCESS") ? "Notification preferences saved." : result);

        return loadSettings(session, model);
    }

    @PostMapping("/updatePreferences")
    public String updatePreferences(@ModelAttribute AppPreferences prefs,
                                     HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user");
        if (userId == null) return "redirect:login";

        prefs.setUserId(userId);
        String result = settingsService.updatePreferences(prefs);
        model.addAttribute("prefsMessage", result.equals("SUCCESS") ? "Preferences saved successfully." : result);

        return loadSettings(session, model);
    }

    @PostMapping("/deleteAccount")
    public String deleteAccount(HttpSession session, RedirectAttributes redirectAttributes) {
        String userId = (String) session.getAttribute("user");

        if (userId == null || userId.isBlank()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Please log in again.");
            return "redirect:/login";
        }

        String result = settingsService.deleteAccount(userId);

        if ("SUCCESS".equals(result)) {
            session.invalidate();
            return "redirect:/login";
        }

        redirectAttributes.addFlashAttribute("errorMessage", result);
        return "redirect:/settings";
    } 
}
package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.dao.SettingsDao;
import com.nt.entity.*;

@Service
public class SettingsServiceImpl implements SettingsService {

    @Autowired
    private SettingsDao settingsDao;

    @Override
    public UserProfile getProfile(String userId) {
        return settingsDao.getProfile(userId);
    }

    @Override
    public String updateProfile(UserProfile profile) {
        if (profile.getFullName() == null || profile.getFullName().trim().isEmpty()) {
            return "Full name is required.";
        }
        if (profile.getEmail() == null || !profile.getEmail().contains("@")) {
            return "Please enter a valid email address.";
        }
        return settingsDao.updateProfile(profile) ? "SUCCESS" : "Failed to update profile. Please try again.";
    }

    @Override
    public FarmDetails getFarmDetails(String userId) {
        return settingsDao.getFarmDetails(userId);
    }

    @Override
    public String updateFarmDetails(FarmDetails farm) {
        if (farm.getFarmName() == null || farm.getFarmName().trim().isEmpty()) {
            return "Farm name is required.";
        }
        if (farm.getTotalCattle() < 0) {
            return "Total cattle cannot be negative.";
        }
        return settingsDao.updateFarmDetails(farm) ? "SUCCESS" : "Failed to update farm details.";
    }

    @Override
    public String updatePassword(String userId, String currentPassword, String newPassword, String confirmPassword) {
        if (currentPassword == null || currentPassword.isEmpty()) {
            return "Please enter your current password.";
        }
        if (newPassword == null || newPassword.length() < 6) {
            return "New password must be at least 6 characters.";
        }
        if (!newPassword.equals(confirmPassword)) {
            return "New password and confirm password do not match.";
        }

        String storedPassword = settingsDao.getStoredPassword(userId);
        if (storedPassword == null || !storedPassword.equals(currentPassword)) {
            return "Current password is incorrect.";
        }

        return settingsDao.updatePassword(userId, newPassword) ? "SUCCESS" : "Failed to update password.";
    }

    @Override
    public NotificationSettings getNotificationSettings(String userId) {
        return settingsDao.getNotificationSettings(userId);
    }

    @Override
    public String updateNotificationSettings(NotificationSettings settings) {
        return settingsDao.updateNotificationSettings(settings) ? "SUCCESS" : "Failed to update notifications.";
    }

    @Override
    public AppPreferences getPreferences(String userId) {
        return settingsDao.getPreferences(userId);
    }

    @Override
    public String updatePreferences(AppPreferences prefs) {
        return settingsDao.updatePreferences(prefs) ? "SUCCESS" : "Failed to update preferences.";
    }

	@Override
	public String deleteAccount(String userId) {
		return settingsDao.deleteAccount(userId);
	}
}
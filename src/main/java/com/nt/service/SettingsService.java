package com.nt.service;

import com.nt.entity.*;

public interface SettingsService {
    UserProfile getProfile(String userId);
    String updateProfile(UserProfile profile);

    FarmDetails getFarmDetails(String userId);
    String updateFarmDetails(FarmDetails farm);

    String updatePassword(String userId, String currentPassword, String newPassword, String confirmPassword);

    NotificationSettings getNotificationSettings(String userId);
    String updateNotificationSettings(NotificationSettings settings);

    AppPreferences getPreferences(String userId);
    String updatePreferences(AppPreferences prefs);
    
	String deleteAccount(String userId);
}
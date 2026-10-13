package com.nt.dao;

import com.nt.entity.*;

public interface SettingsDao {
    UserProfile getProfile(String userId);
    boolean updateProfile(UserProfile profile);

    FarmDetails getFarmDetails(String userId);
    boolean updateFarmDetails(FarmDetails farm);

    String getStoredPassword(String userId);
    boolean updatePassword(String userId, String newPassword);

    NotificationSettings getNotificationSettings(String userId);
    boolean updateNotificationSettings(NotificationSettings settings);

    AppPreferences getPreferences(String userId);
    boolean updatePreferences(AppPreferences prefs);
    
	String deleteAccount(String userId);
}
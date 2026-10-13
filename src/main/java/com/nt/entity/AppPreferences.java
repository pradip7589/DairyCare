package com.nt.entity;

public class AppPreferences {
    private String userId;
    private String language;
    private String dateFormat;
    private String milkUnit;

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }

    public String getDateFormat() { return dateFormat; }
    public void setDateFormat(String dateFormat) { this.dateFormat = dateFormat; }

    public String getMilkUnit() { return milkUnit; }
    public void setMilkUnit(String milkUnit) { this.milkUnit = milkUnit; }
}
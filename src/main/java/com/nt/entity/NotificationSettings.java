package com.nt.entity;

public class NotificationSettings {
    private String userId;
    private boolean healthAlerts;
    private boolean milkProduction;
    private boolean feedStock;
    private boolean reports;

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public boolean isHealthAlerts() { return healthAlerts; }
    public void setHealthAlerts(boolean healthAlerts) { this.healthAlerts = healthAlerts; }

    public boolean isMilkProduction() { return milkProduction; }
    public void setMilkProduction(boolean milkProduction) { this.milkProduction = milkProduction; }

    public boolean isFeedStock() { return feedStock; }
    public void setFeedStock(boolean feedStock) { this.feedStock = feedStock; }

    public boolean isReports() { return reports; }
    public void setReports(boolean reports) { this.reports = reports; }
}
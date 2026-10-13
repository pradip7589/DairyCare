package com.nt.entity;

public class FeedStock {
    private int feedId;
    private String userId;
    private String feedName;
    private String iconClass;
    private double availableQty;
    private double capacityQty;
    private double dailyUsage;
    private String unit;
    private String lastUpdated;

    public int getFeedId() { return feedId; }
    public void setFeedId(int feedId) { this.feedId = feedId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getFeedName() { return feedName; }
    public void setFeedName(String feedName) { this.feedName = feedName; }

    public String getIconClass() { return iconClass; }
    public void setIconClass(String iconClass) { this.iconClass = iconClass; }

    public double getAvailableQty() { return availableQty; }
    public void setAvailableQty(double availableQty) { this.availableQty = availableQty; }

    public double getCapacityQty() { return capacityQty; }
    public void setCapacityQty(double capacityQty) { this.capacityQty = capacityQty; }

    public double getDailyUsage() { return dailyUsage; }
    public void setDailyUsage(double dailyUsage) { this.dailyUsage = dailyUsage; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public String getLastUpdated() { return lastUpdated; }
    public void setLastUpdated(String lastUpdated) { this.lastUpdated = lastUpdated; }

    // derived helper, used in JSP for progress bar / status badge
    public int getPercentFull() {
        if (capacityQty <= 0) return 0;
        return (int) Math.round((availableQty / capacityQty) * 100);
    }

    public String getStatus() {
        int pct = getPercentFull();
        if (pct <= 40) return "Critical";
        if (pct <= 65) return "Low";
        return "Good";
    }
}
package com.nt.entity;

public class FarmDetails {
    private String userId;
    private String farmName;
    private String farmType;
    private int totalCattle;
    private String feed_stock_bags;
    private String location;
    private String address;

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getFarmName() { return farmName; }
    public void setFarmName(String farmName) { this.farmName = farmName; }

    public String getFarmType() { return farmType; }
    public void setFarmType(String farmType) { this.farmType = farmType; }

    public int getTotalCattle() { return totalCattle; }
    public void setTotalCattle(int totalCattle) { this.totalCattle = totalCattle; }
    
    public String getfeed_stock_bags() { return feed_stock_bags; }
    public void setfeed_stock_bags(String feed_stock_bags) { this.feed_stock_bags = feed_stock_bags; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}
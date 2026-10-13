package com.nt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.dao.FeedDao;
import com.nt.entity.FeedStock;

@Service
public class FeedService {

    @Autowired
    private FeedDao feedDao;

    public List<FeedStock> getAllFeedStock(String userName) {
        return feedDao.getAllFeedStock(userName);
    }

    public double getTotalFeedStock(String userName) {
        return feedDao.getTotalFeedStock(userName);
    }

    public double getTotalDailyConsumption(String userName) {
        return feedDao.getTotalDailyConsumption(userName);
    }

    public int getFeedTypesCount(String userName) {
        return feedDao.getFeedTypesCount(userName);
    }

    public int getLowStockCount(String userName) {
        return feedDao.getLowStockCount(userName);
    }

    public double getDailyRequirement(String userName) {
        return feedDao.getDailyRequirement(userName);
    }

    public int getEstimatedDaysRemaining(String userName) {
        double totalStock = feedDao.getTotalFeedStock(userName);
        double dailyUsage = feedDao.getTotalDailyConsumption(userName);
        if (dailyUsage <= 0) return 0;
        return (int) Math.floor(totalStock / dailyUsage);
    }

    public boolean updateStock(int feedId, double newAvailableQty) {
        return feedDao.updateStock(feedId, newAvailableQty);
    }

    public boolean addFeed(FeedStock feed) {
        return feedDao.addFeed(feed);
    }
}
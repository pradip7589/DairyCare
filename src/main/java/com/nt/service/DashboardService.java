package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.dao.DashboardDao;

@Service
public class DashboardService {

    @Autowired
    private DashboardDao dashboardDao;

    public int getTotalCattle(String userName) {
        return dashboardDao.getTotalCattle(userName);
    }

    public double getTodaysMilkYield(String userName) {
        return dashboardDao.getTodaysMilkYield(userName);
    }

    public int getFeedStock(String userName) {
        return dashboardDao.getFeedStock(userName);
    }

//    public int getHealthAlertsCount(String userName) {
//        return dashboardDao.getHealthAlertsCount(userName);
//    }
}
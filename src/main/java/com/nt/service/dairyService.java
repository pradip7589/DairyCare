package com.nt.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.dao.dairyDao;
import com.nt.entity.RegisterUser;
import com.nt.entity.milkReport;

@Service
public class dairyService {

	@Autowired
	dairyDao dDao;
	
	public boolean login(String user_name,String password) {

		boolean isLogin=dDao.login(user_name,password);
		return isLogin;
	}

//	public boolean register(RegisterUser r) {
//		String pass = r.getPassword();
//		String cpass=r.getConfirmPassword();
//		if(!pass.equals(cpass)) {
//			return false;
//		}
//		boolean isRegister=dDao.register(r);
//		return isRegister;
//	}

	public boolean milk(milkReport mr,String user_name) {
		float fat=mr.getFat();
		float snf=mr.getSnf();
		float rate = 0;
		if(fat>4.5 || snf>8.5) {
			rate=42.0f;
		}else if(fat>4.0 || snf>8.1) {
			rate=40.0f;
		}else if(fat>3.5 || snf>8.0) {
			rate=38.0f;
		}else if(fat>3.0 || snf>8.0) {
			rate=35.0f;
		}else if(fat<3.0 || snf<7.5) {
			rate=32.0f;
		}
		LocalDate today = LocalDate.now(); 
		mr.setRate(rate);
		mr.setDate(today);
		float ltr=mr.getMilk();
		float amt = ltr*rate;
		mr.setAmount(amt);
		boolean isRegister=dDao.milk(mr,user_name);
		return isRegister;
	}

	public List<milkReport> selectAllRecord(String user_name) {
		return dDao.selectAllRecord(user_name);
	}
	public List<Map<String, Object>> selectLast7DaysMilk(String userName) {
	    return dDao.selectLast7DaysMilk(userName);
	}
}

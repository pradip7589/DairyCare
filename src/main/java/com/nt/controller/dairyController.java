package com.nt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nt.entity.RegisterUser;
import com.nt.entity.milkReport;
import com.nt.service.dairyService;

@Controller
public class dairyController {
	
	@Autowired
	dairyService ds;
	
	@PostMapping("/loginForm")
	public String login(@RequestParam String user_name,
	                    @RequestParam String password,
	                    HttpSession session,
	                    Model m) {

	    boolean isLogin = ds.login(user_name, password);

	    if (isLogin) {
	        session.setAttribute("user", user_name);
	        return "redirect:dashboard";  
	    } else {
	        m.addAttribute("msg", "Invalid username or password");
	        return "login";
	    }
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpSession hs) {
	    hs.invalidate();
	    return "redirect:/index";
	}

//	@RequestMapping("/registrationForm")
//	public String register(@ModelAttribute RegisterUser r, Model m) {
//	    boolean isRegister = ds.register(r);
//
//	    if (isRegister) {
//	        m.addAttribute("msg", "Registration successful!");
//	        return "redirect:/dashboard";
//	    } else {
//	        m.addAttribute("msg", "Invalid username or password");
//	        return "register";
//	    }
//	}

	@RequestMapping("/AddDailyMilkCollection")
	public String milk(@ModelAttribute milkReport mr, Model m,HttpSession session) {
		String user_name=(String) session.getAttribute("user");
	    ds.milk(mr,user_name);
		return "milk";

	}

	@RequestMapping("/report")
	public String report_page(Model m, HttpSession session) {
	    String user_name = (String) session.getAttribute("user");

	    List<milkReport> list = ds.selectAllRecord(user_name);

	    m.addAttribute("stdList", list);
	    return "report";
	}
	
	@GetMapping(value = "/milkChartData", produces = "application/json")
	@ResponseBody
	public Map<String, Object> milkChartData(HttpSession session) {
	    String userName = (String) session.getAttribute("user");

	    List<Map<String, Object>> rows = ds.selectLast7DaysMilk(userName);

	    List<String> labels = new ArrayList<>();
	    List<Double> values = new ArrayList<>();

	    for (Map<String, Object> row : rows) {
	        labels.add((String) row.get("label"));
	        values.add(((Number) row.get("total")).doubleValue());
	    }

	    Map<String, Object> result = new HashMap<>();
	    result.put("labels", labels);
	    result.put("data", values);
	    return result;
	}
}

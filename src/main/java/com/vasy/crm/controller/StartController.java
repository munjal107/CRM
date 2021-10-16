package com.vasy.crm.controller;


import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.vasy.crm.model.activity.Activity;
import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.repo.invoice.InvoiceRepo;
import com.vasy.crm.service.activity.ActivityService;
import com.vasy.crm.service.login.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.service.invoice.InvoiceService;
import com.vasy.crm.service.lead.LeadService;
import com.vasy.crm.service.support.SupportService;

@Controller
public class StartController {

    @Autowired
    LeadService leadService;

    @Autowired
    UserLoginService userLoginService;
    @Autowired
    InvoiceService invoiceService;

    @Autowired
    SupportService supportService;

    @Autowired
    ActivityService activityService;

    @RequestMapping("/login")
    public String showLogin() {
        return "login/login";
    }

    @RequestMapping("/hello")
    public String hello() {
        throw new ResponseStatusException(
                HttpStatus.FORBIDDEN, "Access Denied"
        );

        //return "dashboard-page";
    }

    @RequestMapping("/")
    public ModelAndView Show(HttpSession session) {

        ModelAndView mv = new ModelAndView("dashboard-page");

        String authority = (String) session.getAttribute("authorities");

        if (authority.equalsIgnoreCase("ROLE_ADMIN")) {
            System.out.println(session.getAttribute("userLogin"));
            mv.addObject("totalProfit", invoiceService.getProfit());
            mv.addObject("totalCustomers", leadService.getTotalCustomers());
            mv.addObject("totalLeads", leadService.getTotalLeads());
            mv.addObject("totalSupport", supportService.getSupportCount());

            Date d1 = new Date();
            Calendar c2 = Calendar.getInstance();
            c2.add(Calendar.DATE, -7);
            Date d2 = c2.getTime();

            //  System.out.println(d1 + "\n\n" + d2);

            mv.addObject("weekProfit", invoiceService.getWeekProfit(d2, d1));   //second date should always be after first date
            mv.addObject("weekLeads", leadService.getWeekLeads(d2, d1));
            mv.addObject("weekCustomers", leadService.getWeekCustomers(d2, d1));
            mv.addObject("weekSupport", supportService.getWeekSupportCount(d2, d1));

            List<Map<Double, String>> list = invoiceService.get15daySales();
            String s = list.stream().map(a -> String.valueOf(a.get("created_on"))).collect(Collectors.joining("','"));
            String s1 = list.stream().map(a -> String.valueOf(a.get("total"))).collect(Collectors.joining(","));
            System.err.println(s1);

            //System.err.println(list.get(0).get("total"));

            mv.addObject("sales_date", s);
            mv.addObject("sales_data", s1);
        }

        if (authority.equalsIgnoreCase("ROLE_USER")) {

            UserLogin ul = (UserLogin) session.getAttribute("userLogin");

            ArrayList<Activity> activityList = activityService.getActivityByUser(ul.getId());

            mv.addObject("leadsCreated", leadService.getLeadsByUser(ul.getUsername()).size());
            mv.addObject("activityCount", activityList.size());
        }

        return mv;
    }
}

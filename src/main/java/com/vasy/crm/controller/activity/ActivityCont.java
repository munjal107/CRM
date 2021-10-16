package com.vasy.crm.controller.activity;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.activity.Activity;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.model.master.ActivityList;
import com.vasy.crm.service.activity.ActivityService;
import com.vasy.crm.service.lead.LeadService;
import com.vasy.crm.service.master.ActivityListService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/activity")
public class ActivityCont {

    @Autowired
    LeadService leadService;

    @Autowired
    ActivityService activityService;

    @Autowired
    ActivityListService activityListService;

    @Autowired
    UserAccessController userAccessController;

    @RequestMapping("/view/{id}")
    public ModelAndView viewActivity(@PathVariable() long id, HttpSession session) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("activity/activity-detail");
        String auth = (String) session.getAttribute("authorities");
        //System.out.println("\n\n"+auth+"\n\n"+id+" hello");
        UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

        if (auth.equalsIgnoreCase("ROLE_ADMIN") || userAccessController.chkAuthority(id, userLogin)) {

            Lead ld = leadService.getLeadById(id);
            mv.addObject("lead", ld);

            ArrayList<Activity> activities = activityService.getActivitys(id);
            mv.addObject("activities", activities);

            return mv;

        } else {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN, "Access Denied"
            );
        }

    }

    @RequestMapping("/addActivity")
    public String addActivity(@ModelAttribute() Activity a, @RequestParam("dTime") String dTime, @RequestParam("dDate") String dDate) throws Exception {


        Date dueDate = new SimpleDateFormat("dd/MM/yyyy").parse(dDate);
        Date dueTime = new SimpleDateFormat("hh:mm:ss a").parse(dTime);

        System.out.println(dDate + "  " + dTime + "  " + dueDate + "   " + dueTime);
        a.setDueDate(dueDate);
        a.setDueTime(dueTime);

        long id = a.getLead().getId();
        activityService.addActivity(a);

        ActivityList al = activityListService.getActivityListById(a.getAl().getId());

        Lead lobj = leadService.getLeadById(a.getLead().getId());

        lobj.setLeadStatus(al.getName());

        if (al.getName().equalsIgnoreCase("invoice")) {
            lobj.setCustomer(true);
            leadService.addLead(lobj);
            return "redirect:/invoice/new/" + id;
        }

        leadService.addLead(lobj);

        return "redirect:/activity/view/" + id;
    }


}

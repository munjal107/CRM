package com.vasy.crm.controller.lead;


import java.util.ArrayList;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.service.activity.ActivityService;
import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.service.lead.LeadService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/enquiry")
public class LeadCont {

    @Autowired
    LeadService leadService;

    @Autowired
    ActivityService activityService;

    @Autowired
    UserAccessController userAccessController;

    @RequestMapping("/new")
    public String go() {

        return "leads/new-lead";
    }

    @RequestMapping("/view")
    public String ViewLead() {

        return "leads/view-lead";
    }
	
	
	/*@RequestMapping("/showLeads")
	public ModelAndView ShowLead() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("leads/view-lead");
		
		ArrayList<Lead> alist = leadService.getLeads();
		
		mv.addObject("alist",alist);
		
		return mv;
	}*/

    @RequestMapping("/addLead")
    public String AddLead(@ModelAttribute() Lead lead) {
        leadService.addLead(lead);
        return "redirect:/enquiry/view";
    }
	
	/*@RequestMapping("/deleteLead/{id}")
	public String DeleteLead(@PathVariable()long id) {
		
		Lead obj = leadService.getLeadById(id);
		obj.setDeleted(true);
		leadService.addLead(obj);
		
		return "redirect:/enquiry/showLeads";
		
	}*/

    @RequestMapping("/editLead/{id}")
    public ModelAndView EditLead(@PathVariable() long id, HttpSession session) {

        String auth = (String) session.getAttribute("authorities");
        System.out.println("\n\n" + auth + "\n\n" + id + " hello");
        UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");
        if (auth.equalsIgnoreCase("ROLE_ADMIN") || userAccessController.chkAuthority(id, userLogin)) {
            ModelAndView mv = new ModelAndView();
            mv.setViewName("leads/edit-lead");
            Lead obj = leadService.getLeadById(id);
            mv.addObject("leadObj", obj);
            return mv;

        } else {
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN, "Access Denied"
            );
        }

    }


    @RequestMapping("/getLeads")
    @ResponseBody
    public ArrayList<Lead> getLeads(HttpSession session) {

        String auth = (String) session.getAttribute("authorities");

        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return leadService.getLeads();
        } else {

            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            return userAccessController.getUserLeads(userLogin);
        }


    }

    @RequestMapping("/getLeads/{id}")
    @ResponseBody
    public Lead getLeadById(@PathVariable() long id) {
        return leadService.getLeadById(id);
    }

    @RequestMapping("/getCustomers")
    @ResponseBody
    public ArrayList<Lead> getCorporate(HttpSession session) {

        String auth = (String) session.getAttribute("authorities");

        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return leadService.getCustomers();
        } else {
            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            return userAccessController.getUserCustomers(userLogin);
        }

    }

}

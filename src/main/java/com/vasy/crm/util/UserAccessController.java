package com.vasy.crm.util;


import com.vasy.crm.model.activity.Activity;
import com.vasy.crm.model.estimate.Estimate;
import com.vasy.crm.model.invoice.Invoice;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.model.support.Support;
import com.vasy.crm.service.activity.ActivityService;
import com.vasy.crm.service.estimate.EstimateService;
import com.vasy.crm.service.invoice.InvoiceService;
import com.vasy.crm.service.lead.LeadService;
import com.vasy.crm.service.login.UserLoginService;
import com.vasy.crm.service.support.SupportService;
import com.vasy.crm.service.task.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserAccessController {

    @Autowired
    LeadService leadService;

    @Autowired
    ActivityService activityService;

    @Autowired
    InvoiceService invoiceService;

    @Autowired
    EstimateService estimateService;

    @Autowired
    UserLoginService userLoginService;

    @Autowired
    SupportService supportService;

    @Autowired
    TaskService taskService;

    public ArrayList<Activity> getUserActivity(long id) {

        return activityService.getActivityByUser(id);
    }

    public ArrayList<Lead> getUserLeads(UserLogin userLogin) {


        String uname = userLogin.getUsername();
        // System.out.println("\n"+uname);

        ArrayList<Lead> alist = leadService.getLeadsByUser(uname);
        // System.out.println("\n\n"+alist.size());

        Lead lead;
        ArrayList<Activity> activityList = getUserActivity(userLogin.getId());

        for (Activity a : activityList) {

            lead = a.getLead();
            alist.add(lead);

        }

        List<Lead> alist1 = alist.stream().distinct().collect(Collectors.toList());

        return (ArrayList<Lead>) alist1;
    }


    public boolean chkAuthority(long id, UserLogin userLogin) {

    /*    ArrayList<Lead> alist = getUserLeads(userLogin);

        for(Lead lead: alist){
            System.out.println(lead.getId()+ " aa " +id);
            if(lead.getId()==id){

                return  true;
            }

        }*/

        if (leadService.existsByIdAndCreatedBy(id, userLogin.getUsername()) || activityService.existsByUserObjIdAndLeadId(userLogin.getId(), id)) {
            return true;
        }


        return false;

    }

    public ArrayList<Invoice> getUserInvoice(UserLogin userLogin) {

        ArrayList<Invoice> alist = invoiceService.getInvoiceByUser(userLogin.getUsername());

        ArrayList<Activity> activityList = getUserActivity(userLogin.getId());
        // System.out.println("\n"+activityList.toString()+"\n\n");
        for (Activity a : activityList) {

            ArrayList<Invoice> invoice = invoiceService.getInvoiceByLeadId(a.getLead().getId());

            alist.addAll(invoice);

        }

        List<Invoice> list = alist.stream().distinct().collect(Collectors.toList());

        return (ArrayList<Invoice>) list;
    }

    public ArrayList<Estimate> getUserEstimate(UserLogin userLogin) {

        ArrayList<Estimate> alist = estimateService.getEstimateByUser(userLogin.getUsername());

        ArrayList<Activity> activityList = getUserActivity(userLogin.getId());
        for (Activity a : activityList) {

            ArrayList<Estimate> estimates = estimateService.getEstimateByLeadId(a.getLead().getId());

            alist.addAll(estimates);

        }
        List<Estimate> list = alist.stream().distinct().collect(Collectors.toList());

        return (ArrayList<Estimate>) list;

    }

    public ArrayList<Lead> getUserCustomers(UserLogin userLogin) {

        ArrayList<Lead> arrayList = getUserLeads(userLogin);
        ArrayList<Lead> arrayList1 = new ArrayList<>();

        for (Lead l : arrayList) {
            if (l.isCustomer()) {
                arrayList1.add(l);
            }
        }

        return arrayList1;

    }

    public ArrayList<UserLogin> getUsers(UserLogin userLogin) {

        String name = userLogin.getRole().getName();

        return userLoginService.getUserByRole(name);

    }

    public ArrayList<Support> getUserSupport(UserLogin userLogin) {

        ArrayList<Support> arrayList = supportService.getUserByCreatedBy(userLogin.getUsername());

        arrayList.addAll(taskService.findSupportByUser(userLogin.getId()));

        // System.out.println("\n\n"+arrayList.size()+"\n\n");

        List<Support> list = arrayList.stream().distinct().collect(Collectors.toList());

        return (ArrayList<Support>) list;

    }

    public Support getUserSupport(UserLogin userLogin, long id) {


        ArrayList<Support> arrayList = supportService.getUserByCreatedBy(userLogin.getUsername());

        arrayList.addAll(taskService.findSupportByUser(userLogin.getId()));

        for (Support support : arrayList) {
            if (support.getId() == id) {
                return support;
            }

        }

        return null;

    }

    public boolean chkUserSupport(UserLogin userLogin, long id) {


        ArrayList<Support> arrayList = supportService.getUserByCreatedBy(userLogin.getUsername());

        arrayList.addAll(taskService.findSupportByUser(userLogin.getId()));

        for (Support support : arrayList) {
            if (support.getId() == id) {
                return true;
            }

        }

        return false;

    }

}

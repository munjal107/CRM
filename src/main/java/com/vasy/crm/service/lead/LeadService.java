package com.vasy.crm.service.lead;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.vasy.crm.model.lead.Lead;

public interface LeadService {

    ArrayList<Lead> getLeads();

    ArrayList<Lead> getCustomers();

    Lead addLead(Lead lead);

    Lead getLeadById(long id);

    Lead getCustomerByID(long id);

    long getTotalCustomers();

    long getTotalLeads();

    long getWeekCustomers(Date d1, Date d2);

    long getWeekLeads(Date d1, Date d2);

    ArrayList<Lead> getLeadsByUser(String uname);

    boolean existsByIdAndCreatedBy(long id, String uname);
}

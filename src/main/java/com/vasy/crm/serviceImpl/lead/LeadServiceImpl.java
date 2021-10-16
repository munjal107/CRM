package com.vasy.crm.serviceImpl.lead;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.repo.lead.LeadRepo;
import com.vasy.crm.service.lead.LeadService;

@Service
@Transactional
public class LeadServiceImpl implements LeadService {

    @Autowired
    LeadRepo leadRepo;

    @Override
    public ArrayList<Lead> getLeads() {
        return leadRepo.findByIsDeleted(false);
    }

    @Override
    public Lead addLead(Lead lead) {
        return leadRepo.save(lead);
    }


    @Override
    public Lead getLeadById(long id) {

        return leadRepo.findById(id).orElse(null);
    }

    @Override
    public ArrayList<Lead> getCustomers() {

        return leadRepo.findByIsDeletedAndIsCustomer();
    }

    @Override
    public Lead getCustomerByID(long id) {

        return leadRepo.findCustByid(id);
    }

    @Override
    public long getTotalCustomers() {

        return leadRepo.findTotalCustomers();
    }

    @Override
    public long getTotalLeads() {

        return leadRepo.findTotalLeads();
    }

    @Override
    public long getWeekCustomers(Date d1, Date d2) {
        return leadRepo.findWeekCustomers(d1, d2);
    }

    @Override
    public long getWeekLeads(Date d1, Date d2) {

        return leadRepo.findWeekLeads(d1, d2);
    }

    @Override
    public ArrayList<Lead> getLeadsByUser(String uname) {
        return leadRepo.findByCreatedBy(uname);
    }

    @Override
    public boolean existsByIdAndCreatedBy(long id, String uname) {
        return leadRepo.existsByIdAndCreatedBy(id, uname);
    }
}

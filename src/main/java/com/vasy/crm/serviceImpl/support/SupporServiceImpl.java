package com.vasy.crm.serviceImpl.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.support.Support;
import com.vasy.crm.repo.support.SupportRepo;
import com.vasy.crm.service.support.SupportService;

import java.util.ArrayList;
import java.util.Date;

@Service
public class SupporServiceImpl implements SupportService {

    @Autowired
    SupportRepo supportRepo;

    @Override
    public Support addSupport(Support s) {

        return supportRepo.save(s);
    }

    @Override
    public Support getSupportById(long id) {

        return supportRepo.findById(id).orElse(null);
    }

    @Override
    public Long getSupportCount() {
        return supportRepo.findTotalSupport();
    }

    @Override
    public ArrayList<Support> getSupport() {

        return (ArrayList<Support>) supportRepo.findAll();
    }

    @Override
    public ArrayList<Support> getUserByCreatedBy(String uname) {
        return supportRepo.findByCreatedBy(uname);
    }

    @Override
    public Long getWeekSupportCount(Date d1, Date d2) {
        return supportRepo.findWeekSupport(d1, d2);
    }
}

package com.vasy.crm.serviceImpl.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

//import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vasy.crm.model.master.LeadSource;
import com.vasy.crm.repo.master.LeadSourceRepo;
import com.vasy.crm.service.master.LeadSourceService;

@Service
@Transactional
public class LeadSourceServiceImpl implements LeadSourceService {

    @Autowired
    private LeadSourceRepo leadRepo;

    @Override
    public ArrayList<LeadSource> getLeadSources() {
        // TODO Auto-generated method stub
        return (ArrayList<LeadSource>) leadRepo.findByIsDeleted(false);
    }

    @Override
    public LeadSource addSource(LeadSource ld) {
        // TODO Auto-generated method stub
        return leadRepo.save(ld);
    }

    @Override
    public void deleteSource(long id) {
        // TODO Auto-generated method stub
        LeadSource ld = leadRepo.findById(id).orElse(null);
        ld.setDeleted(true);
        leadRepo.save(ld);
    }

    @Override
    public LeadSource getLeadById(long id) {
        // TODO Auto-generated method stub
        return leadRepo.findById(id).orElse(null);
    }

}

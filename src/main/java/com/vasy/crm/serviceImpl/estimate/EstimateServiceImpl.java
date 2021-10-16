package com.vasy.crm.serviceImpl.estimate;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.estimate.Estimate;
import com.vasy.crm.repo.estimate.EstimateRepo;
import com.vasy.crm.service.estimate.EstimateService;

@Service
public class EstimateServiceImpl implements EstimateService {

    @Autowired
    EstimateRepo estimateRepo;

    @Override
    public long getMaxEstimateNo() {
        // TODO Auto-generated method stub
        return estimateRepo.findEstimateNo();
    }

    @Override
    public Estimate addEstimate(Estimate estimate) {
        // TODO Auto-generated method stub
        return estimateRepo.save(estimate);
    }

    @Override
    public ArrayList<Estimate> getAllEstimate() {
        // TODO Auto-generated method stub
        return (ArrayList<Estimate>) estimateRepo.findAll();
    }

    @Override
    public Estimate getEstimateById(long id) {
        // TODO Auto-generated method stub
        return estimateRepo.findById(id).orElse(null);
    }

    @Override
    public ArrayList<Estimate> getEstimateByUser(String uname) {
        return estimateRepo.findByCreatedBy(uname);
    }

    @Override
    public ArrayList<Estimate> getEstimateByLeadId(long id) {
        return estimateRepo.findByLeadId(id);
    }
}

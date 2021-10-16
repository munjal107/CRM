package com.vasy.crm.service.estimate;

import java.util.ArrayList;

import com.vasy.crm.model.estimate.Estimate;

public interface EstimateService {

    public long getMaxEstimateNo();

    Estimate addEstimate(Estimate estimate);

    ArrayList<Estimate> getAllEstimate();

    Estimate getEstimateById(long id);

    ArrayList<Estimate> getEstimateByUser(String uname);

    ArrayList<Estimate> getEstimateByLeadId(long id);
}

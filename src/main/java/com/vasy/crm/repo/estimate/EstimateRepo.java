package com.vasy.crm.repo.estimate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vasy.crm.model.estimate.Estimate;

import java.util.ArrayList;

public interface EstimateRepo extends JpaRepository<Estimate, Long> {

    @Query(value = "select COALESCE(MAX(estimate_no), 0)  from estimate_tbl", nativeQuery = true)
    public long findEstimateNo();

    ArrayList<Estimate> findByCreatedBy(String uname);

    ArrayList<Estimate> findByLeadId(long id);

}

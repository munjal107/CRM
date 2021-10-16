package com.vasy.crm.repo.master;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.master.LeadSource;

@Repository
public interface LeadSourceRepo extends JpaRepository<LeadSource, Long> {

    ArrayList<LeadSource> findByIsDeleted(boolean b);

}

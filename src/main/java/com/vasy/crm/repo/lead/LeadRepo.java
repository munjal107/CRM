package com.vasy.crm.repo.lead;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.lead.Lead;

@Repository
public interface LeadRepo extends JpaRepository<Lead, Long> {

    ArrayList<Lead> findByIsDeleted(boolean b);

    ArrayList<Lead> findByCreatedBy(String uname);

    @Query(value = "select *from leads where is_customer=true and is_deleted=false", nativeQuery = true)
    ArrayList<Lead> findByIsDeletedAndIsCustomer();


    @Query(value = "select *from leads where is_customer=true and lead_id=?1", nativeQuery = true)
    Lead findCustByid(long id);

    @Query(value = "select COALESCE(COUNT(is_customer), 0)  from leads where is_customer=true ", nativeQuery = true)
    Long findTotalCustomers();


    @Query(value = "select COALESCE(COUNT(lead_id), 0)  from leads ", nativeQuery = true)
    Long findTotalLeads();

    @Query(value = "select COALESCE(COUNT(is_customer), 0)  from leads where created_on BETWEEN ?1 AND ?2 and is_customer=true", nativeQuery = true)
    Long findWeekCustomers(Date d1, Date d2);


    @Query(value = "select COALESCE(COUNT(lead_id), 0)  from leads where created_on BETWEEN ?1 AND ?2 ", nativeQuery = true)
    Long findWeekLeads(Date d1, Date d2);

    boolean existsByIdAndCreatedBy(long id, String uname);

}

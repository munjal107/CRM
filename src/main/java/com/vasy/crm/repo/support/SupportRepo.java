
package com.vasy.crm.repo.support;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.support.Support;

import java.util.ArrayList;
import java.util.Date;

@Repository
public interface SupportRepo extends JpaRepository<Support, Long> {


    @Query(value = "select COALESCE(Max(support_id), 0)  from support_tbl ", nativeQuery = true)
    Long findTotalSupport();

    @Query(value = "select COALESCE(Max(support_id), 0)  from support_tbl where created_on BETWEEN ?1 AND ?2 ", nativeQuery = true)
    Long findWeekSupport(Date d1, Date d2);

    ArrayList<Support> findByCreatedBy(String uname);
}

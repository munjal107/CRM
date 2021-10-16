package com.vasy.crm.repo.activity;

import java.util.ArrayList;

import com.vasy.crm.model.login.UserLogin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.activity.Activity;

@Repository
public interface ActivityRepo extends JpaRepository<Activity, Long> {

    //	@Query(value="select *from activity where lead_id=?1",nativeQuery=true)
    @Query("select a  from Activity a where a.lead.id=?1")
    ArrayList<Activity> findByLead(long id);

    @Query("select a  from Activity a where a.userObj.id=?1")
    ArrayList<Activity> findByUserObj(long id);

    boolean existsByUserObjIdAndLeadId(long id, long id1);

}

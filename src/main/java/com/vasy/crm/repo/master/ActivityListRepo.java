package com.vasy.crm.repo.master;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.master.ActivityList;


@Repository
public interface ActivityListRepo extends JpaRepository<ActivityList, Long> {

    ArrayList<ActivityList> findByIsDeleted(boolean b);

}

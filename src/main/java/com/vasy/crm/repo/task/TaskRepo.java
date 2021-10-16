package com.vasy.crm.repo.task;

import com.vasy.crm.model.support.Support;
import org.springframework.data.jpa.repository.JpaRepository;

import com.vasy.crm.model.task.Task;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


@Repository
public interface TaskRepo extends JpaRepository<Task, Long> {


    @Query("select t.support from Task t where t.userObj.id=?1")
    ArrayList<Support> findByUserObj(long id);


    ArrayList<Task> findBySupportId(long id);

}

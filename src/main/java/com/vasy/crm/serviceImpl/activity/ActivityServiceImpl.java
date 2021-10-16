package com.vasy.crm.serviceImpl.activity;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vasy.crm.model.activity.Activity;
import com.vasy.crm.repo.activity.ActivityRepo;
import com.vasy.crm.service.activity.ActivityService;

@Service
@Transactional
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    ActivityRepo activityRepo;

    @Override
    public Activity addActivity(Activity a) {
        // TODO Auto-generated method stub
        return activityRepo.save(a);
    }

    @Override
    public ArrayList<Activity> getActivitys(long id) {
        // TODO Auto-generated method stub
        return activityRepo.findByLead(id);
    }

    @Override
    public Activity getActivityById(long id) {
        return activityRepo.findById(id).orElse(null);
    }

    @Override
    public ArrayList<Activity> getActivityByUser(long id) {
        return activityRepo.findByUserObj(id);
    }

    @Override
    public boolean existsByUserObjIdAndLeadId(long id, long id1) {
        return activityRepo.existsByUserObjIdAndLeadId(id, id1);
    }
}

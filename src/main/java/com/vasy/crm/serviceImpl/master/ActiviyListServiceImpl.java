package com.vasy.crm.serviceImpl.master;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.master.ActivityList;
import com.vasy.crm.repo.master.ActivityListRepo;
import com.vasy.crm.service.master.ActivityListService;

@Service
public class ActiviyListServiceImpl implements ActivityListService {

    @Autowired
    ActivityListRepo activityRepo;

    @Override
    public ArrayList<ActivityList> getActivityLists() {

        return activityRepo.findByIsDeleted(false);
    }

    @Override
    public void deleteActivityList(long id) {
        // TODO Auto-generated method stub
        ActivityList activityList = activityRepo.findById(id).orElse(null);
        activityList.setDeleted(true);

        activityRepo.save(activityList);
    }

    @Override
    public ActivityList addActivityList(ActivityList al) {
        // TODO Auto-generated method stub
        return activityRepo.save(al);
    }

    @Override
    public ActivityList getActivityListById(long id) {
        // TODO Auto-generated method stub
        return activityRepo.findById(id).orElse(null);
    }

}

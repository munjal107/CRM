package com.vasy.crm.service.activity;

import java.util.ArrayList;

import com.vasy.crm.model.activity.Activity;

public interface ActivityService {

    Activity addActivity(Activity a);

    ArrayList<Activity> getActivitys(long id);

    Activity getActivityById(long id);

    ArrayList<Activity> getActivityByUser(long id);

    boolean existsByUserObjIdAndLeadId(long id, long id1);
}

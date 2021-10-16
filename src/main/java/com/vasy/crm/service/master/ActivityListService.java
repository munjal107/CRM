package com.vasy.crm.service.master;

import java.util.ArrayList;

import com.vasy.crm.model.master.ActivityList;

public interface ActivityListService {

    ArrayList<ActivityList> getActivityLists();

    void deleteActivityList(long id);

    ActivityList addActivityList(ActivityList al);

    ActivityList getActivityListById(long id);

}

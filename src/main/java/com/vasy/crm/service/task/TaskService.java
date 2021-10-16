package com.vasy.crm.service.task;

import com.vasy.crm.model.support.Support;
import com.vasy.crm.model.task.Task;

import java.util.ArrayList;


public interface TaskService {

    Task addTask(Task t);

    ArrayList<Support> findSupportByUser(long id);

    ArrayList<Task> findByTaskSupportId(long id);
}

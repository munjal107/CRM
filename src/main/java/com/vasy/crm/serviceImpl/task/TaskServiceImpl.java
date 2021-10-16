package com.vasy.crm.serviceImpl.task;

import com.vasy.crm.model.support.Support;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.task.Task;
import com.vasy.crm.repo.task.TaskRepo;
import com.vasy.crm.service.task.TaskService;

import java.util.ArrayList;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    TaskRepo taskRepo;

    @Override
    public Task addTask(Task t) {
        // TODO Auto-generated method stub
        return taskRepo.save(t);
    }

    @Override
    public ArrayList<Support> findSupportByUser(long id) {
        return taskRepo.findByUserObj(id);
    }

    @Override
    public ArrayList<Task> findByTaskSupportId(long id) {
        return taskRepo.findBySupportId(id);
    }
}

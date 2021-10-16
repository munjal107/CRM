package com.vasy.crm.controller.task;


import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.model.support.Support;
import com.vasy.crm.model.task.Task;
import com.vasy.crm.service.support.SupportService;
import com.vasy.crm.service.task.TaskService;
import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping("/task")
public class TaskCont {


    @Autowired
    TaskService taskService;

    @Autowired
    SupportService supportService;

    @Autowired
    UserAccessController userAccessController;

    @RequestMapping("/addTask")
    public String addTask(@ModelAttribute() Task t) {

        Support support = supportService.getSupportById(t.getSupport().getId());
        support.setCasePriority(t.getTaskPriority());
        support.setCaseStatus(t.getTaskStatus());
        supportService.addSupport(support);

        taskService.addTask(t);
        return "redirect:/support/view";
    }

    @ResponseBody
    @RequestMapping("/getTaskBySupportId/{id}")
    public ArrayList<Task> getTaskBySupportId(@PathVariable() long id, HttpSession session) {

        // System.out.println("\n\nhelloo  "+ id);

        String auth = (String) session.getAttribute("authorities");

        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return taskService.findByTaskSupportId(id);
        } else {
            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            if (userAccessController.chkUserSupport(userLogin, id)) {
                return taskService.findByTaskSupportId(id);
            }
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN, "Access Denied"
            );
        }
    }

}



package com.vasy.crm.controller.support;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.service.task.TaskService;
import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.vasy.crm.model.support.Support;
import com.vasy.crm.service.support.SupportService;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;


@Controller
@RequestMapping("/support")
public class SupportCont {

    @Autowired
    UserAccessController userAccessController;

    @Autowired
    SupportService supportService;

    @Autowired
    TaskService taskService;

    @RequestMapping("/new")
    public String show() {
        return "support/new-support";
    }

    @RequestMapping("/view")
    public ModelAndView viewSupport() {

        ModelAndView mv = new ModelAndView("support/view-support");


        return mv;
    }

    @RequestMapping("/view1")
    public ModelAndView viewSupport1() {

        ModelAndView mv = new ModelAndView("support/view-support1");

        mv.addObject("supportData", supportService.getSupport());


        return mv;
    }


    @PostMapping("/addSupport")
    public String addSupport(@ModelAttribute() Support s) {

        supportService.addSupport(s);

        return "redirect:/support/view";
    }

    @GetMapping("/getSupport")
    @ResponseBody
    public ArrayList<Support> getSupport(HttpSession session) {

        String auth = (String) session.getAttribute("authorities");
        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return supportService.getSupport();
        } else {

            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            return userAccessController.getUserSupport(userLogin);

        }


    }

    @RequestMapping("/getSupportById/{id}")
    @ResponseBody
    public Support getSupportById(@PathVariable() Long id, HttpSession session) {

        String auth = (String) session.getAttribute("authorities");

        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return supportService.getSupportById(id);
        } else {

            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            if (userAccessController.chkUserSupport(userLogin, id)) {
                return supportService.getSupportById(id);
            }
            throw new ResponseStatusException(
                    HttpStatus.FORBIDDEN, "Access Denied"
            );

        }

    }
}

package com.vasy.crm.controller.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.master.ActivityList;
import com.vasy.crm.service.master.ActivityListService;

@Controller
@RequestMapping("/master")
public class ActivityListCont {

    @Autowired
    ActivityListService activityListService;

    @RequestMapping("/getActivityList")
    public ModelAndView getActivityList() {

        ModelAndView mv = new ModelAndView("master/activitylist");
        ArrayList<ActivityList> alist = activityListService.getActivityLists();
        mv.addObject("alist", alist);
        return mv;


    }

    @RequestMapping("/addActivityList")
    public String addActivityList(@ModelAttribute() ActivityList a) {

        activityListService.addActivityList(a);

        return "redirect:/master/getActivityList";
    }


    @RequestMapping("/editActivityList")
    public String editActivityList(@ModelAttribute() ActivityList a) {

        ActivityList al = activityListService.getActivityListById(a.getId());
        al.setName(a.getName());
        activityListService.addActivityList(al);


        return "redirect:/master/getActivityList";

    }

    @RequestMapping("/deleteActivityList")
    public String deleteActivityList(@RequestParam() long id) {

        activityListService.deleteActivityList(id);

        return "redirect:/master/getActivityList";

    }

    @RequestMapping("/getActList")
    @ResponseBody
    public ArrayList<ActivityList> getAlist() {

        return activityListService.getActivityLists();

    }


}

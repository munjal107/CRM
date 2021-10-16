package com.vasy.crm.controller.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.master.Outcome;
import com.vasy.crm.service.master.OutcomeService;

@Controller
@RequestMapping("/master")
public class OutcomeCont {

    @Autowired
    OutcomeService outcomeService;

    @RequestMapping("/showOutcome")
    public ModelAndView showOutcome() {
        ModelAndView mv = new ModelAndView("master/outcome");

        ArrayList<Outcome> alist = outcomeService.getOutcome();
        mv.addObject("alist", alist);

        return mv;

    }

    @RequestMapping("/addOutcome")
    public String addOutcome(Outcome obj) {

        outcomeService.addOutcome(obj);

        return "redirect:/master/showOutcome";
    }

    @RequestMapping("/deleteOutcome")
    public String deleteOutcome(@RequestParam() long id) {

        outcomeService.deleteOutcome(id);

        return "redirect:/master/showOutcome";
    }

    @RequestMapping("/editOutcome")
    public String editOutcome(@ModelAttribute() Outcome obj) {

        Outcome ob = outcomeService.getOutcomeById(obj.getId());
        ob.setName(obj.getName());
        outcomeService.addOutcome(ob);

        return "redirect:/master/showOutcome";
    }


    @RequestMapping("/getOutcome")
    @ResponseBody
    public ArrayList<Outcome> getOutcome() {

        return outcomeService.getOutcome();
    }


}

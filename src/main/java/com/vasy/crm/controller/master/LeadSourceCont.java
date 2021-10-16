package com.vasy.crm.controller.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.master.LeadSource;
import com.vasy.crm.service.master.LeadSourceService;

@Controller
@RequestMapping("/master")
public class LeadSourceCont {

    @Autowired
    private LeadSourceService leadService;

    @RequestMapping("/getSource")
    public ModelAndView showLeadSource() {
        ModelAndView mv = new ModelAndView("master/leadsource");

        ArrayList<LeadSource> alist = new ArrayList<>();
        alist = leadService.getLeadSources();
        mv.addObject("alist", alist);
        return mv;
    }

    @RequestMapping("/addSource")
    public String addSource(@ModelAttribute() LeadSource ld) {

        leadService.addSource(ld);
        //System.out.println(ld.getSourceName());
        return "redirect:/master/getSource";
    }

    @RequestMapping("/editSource")
    public String editSource(@ModelAttribute() LeadSource ld) {


        LeadSource lead = leadService.getLeadById(ld.getId());
        lead.setSourceName(ld.getSourceName());

        leadService.addSource(lead);

        return "redirect:/master/getSource";

    }

    @RequestMapping("/deleteSource")
    public String deleteSource(@RequestParam() long id) {

        leadService.deleteSource(id);

        return "redirect:/master/getSource";

    }

    @RequestMapping("/getLeadSource")
    @ResponseBody
    public ArrayList<LeadSource> getLeadSource() {
        return leadService.getLeadSources();
    }


}

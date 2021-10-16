package com.vasy.crm.controller.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.master.BusinessCategory;

import com.vasy.crm.service.master.BusinessCategoryService;

@Controller
@RequestMapping("/master")
public class BusiCategoryCont {

    @Autowired
    private BusinessCategoryService businessService;

    @RequestMapping("/getCategory")
    public ModelAndView getCategory() {
        ModelAndView mv = new ModelAndView("master/businesscategory");

        ArrayList<BusinessCategory> alist = new ArrayList<>();
        alist = businessService.getBusinessCategories();
        mv.addObject("alist", alist);
        return mv;
    }

    @RequestMapping("/addCategory")
    public String addCategory(@ModelAttribute() BusinessCategory b) {

        businessService.addBusinessCategory(b);

        return "redirect:/master/getCategory";
    }

    @RequestMapping("/deleteCategory")
    public String deleteCategory(@RequestParam() long id) {
        businessService.deleteBusinessCategory(id);
        return "redirect:/master/getCategory";
    }

    @RequestMapping("/editCategory")
    public String editCategory(@ModelAttribute() BusinessCategory b) {

        BusinessCategory businessCategory = businessService.getCategoryById(b.getId());
        businessCategory.setName(b.getName());

        businessService.addBusinessCategory(businessCategory);

        return "redirect:/master/getCategory";

    }

    @RequestMapping("/getBusinessCategory")
    @ResponseBody
    public ArrayList<BusinessCategory> GetBusinessCategories() {
        return businessService.getBusinessCategories();
    }

}

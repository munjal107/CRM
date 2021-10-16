package com.vasy.crm.controller.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.vasy.crm.model.master.Package;
import com.vasy.crm.service.master.PackageService;

@Controller
@RequestMapping("/master")
public class PackageCont {

    @Autowired
    PackageService packageService;

    @RequestMapping("/getPackage")
    public ModelAndView getPackage() {

        ModelAndView mv = new ModelAndView("master/package");
        ArrayList<Package> alist = packageService.getPackage();
        mv.addObject("alist", alist);
        return mv;

    }


    @RequestMapping("/addPackage")
    public String addPackage(@ModelAttribute() Package a) {

        packageService.addPAckage(a);

        return "redirect:/master/getPackage";
    }

    @RequestMapping("/editPackage")
    public String editPackage(@ModelAttribute() Package p) {

        /*
         * Package p = packageService.getPackageById(a.getId());
         *
         *
         * p.setProductName(a.getProductName());
         *
         *
         * p.setTax(a.getTax());
         */

        packageService.addPAckage(p);
        return "redirect:/master/getPackage";

    }

    @RequestMapping("/deletePackage")
    public String deletePackage(@RequestParam() long id) {

        packageService.deletePackage(id);

        return "redirect:/master/getPackage";

    }

    @RequestMapping("/getPackagelist")
    @ResponseBody
    public ArrayList<Package> getPackages() {

        return packageService.getPackage();

    }

    @RequestMapping("/getPackage/{id}")
    @ResponseBody
    public Package getPackageByID(@PathVariable() long id) {

        return packageService.getPackageById(id);

    }


}

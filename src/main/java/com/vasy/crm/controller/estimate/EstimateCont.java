package com.vasy.crm.controller.estimate;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.util.JasperExporter;
import com.vasy.crm.util.UserAccessController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.vasy.crm.model.estimate.Estimate;
import com.vasy.crm.model.invoice.Invoice;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.service.estimate.EstimateService;
import com.vasy.crm.service.lead.LeadService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/estimate")
public class EstimateCont {

    @Autowired
    UserAccessController userAccessController;

    @Autowired
    LeadService leadService;

    @Autowired
    EstimateService estimateService;

    HashMap jasperParameter;

    @RequestMapping("/new")
    public ModelAndView addInvoice() {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("estimate/new-estimate");

        long estimateNo = estimateService.getMaxEstimateNo();
        estimateNo++;

        mv.addObject("estimateNo", estimateNo);

        return mv;
    }

    @PostMapping("/addEstimate")
    public String addInvoice(@ModelAttribute() Estimate estimate, @RequestParam("dDate") String dDate) throws Exception {

        Date dueDate = new SimpleDateFormat("dd/MM/yyyy").parse(dDate);
        String dueDate1 = new SimpleDateFormat("dd/MM/yyyy").format(dueDate);//   parse("20/12/2019");
        //System.out.println("\n "+ estimate.getInvoicePackages().size());
        //System.out.println("\n " + dueDate+ "    "+dueDate1 );
        estimate.setDueDate(dueDate);

        estimateService.addEstimate(estimate);
        return "redirect:/estimate/view";

    }

    @RequestMapping("/view")
    public String viewEstimate() {
        return "estimate/view-estimate";
    }

    @ResponseBody
    @RequestMapping("/getAllEstimate")
    public ArrayList<Estimate> getEstimate(HttpSession session) {

        String auth = (String) session.getAttribute("authorities");

        if (auth.equalsIgnoreCase("ROLE_ADMIN")) {
            return estimateService.getAllEstimate();
        } else {

            UserLogin userLogin = (UserLogin) session.getAttribute("userLogin");

            return userAccessController.getUserEstimate(userLogin);
        }


    }

    @RequestMapping("/viewEstimate/{id}")
    public ModelAndView customerInvoice(@PathVariable() long id) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("estimate/customer-estimate");

        Estimate estimate = estimateService.getEstimateById(id);

        String[] plist = estimate.getPackageName().split(",");
        //	System.out.println("\n\n"+plist.toString());
        String[] rlist = estimate.getPackageAmount().split(",");

        mv.addObject("iData", estimate);
        mv.addObject("plist", plist);
        mv.addObject("rlist", rlist);

        return mv;
    }


    @GetMapping("/print-estimate/{paymentId}")
    public void printInvoice(@PathVariable(value = "paymentId") Integer paymentId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        jasperParameter = new HashMap<>();
        jasperParameter.put("payment_id", paymentId);

        JasperExporter jasperexport = new JasperExporter();
        String url = request.getSession().getServletContext().getRealPath("/") + "report" + System.getProperty("file.separator") + "Estimate_Table_Based.jrxml";
        try {

            jasperexport.jasperExporterPDF(jasperParameter, url.toString(), "invoice", response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
